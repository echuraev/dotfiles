" Neovim native stack configuration. Plain Vim keeps using the VimScript
" plugins (vim-lsp, ale, anyfold, gitgutter, ...) which are gated behind
" !has('nvim') in vim-plug.vimrc.
if !has('nvim')
    finish
endif

lua << EOF
-- Bail out cleanly on first launch, before :PlugInstall has fetched plugins.
if not pcall(require, 'nvim-treesitter.configs') then
  vim.schedule(function()
    vim.notify('Neovim plugins are not installed yet. Run :PlugInstall, then restart nvim.', vim.log.levels.WARN)
  end)
  return
end

----------------------------------------------------------------------
-- Treesitter: highlight, indent, text objects
----------------------------------------------------------------------
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c', 'cpp', 'cuda', 'cmake', 'python', 'lua', 'vim', 'vimdoc',
    'bash', 'json', 'yaml', 'toml', 'markdown', 'markdown_inline',
    'proto', 'glsl',
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer', ['if'] = '@function.inner',
        ['ac'] = '@class.outer',    ['ic'] = '@class.inner',
        ['aa'] = '@parameter.outer',['ia'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      goto_next_start     = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
      goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
    },
  },
})

-- Treesitter folding for code filetypes only (mirrors the old anyfold list),
-- so the marker folding used by the dotfiles' own .vimrc files is untouched.
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'cuda', 'python', 'lua', 'cmake', 'java' },
  callback = function()
    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.opt_local.foldlevel = 99
  end,
})

----------------------------------------------------------------------
-- Completion: blink.cmp
----------------------------------------------------------------------
require('mason').setup()
require('blink.cmp').setup({
  -- 'default' preset keeps <CR> free: accept with <C-y> (matches the old
  -- pumvisible()?<C-y> habit), <C-space> toggles, <C-n>/<C-p> select.
  keymap = { preset = 'default' },
  appearance = { nerd_font_variant = 'mono' },
  completion = { documentation = { auto_show = true } },
  signature = { enabled = true },
})
local caps = require('blink.cmp').get_lsp_capabilities()

----------------------------------------------------------------------
-- LSP (native, nvim 0.11+ vim.lsp.config/enable API)
----------------------------------------------------------------------
vim.lsp.config('clangd', {
  cmd = { 'clangd', '--background-index', '--header-insertion=iwyu', '--clang-tidy' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = { 'compile_commands.json', '.clangd', '.git' },
  capabilities = caps,
})
vim.lsp.config('pylsp', {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', '.git' },
  capabilities = caps,
})
vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  capabilities = caps,
})

-- ffi-navigator: TVM's cross-language (Python <-> C++) jump server.
if vim.fn.executable('ffi-navigator') == 1 then
  vim.lsp.config('ffi_navigator', {
    cmd = { 'python', '-m', 'ffi_navigator.langserver' },
    filetypes = { 'python', 'cpp', 'c' },
    root_markers = { 'compile_commands.json', '.git' },
    capabilities = caps,
  })
  vim.lsp.enable('ffi_navigator')
end

-- Only enable servers whose executable is actually present (no error noise).
local want = { clangd = 'clangd', pylsp = 'pylsp', ruff = 'ruff' }
local enable = {}
for server, exe in pairs(want) do
  if vim.fn.executable(exe) == 1 then table.insert(enable, server) end
end
if #enable > 0 then vim.lsp.enable(enable) end

vim.diagnostic.config({
  virtual_text = { prefix = '‣' },
  float = { border = 'rounded' },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✗',
      [vim.diagnostic.severity.WARN]  = '‼',
      [vim.diagnostic.severity.HINT]  = '!',
      [vim.diagnostic.severity.INFO]  = '»',
    },
  },
})

-- Buffer-local LSP keymaps. These keep the muscle memory of the old vim-lsp
-- bindings and, being buffer-local, take precedence over the global maps.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local b = ev.buf
    local function map(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = b, silent = true, desc = desc })
    end
    map('<leader>g',  vim.lsp.buf.definition,             'LSP: definition')
    map('<leader>gd', vim.lsp.buf.type_definition,        'LSP: type definition')
    map('<leader>gi', vim.lsp.buf.implementation,         'LSP: implementation')
    map('<leader>gr', require('fzf-lua').lsp_references,  'LSP: references')
    map('<leader>D',  vim.lsp.buf.hover,                  'LSP: hover docs')
    map('<leader>rn', vim.lsp.buf.rename,                 'LSP: rename')
    map('<leader>qf', vim.lsp.buf.code_action,            'LSP: code action')
    map('[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'Prev diagnostic')
    map(']d', function() vim.diagnostic.jump({ count =  1, float = true }) end, 'Next diagnostic')
  end,
})

----------------------------------------------------------------------
-- fzf-lua : LSP pickers and live grep (<leader>s* to avoid the <leader>f maps)
----------------------------------------------------------------------
require('fzf-lua').setup({})
local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>sg', fzf.live_grep,                  { desc = 'Grep' })
vim.keymap.set('n', '<leader>sw', fzf.grep_cword,                 { desc = 'Grep word under cursor' })
vim.keymap.set('n', '<leader>ss', fzf.lsp_document_symbols,       { desc = 'Document symbols' })
vim.keymap.set('n', '<leader>sS', fzf.lsp_live_workspace_symbols, { desc = 'Workspace symbols' })
vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document,       { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>sr', fzf.resume,                     { desc = 'Resume last picker' })

----------------------------------------------------------------------
-- trouble.nvim
----------------------------------------------------------------------
require('trouble').setup({})
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>',                 { desc = 'Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',    { desc = 'Buffer diagnostics' })
vim.keymap.set('n', '<leader>xs', '<cmd>Trouble symbols toggle<cr>',                     { desc = 'Symbols (Trouble)' })
vim.keymap.set('n', '<leader>xq', '<cmd>Trouble qflist toggle<cr>',                      { desc = 'Quickfix (Trouble)' })

----------------------------------------------------------------------
-- gitsigns.nvim (<leader>G* prefix; <leader>h is taken by :History)
----------------------------------------------------------------------
require('gitsigns').setup({
  on_attach = function(buf)
    local gs = require('gitsigns')
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end
    map('n', ']c', function() gs.nav_hunk('next') end, 'Next git hunk')
    map('n', '[c', function() gs.nav_hunk('prev') end, 'Prev git hunk')
    map('n', '<leader>Gs', gs.stage_hunk,                       'Stage hunk')
    map('n', '<leader>Gr', gs.reset_hunk,                       'Reset hunk')
    map('n', '<leader>Gp', gs.preview_hunk,                     'Preview hunk')
    map('n', '<leader>Gb', function() gs.blame_line({ full = true }) end, 'Blame line')
    map('n', '<leader>Gd', gs.diffthis,                         'Diff this')
  end,
})

----------------------------------------------------------------------
-- conform.nvim : formatting
----------------------------------------------------------------------
require('conform').setup({
  formatters_by_ft = {
    c = { 'clang_format' }, cpp = { 'clang_format' }, cuda = { 'clang_format' },
    python = { 'ruff_format' },
    lua = { 'stylua' },
    cmake = { 'cmake_format' },
    sh = { 'shfmt' },
    json = { 'jq' },
  },
  -- Preserve the old "format Rust/Go on save" behaviour via their LSP/tools.
  format_on_save = function(bufnr)
    local ft = vim.bo[bufnr].filetype
    if ft == 'rust' or ft == 'go' then
      return { timeout_ms = 2000, lsp_format = 'fallback' }
    end
  end,
})
vim.keymap.set({ 'n', 'x' }, '<leader>F', function()
  require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = 'Format buffer/selection' })

----------------------------------------------------------------------
-- aerial.nvim : symbol outline (replaces tagbar in nvim)
----------------------------------------------------------------------
require('aerial').setup({})
vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<cr>', { desc = 'Outline (Aerial)' })

----------------------------------------------------------------------
-- which-key.nvim : keybinding discovery
----------------------------------------------------------------------
require('which-key').setup({})

----------------------------------------------------------------------
-- flash.nvim : fast motions (s = jump, S = treesitter select)
----------------------------------------------------------------------
require('flash').setup({})
vim.keymap.set({ 'n', 'o' }, 's', function() require('flash').jump() end,       { desc = 'Flash jump' })
vim.keymap.set({ 'n', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
EOF

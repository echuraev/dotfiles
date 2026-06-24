" Neovim native stack configuration. Plain Vim keeps using the VimScript
" plugins (vim-lsp, ale, anyfold, gitgutter, ...) which are gated behind
" !has('nvim') in vim-plug.vimrc.
"
" NOTE: keybindings for these plugins live in key-bindings.vimrc (under the
" `if has('nvim')` blocks), not here. Only plugin setup/behaviour lives in this
" file. The exceptions are keymaps that are part of a plugin's own setup table
" (Treesitter text objects, blink.cmp completion menu) and therefore cannot be
" expressed as standalone mappings.
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

----------------------------------------------------------------------
-- Plugin setup (keybindings are in key-bindings.vimrc)
----------------------------------------------------------------------
require('fzf-lua').setup({})
require('trouble').setup({})
require('gitsigns').setup({})
require('aerial').setup({})
require('which-key').setup({})

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

-- Disable the char module so flash does NOT remap , and ; (','/leader clash).
require('flash').setup({ modes = { char = { enabled = false } } })
EOF

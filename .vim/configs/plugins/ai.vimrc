" AI assistants (Neovim only). Three complementary options:
"   * coder/claudecode.nvim - drives the Claude Code CLI (IDE-grade: sends
"     selections, @-mentions files, shows diffs).
"   * olimorris/codecompanion.nvim - in-editor chat + inline edits via the
"     Anthropic API (needs ANTHROPIC_API_KEY).
"   * yetone/avante.nvim - Cursor-like sidebar with diff-apply (Anthropic API).
"
" Keybindings for claudecode/codecompanion live in key-bindings.vimrc. Avante
" is the exception: it registers its own keymaps from the setup table below
" (no clean way to disable them under vim-plug), so they stay here and are
" relocated to the <leader>v prefix to avoid clashing with the <leader>a maps.
if !has('nvim')
    finish
endif

lua << EOF
-- mapleader must match key-bindings.vimrc; this file is sourced before it is
-- set there, and avante reads <leader> from its setup table below.
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Bail out cleanly on first launch, before :PlugInstall has fetched plugins.
if not pcall(require, 'claudecode') then
  return
end

-- claudecode.nvim : Claude Code CLI integration
require('claudecode').setup({})

-- codecompanion.nvim : chat + inline edits via the Anthropic API
if pcall(require, 'codecompanion') then
  require('codecompanion').setup({
    strategies = {
      chat   = { adapter = 'anthropic' },
      inline = { adapter = 'anthropic' },
    },
  })
end

-- avante.nvim : Cursor-like sidebar. Its keymaps are relocated to <leader>v.
if pcall(require, 'avante') then
  require('avante').setup({
    provider = 'claude',
    mappings = {
      ask = '<leader>va', new_ask = '<leader>vn', zen_mode = '<leader>vz',
      edit = '<leader>ve', refresh = '<leader>vr', focus = '<leader>vf',
      stop = '<leader>vS',
      toggle = {
        default = '<leader>vt', debug = '<leader>vd', selection = '<leader>vC',
        suggestion = '<leader>vs', repomap = '<leader>vR',
      },
      files = { add_current = '<leader>vc', add_all_buffers = '<leader>vB' },
      select_model = '<leader>v?', select_history = '<leader>vh',
      select_acp_model = '<leader>vM', select_acp_mode = '<leader>vm',
    },
  })
end
EOF

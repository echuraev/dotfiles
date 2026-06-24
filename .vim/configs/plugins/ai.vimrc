" AI assistants (Neovim only). Three complementary options are wired up; they
" overlap, so disable whichever you don't use:
"   * coder/claudecode.nvim - drives the Claude Code CLI (IDE-grade: sends
"     selections, @-mentions files, shows diffs).      Prefix: <leader>a
"   * olimorris/codecompanion.nvim - in-editor chat + inline edits via the
"     Anthropic API (needs ANTHROPIC_API_KEY).         Prefix: <leader>a {p,x,i}
"   * yetone/avante.nvim - Cursor-like sidebar with diff-apply (Anthropic API).
"                                                       Prefix: <leader>v
if !has('nvim')
    finish
endif

lua << EOF
-- Bail out cleanly on first launch, before :PlugInstall has fetched plugins.
if not pcall(require, 'claudecode') then
  return
end

----------------------------------------------------------------------
-- claudecode.nvim : Claude Code CLI integration
----------------------------------------------------------------------
require('claudecode').setup({})

vim.keymap.set('n', '<leader>ac', '<cmd>ClaudeCode<cr>',            { desc = 'Claude: toggle' })
vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>',       { desc = 'Claude: focus' })
vim.keymap.set('n', '<leader>aC', '<cmd>ClaudeCode --continue<cr>', { desc = 'Claude: continue' })
vim.keymap.set('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>',   { desc = 'Claude: resume' })
vim.keymap.set('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>',       { desc = 'Claude: add current file' })
vim.keymap.set('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>',        { desc = 'Claude: send selection' })

----------------------------------------------------------------------
-- codecompanion.nvim : chat + inline edits via the Anthropic API
----------------------------------------------------------------------
if pcall(require, 'codecompanion') then
  require('codecompanion').setup({
    strategies = {
      chat   = { adapter = 'anthropic' },
      inline = { adapter = 'anthropic' },
    },
  })
  vim.keymap.set({ 'n', 'v' }, '<leader>ap', '<cmd>CodeCompanionActions<cr>',     { desc = 'CodeCompanion: actions' })
  vim.keymap.set({ 'n', 'v' }, '<leader>ax', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CodeCompanion: chat' })
  vim.keymap.set('v',          '<leader>ai', '<cmd>CodeCompanion<cr>',            { desc = 'CodeCompanion: inline' })
end

----------------------------------------------------------------------
-- avante.nvim : Cursor-like sidebar (prefix <leader>v to avoid clashes)
----------------------------------------------------------------------
if pcall(require, 'avante') then
  require('avante').setup({
    provider = 'claude',
    mappings = {
      ask     = '<leader>va',
      edit    = '<leader>ve',
      refresh = '<leader>vr',
    },
  })
end
EOF

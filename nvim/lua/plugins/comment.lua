--[[
This plugin provides easy ways to comment/uncomment lines of code in any language. 
It's extremely useful for quickly commenting out sections of code while debugging or making notes.

Key features:
  Language-aware commenting (uses the correct comment style for each language)
  Works in both normal and visual modes
  Supports line and block comments

Default keybindings:
  gcc - Toggle comment on the current line
  gc in visual mode - Toggle comment on the selected lines
  gbc - Toggle block comment on current line
  gb in visual mode - Toggle block comment on selection

Example:
  If you have const x = 5; and press gcc, it becomes // const x = 5;
  If you select multiple lines and press gc, they all get commented with //
  If you use gbc instead, it might use /* const x = 5; */ for block comments

The `config = true` means it uses the default configuration, which works well out of the box for most users.
]]

return {
  'numToStr/Comment.nvim',
  config = true, -- Uses default configuration
  keys = {
    { 'gcc', mode = 'n', desc = 'Comment line' }, -- gcc to comment current line
    { 'gc', mode = 'v', desc = 'Comment selection' }, -- gc + motion to comment selection
  },
}

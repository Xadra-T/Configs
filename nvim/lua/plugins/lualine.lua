--[[
Lualine is a status line that shows useful information at the bottom of editor:
    Shows current mode, filename, git branch, diagnostics, etc.
    Configured to use the onedark theme to match colorscheme
    Uses simple separators ('|' and empty string) for a clean look
]]

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'onedark',
          component_separators = '|', -- { left = '|', right = '|'}
          section_separators = '', -- { left = '', right = ''}
        },
      })
    end,
  }
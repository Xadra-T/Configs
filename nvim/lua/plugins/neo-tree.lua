return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle File Explorer' },
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true,
        window = {
          width = 30, -- 30-pixel width for the sidebar
        },
        filesystem = {
          follow_current_file = true, -- Following the current file when navigating
          hijack_netrw_behavior = 'open_default', -- NeoTree will replace the default netrw file browser. 'open_current' (open in current window), 'disabled' (don't replace netrw)
          filtered_items = {
            visible = true,
            hide_dotfiles = false, -- Showing dotfiles
            hide_gitignored = false, -- and gitignored files
          },
        },
      })
    end,
  }
-- A plugin designed to help users discover and remember keybindings by displaying a popup with available keybindings as we type.
-- Supports automatic or manual trigger setup for keybindings, with options to defer popup display for specific operators (e.g., y or d).
-- When you press a leader key (e.g., <leader> or a prefix like <C-w>), WhichKey shows a popup listing all possible keybindings that follow, along with their descriptions.
return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('which-key').setup({
        win = {
          border = 'single', -- 'rounded'
        },
      })
      --[[
      Default Behavior:
        Auto-triggering the popup when we pause after pressing a prefix key (e.g., <leader>).
        Showing keybindings in Normal, Visual, and other modes.
        Enabling built-in plugins like marks and registers.
        A slight delay (default: 1000ms) before showing the popup to avoid flickering during fast typing.
      ]]
      
      require('which-key').register({
        -- {
        --   { "<leader>c", group = "code" }, -- find-related actions like searching files or buffers
        --   { "<leader>f", group = "find" }, -- code-related keybindings like formatting, debugging, or LSP actions
        -- }
        {
          { "", group = "find" },
          { "", group = "code" },
        }
      })
    end,
  }

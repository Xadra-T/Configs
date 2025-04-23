return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    local themes = { "kanagawa", "kanagawa-wave", "kanagawa-dragon", "kanagawa-lotus" }
    local idx = 1

    require("kanagawa").setup({
      transparent = true,
      terminalColors = true, -- set terminal colors
      dimInactive = false,
      styles = {
        comment = { italic = true },
        keyword = { italic = false },
        type = { italic = false },
        statement = { bold = false },
        variable = {},
        -- etc, see docs for more
      },
      overrides = function(colors)
        return {
          -- Make diagnostic virtual text bg transparent
          DiagnosticVirtualTextError = { bg = "NONE" },
          DiagnosticVirtualTextWarn  = { bg = "NONE" },
          DiagnosticVirtualTextInfo  = { bg = "NONE" },
          DiagnosticVirtualTextHint  = { bg = "NONE" },
        }
      end,
    })
    vim.cmd.colorscheme(themes[idx])

    -- Key to cycle themes
    vim.keymap.set("n", "<leader>th", function()
      idx = (idx % #themes) + 1 -- kanagawa, kanagawa-wave, kanagawa-lotus, kanagawa-dragon
      vim.cmd.colorscheme(themes[idx])
    end, { noremap = true, silent = true })
  end,
}

return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    local opts = {
      style = "dark",         -- "dark" or "light"
      transparent = true,     -- Enable transparent background
      italic_comments = true, -- Enable italic comments
    }

    -- Function to apply the theme with current options
    local function apply_vscode()
      require("vscode").setup(opts)
      vim.cmd.colorscheme("vscode")
      -- Transparent diagnostic virtual text
      vim.cmd([[
        highlight DiagnosticVirtualTextError guibg=NONE
        highlight DiagnosticVirtualTextWarn guibg=NONE
        highlight DiagnosticVirtualTextInfo guibg=NONE
        highlight DiagnosticVirtualTextHint guibg=NONE
      ]])
    end

    apply_vscode()

    -- Key: <leader>th to toggle style between dark/light
    vim.keymap.set("n", "<leader>th", function()
      opts.style = opts.style == "dark" and "light" or "dark"
      apply_vscode()
    end, { noremap = true, silent = true })

    -- Key: <leader>bg to toggle transparent background
    vim.keymap.set("n", "<leader>bg", function()
      opts.transparent = not opts.transparent
      apply_vscode()
    end, { noremap = true, silent = true })
  end,
}

-- Custom code snippets for different purposes

-- Prevent LSP from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- Appearance of diagnostics
-- Visual Format:
--     Uses ● symbol prefix for all diagnostics
--     Shows error codes in square brackets when available
--     Combines code and message in a clean format
vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    -- Add a custom format function to show error codes
    format = function(diagnostic)
      local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
      return string.format('%s %s', code, diagnostic.message)
    end,
  },
  underline = false,  -- Disable underlining of diagnostic locations
  update_in_insert = true,  -- Update diagnostics even while typing
  float = {
    source = 'always', -- Or 'if_many'  -- Always shows diagnostic sources in floating windows
  },
  -- Make diagnostic background transparent
  on_ready = function()
    vim.cmd 'highlight DiagnosticVirtualText guibg=NONE'
  end,
}

-- Highlight on yank
-- This creates a visual feedback system for yanked (copied) text:
--     Creates a dedicated autocommand group named 'YankHighlight'
--     Triggers whenever text is yanked (copied)
--     Highlights the copied text temporarily after yanking
--     Works globally (pattern '*') for all file types
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- auto-remove ^M on write (save):
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\r//ge]]) -- The e flag at the end tells Vim to not show an error when the pattern isn't found.
  end,
})

-- If you're using Ruff alongside another language server (like Pyright), you may want to defer to that language server for certain capabilities, like textDocument/hover:
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of another language server
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})


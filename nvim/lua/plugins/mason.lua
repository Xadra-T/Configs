--[[
This plugin simplifies the installation and management of LSP servers, DAP servers, linters, and formatters.
It acts as a package manager, allowing to install tools like pyright (Python LSP) or rust-analyzer (Rust LSP) without manually downloading and configuring them.
Mason is not required to use LSP servers, but it makes the process much easier by automating installation and ensuring the servers are in PATH.
]]

return {
  'williamboman/mason.nvim',
  dependencies = { 'williamboman/mason-lspconfig.nvim' },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'pylyzer', 'rust_analyzer', }, -- Install these LSP servers
      automatic_installation = true, -- Auto-install when lspconfig setups are called
    })
  end,
}

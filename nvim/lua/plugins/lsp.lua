-- This plugin sets up code intelligence features like auto-completion, go-to-definition, and error checking.
-- Code completion with multiple sources: LSP suggestions, Buffer text, Filesystem paths, Snippets via LuaSnip
return {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- Python: pylyzer (for IDE features)
      lspconfig.pylyzer.setup({
        settings = {
          python = {
            checkOnType = false,
            diagnostics = true,
            inlayHints = true,
            smartCompletion = true,
          }
        }
      })
      
      -- -- Python: ruff (for linting)
      -- lspconfig.ruff.setup({
      --   capabilities = capabilities,
      -- })
      
      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
          }
        }
      })
      
      -- Rust
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
      

      -- Basic completion setup
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      
      cmp.setup({
        completion = {
          autocomplete = { trigger_length = 1 } -- At least one character is needed to show completion
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(), -- Abort or cancel the current completion session, closing the completion menu if it's open.
          ['<C-Space>'] = cmp.mapping.complete(), -- Trigger with 'Ctrl+Space'
          ['<C-CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm with 'Ctrl Enter'
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  }

-- Treesitter provides better syntax highlighting and code understanding.
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- TSUpdate command is set as a build step to keep parsers updated
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'bash', 'dockerfile', 'json', 'lua', 'markdown', 'markdown_inline', 'python', 'regex', 'rust', 'sql', 'vim' },
      highlight = { enable = true },
      indent = { enable = true }, -- Enables smart indentation
    })
  end,
}

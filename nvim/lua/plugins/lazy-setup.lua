local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require('lazy').setup({
  -- { import = 'plugins' }, -- Import all plugins
  { import = 'plugins.alpha' },
  { import = 'plugins.autopairs' },
  { import = 'plugins.comment' },
  { import = 'plugins.gitsigns' },
  { import = 'plugins.indent-blankline' },
  { import = 'plugins.lsp' },
  { import = 'plugins.lualine' },
  { import = 'plugins.mason' },
  { import = 'plugins.neo-tree' },
  { import = 'plugins.nvim-dap'},
  { import = 'plugins.telescope' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.undotree' },
  { import = 'plugins.vscode_theme'},
  { import = 'plugins.which-key' },
    'echasnovski/mini.icons',
    'microsoft/python-type-stubs'
}, {
  -- Exclude the current file to avoid recursion. This makes sure lazy doesn't try to load lazy-setup.lua as a plugin
  change_detection = {
    notify = false,
  },
})

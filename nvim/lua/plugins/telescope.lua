-- Telescope is a highly extensible fuzzy finder. It helps searching for files, text patterns, and more.
return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' }, -- Find files in the project
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Grep Files' }, -- Search for text patterns across files (requires ripgrep)
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' }, -- Browse open buffers
      { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'Help Tags' },
    },
  }
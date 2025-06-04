vim.g.mapleader = ' '

-- Map Ctrl+s to save in both insert and normal modes (may not work in all terminals due to the flow control issue).
vim.keymap.set({'i'}, '<C-s>', '<C-o>:w<ENTER>')
vim.keymap.set({'n'}, '<C-s>', ':w<ENTER>')

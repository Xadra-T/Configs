vim.o.breakindent = true -- Enable break indent (default: false) (Controls how Vim handles indentation when lines are wrapped. When set to true, it preserves the indentation level of wrapped lines)
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim. (default: '') (Any text yanked (copied) in Vim is automatically copied to the system clipboard and vice versa)
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
vim.o.expandtab = true -- Convert tabs to spaces (default: false)
vim.o.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
vim.o.hlsearch = false -- Whether Vim highlights all matches of search (default: true). false: Only shows current search position
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \\C or capital in search (default: false)
vim.o.linebreak = true -- Companion to wrap, don't wrap in the middle of a word (default: false)
vim.o.mouse = 'a' -- Enable mouse mode (default: '') a: Use mouse in all Vim modes
vim.o.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
vim.o.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
vim.o.showtabline = 2 -- Always show tabs (default: 1) 0: Never show tab line, 1: Only whith multiple tabs, 2: always
vim.o.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor when scrolling horizontally if wrap is `false` (default: 0)
vim.o.smartcase = true -- Smart case (default: false) true: case-sensitive search when pattern contains uppercase, case-insensitive search when all lowercase
vim.o.smartindent = true -- Make indenting smarter again (default: false)
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
vim.o.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
vim.o.splitright = true -- Force all vertical splits to go to the right of current window (default: false)
vim.o.swapfile = false -- Creates a swapfile (default: true)
vim.o.tabstop = 4 -- Insert n spaces for a tab (default: 8)
vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000) How long Vim waits for pending key sequences before timing out
vim.o.undofile = true -- Save undo history (default: false) Allowing to recover changes even after closing and reopening files
vim.o.updatetime = 250 -- Decrease update time (default: 4000) How frequently Vim updates various features while we're editing
vim.o.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
-- b: Move left to previous character, s: Move right to next character
-- <>: Navigate wrapped lines up/down, []: Move to previous/next character
-- h: Move left at start/end of line, l: Move right at start/end of line

vim.o.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)

vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- Disables automatic comment continuation when writing code, so when you're editing comments and press Enter or create new lines with 'o', Neovim won't automatically start the new line with a comment character. (default: 'croql')
vim.opt.iskeyword:append '-' -- Hyphenated words recognized by searches (default: does not include '-')
vim.opt.guifont = "Hack Nerd Font NF:h12"
vim.opt.list = true
vim.opt.listchars:append("trail:·")
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
vim.opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages, skip displaying messages like "match 1 of 2" during completion, avoid showing "scanning tags" or other completion-related scanning messages (default: does not include 'c') c: completion
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false). Allow Neovim to use 24-bit RGB colors in the terminal instead of the more limited 256-color palette.
vim.wo.number = true -- Make line numbers default (default: false)

-- Defaults
vim.o.autoindent = true -- Copy indent from current line when starting new one (default: true)
vim.o.backspace = 'indent,eol,start' -- Allow backspace on (default: 'indent,eol,start') (indent: Enables deletion of automatically added indentation, eol: Enables joining lines by backspacing at the start of a line, start: Permits deletion of text before where you started inserting)
vim.o.backup = false -- Creates a backup file (default: false)
vim.o.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
vim.o.cursorline = false -- Highlight the current line (default: false)
vim.o.conceallevel = 1 -- (default: 1). If set to 0: `` is visible in markdown files
vim.o.numberwidth = 4 -- Set number column width to 4 (default: 4)
vim.o.pumheight = 10 -- Pop up menu height (default: 0)
vim.o.relativenumber = false -- (default: false)
vim.o.showmode = true -- false: won't show things like -- INSERT -- anymore (default: true)  TODO change this to false when using a status line
vim.o.wrap = true -- Wrap long lines (default: true)
vim.wo.signcolumn = 'auto' -- sign column: the vertical column at the left edge of the window. auto: Show the sign column only when there are signs to display (default: 'auto') yes: Always show the sign column (takes up space even if empty), number: Merge the sign column with the number column


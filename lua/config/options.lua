local opt = vim.opt

-- General
opt.mouse = 'a'                     -- Enable mouse support
opt.clipboard = 'unnamedplus'       -- Use system clipboard
opt.swapfile = false               -- Don't use swapfile
opt.completeopt = 'menuone,noselect' -- Completion options

-- Search
opt.ignorecase = true              -- Ignore case letters when searching
opt.smartcase = true               -- Ignore lowercase for the whole pattern
opt.hlsearch = true                -- Highlight search results
opt.incsearch = true               -- Incremental search
opt.showmatch = true               -- Show matching words during a search

-- Indent
opt.expandtab = true               -- Use spaces instead of tabs
opt.shiftwidth = 2                 -- Shift 4 spaces when tab
opt.tabstop = 2                    -- 1 tab == 2 spaces
opt.smartindent = true             -- Autoindent new lines
opt.wrap = false                   -- Don't wrap lines

-- UI
opt.number = true                  -- Show line numbers
opt.relativenumber = true          -- Show relative line numbers
opt.cursorline = true              -- Highlight cursor line
opt.signcolumn = "yes"             -- Always show the sign column
opt.termguicolors = true           -- Enable 24-bit RGB colors
opt.showmode = false               -- Don't show mode in command line
opt.splitbelow = true              -- Horizontal split will go below
opt.splitright = true              -- Vertical split will go right
opt.scrolloff = 8                  -- Lines of context
opt.sidescrolloff = 8              -- Columns of context
opt.foldcolumn = "1"               -- Show foldcolumn
opt.foldlevel = 99                 -- Using ufo provider need a large value
opt.foldlevelstart = 99            -- Expand folds by default
opt.foldenable = true              -- Enable fold for nvim-ufo 
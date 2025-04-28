local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Clear highlights with esc
map("n", "<esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

-- Better paste
map("v", "p", '"_dP', { desc = "Better paste" })

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move line up" })
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move line down" })

-- Quick save
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Better tabbing
map("n", "<TAB>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-TAB>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Terminal left window" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Terminal bottom window" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Terminal top window" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Terminal right window" })

-- Use alt + hjkl to resize windows
map("n", "<M-j>", ":resize -2<CR>", { desc = "Resize window down" })
map("n", "<M-k>", ":resize +2<CR>", { desc = "Resize window up" })
map("n", "<M-h>", ":vertical resize -2<CR>", { desc = "Resize window left" })
map("n", "<M-l>", ":vertical resize +2<CR>", { desc = "Resize window right" })

-- Windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", { desc = "Move text down" })
map("v", "<A-k>", ":m .-2<CR>==", { desc = "Move text up" })
map("v", "p", '"_dP', { desc = "Better paste" })

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", { desc = "Move text down" })
map("v", "<A-k>", ":m .-2<CR>==", { desc = "Move text up" })
map("v", "p", '"_dP', { desc = "Better paste" }) 
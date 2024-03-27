local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--
-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Vertical split
keymap("n", "<leader>vs", ":vsplit<CR>", opts)
--
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
--
-- Close buffers
keymap("n", "<leader>c", ":bdelete<CR>", opts)

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

--Lsp
keymap("n", "<leader>f", "<cmd>lua require'conform'.format({lsp_fallback=true})<cr>", opts)
--
--
--
keymap('n', 'zR', "<cmd>lua require('ufo').openAllFolds()<cr>", opts)
keymap('n', 'zM', "<cmd>lua require('ufo').closeAllFolds()<cr>", opts)
--
-- Better paste
keymap("v", "p", '"_dP', opts)

-- oil keymap
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


-- start and end of line
keymap("n", "<S-l>", "$", opts)
keymap("n", "<S-h>", "^", opts)
keymap("v", "<S-l>", "$", opts)
keymap("v", "<S-h>", "^", opts)
keymap("x", "<S-l>", "$", opts)
keymap("x", "<S-h>", "^", opts)
keymap("o", "<S-l>", "$", opts)
keymap("o", "<S-h>", "^", opts)

-- <leader>, saves
keymap("n", "<leader>w", ":w<CR>", opts)

keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>hj", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap("n", "<leader>hk", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)

keymap("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)




local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap("n", "<leader>sv", ":source $MYVIMRC", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- splitting
-- vertical
keymap("n", "<Leader>v", "<C-w>v<C-w>l", opts)
-- horizontal
keymap("n", "<Leader>s", "<C-w>s<C-w>j", opts)


-- Lexplore
keymap("n", "<leader>le", ":Lex 30<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
--keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<M-j>", ":m .+1<CR>==", opts)
keymap("v", "<M-k>", ":m .-2<CR>==", opts)

-- Keeps yank contents when pasting onto another visual selection
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Shortcut to toggle NERDTree
keymap("n", "<Leader>ne", ":NERDTreeToggle<CR>", opts)

-- Shortcuts for managing / moving through tabs
keymap("n", "<space>", ":tabnext<CR>", opts)
keymap("n", "S-<space>", ":tabprev<CR>", opts)
keymap("n", "<leader>tn", ":tabnew<CR>", opts)
keymap("n", "<leader>td", ":tabdel<CR>", opts)

-- Telescope Shortcuts
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
local status_ok, _ = pcall(require, "telescope")
if status_ok then
  keymap("n", "<leader>T", "<cmd>Telescope", opts)
  keymap("n", "<leader>ft", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
  keymap("n", "<leader>tt", "<cmd>Telescope live_grep<CR>", opts)
end

status_ok, _ = pcall(require, "gitsigns")
if status_ok then
  keymap('n', '<leader>gb', ':Gitsigns blame_line {full=true}<CR>', opts)
  keymap('n', '<leader>hd', ':Gitsigns diffthis<CR>', opts)
  -- keymap('n', '<leader>hD', ":Gitsigns diffthis ('~')<CR>", opts)
  keymap('n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>', opts)
  keymap('n', '<leader>td', ':Gitsigns toggle_deleted<CR>', opts)
end

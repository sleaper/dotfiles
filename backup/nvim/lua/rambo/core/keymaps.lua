-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- import telescope actions safely
local status, builtin = pcall(require, "telescope.builtin")
if not status then
  return
end

---------------------
-- General Keymaps
---------------------
-- Custom
keymap.set("n", "<leader>pv", ":Ex<CR>")
keymap.set("i", "<C-S>", "<ESC>:w<CR>")
keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
keymap.set("n", "<C-w>", ":Bdelete <CR>")
keymap.set("n", "<leader>ng", ":Neogit <CR>")
keymap.set("n", "<C-d>", ":g/")
-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { silent = true })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { silent = true })     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { silent = true })     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { silent = true })     -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", { silent = true }) -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>")                   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")                 -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")                     --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")                     --  go to previous tab

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true })
keymap.set("n", "<S-h>", ":bprevious<CR>", { silent = true })

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<c-p>", builtin.find_files, { desc = "Search Files" })         -- find files within current working directory, respects .gitignore
keymap.set("n", "<c-t>", builtin.live_grep, { desc = "Seacrch by Grep" })       -- find string in current working directory as you type
keymap.set("n", "<c-f>", builtin.grep_string, { desc = "Search current Word" }) -- find string under cursor in current working directory

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "List all commits" })                 -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { desc = "List commits in current buffer" }) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "List branches" })                   -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "List changes" })                      -- list current changes per file with diff preview ["gs" for git status]

-- LspSaga
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>")

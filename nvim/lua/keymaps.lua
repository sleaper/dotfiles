-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- local builtin = require "telescope.builtin"
-- --Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Custom
keymap("n", "<leader>pv", ":qa<CR>")
keymap("i", "<C-S>", "<ESC>:w<CR>")
-- keymap("n", "<C-w>", ":Bdelete <CR>")
keymap("n", "<leader>ng", ":Git<CR>")

-- GIT WORKTREES
-- Set up the keybind for Ctrl+w in normal mode
keymap("n", "<leader>sg", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
-- Set up the keybind for creating a new Git worktree
keymap("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", opts)

keymap("n", "<leader>gs", function()
	local path = vim.fn.input("Enter worktree path to switch to: ")
	if path == "" then
		return
	end -- Cancel if no input
	require("git-worktree").switch_worktree(path)
end, opts)

keymap("n", "<leader>gd", function()
	local path = vim.fn.input("Enter worktree path to delete: ")
	if path == "" then
		return
	end -- Cancel if no input
	require("git-worktree").delete_worktree(path)
end, opts)

-- use jk to exit insert mode

-- Clear highlights
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

--
-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

keymap("n", "<leader>m", "<cmd>make<CR>", opts)

-- Telescope
-- see init.lua
keymap("n", "<leader>to", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true })

-- Zenmode
keymap("n", "<leader>zz", function()
	require("zen-mode").toggle()
	vim.wo.wrap = false
	vim.wo.number = true
	vim.wo.rnu = true
end, { silent = true, noremap = true })

keymap("n", "<space>q", vim.diagnostic.open_float, { noremap = true, silent = true })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
--
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "solarized",
	callback = function()
		vim.api.nvim_set_hl(0, "CopilotSuggestion", {
			fg = "#555555",
			ctermfg = 8,
			force = true,
		})
	end,
})

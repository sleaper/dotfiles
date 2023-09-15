return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-treesitter/nvim-treesitter" }
	},
	config = function()
		require('refactoring').setup({})
		--TODO: Find better keymaps
		vim.api.nvim_set_keymap("v", "<leader>ri",
			[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
			{ noremap = true, silent = true, expr = false })
	end
}

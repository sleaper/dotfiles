return {
	"github/copilot.vim",
	lazy = true,
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		-- Remove the previous keymap for <C-j>
		vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})

		-- -- Set copilot_no_tab_map to false to allow Tab key mapping
		-- vim.g.copilot_no_tab_map = false
		--
		-- -- Optionally, you can explicitly map the Tab key if you want more control
		-- vim.api.nvim_set_keymap("i", "<C-Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	end,
}

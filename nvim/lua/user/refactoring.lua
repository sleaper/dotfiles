local M = {
  "ThePrimeagen/refactoring.nvim",
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
}

function M.config()
  local refactoring = require("telescope").load_extension "refactoring"

  vim.api.nvim_set_keymap(
    "v",
    "<leader>rr",
    ":lua require('refactoring').select_refactor()<CR>",
    { noremap = true, silent = true, expr = false }
  )

  refactoring.setup {
    prompt_func_return_type = {
      go = true,
      cpp = true,
      c = false,
      java = true,

      h = false,
      hpp = false,
      cxx = false,
    },
    prompt_func_param_type = {
      go = true,
      cpp = true,
      c = true,
      java = true,

      h = false,
      hpp = false,
      cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
  }
end

return M

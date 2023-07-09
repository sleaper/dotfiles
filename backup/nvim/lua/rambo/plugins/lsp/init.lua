local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "rambo.plugins.lsp.mason"
require("rambo.plugins.lsp.handlers").setup()
require "rambo.plugins.lsp.null-ls"
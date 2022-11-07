local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("rambo.lsp.lsp-installer")
require("rambo.lsp.handlers").setup()
require("rambo.lsp.null-ls")

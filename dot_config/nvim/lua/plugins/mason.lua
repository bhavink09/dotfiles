-- Mason Setup
return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason").setup({
			PATH = "append",
			ui = {
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})
		require("mason-lspconfig").setup()
	end,
}

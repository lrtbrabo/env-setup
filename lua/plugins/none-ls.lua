return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.diagnostics.eslint_d,
			},
		})
    vim.g.nonels_suppress_issue58 = true
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}

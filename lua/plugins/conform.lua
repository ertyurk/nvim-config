return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			javascript = { "biome-check" },
			javascriptreact = { "biome-check" },
			typescript = { "biome-check" },
			typescriptreact = { "biome-check" },
			json = { "biome-check" },
			jsonc = { "biome-check" },
			css = { "biome-check" },
			scss = { "biome-check" },
			html = { "biome-check" },
			svelte = { "prettier" },
			rust = { "rustfmt", lsp_format = "prefer" },
			toml = { "taplo" },
			markdown = { "prettier_md" },
			yaml = { "prettier" },
		},
		formatters = {
			prettier_md = {
				command = "prettier",
				args = { "--stdin-filepath", "$FILENAME", "--prose-wrap", "always", "--print-width", "80" },
				stdin = true,
			},
		},
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { lsp_format = "fallback", timeout_ms = 2000 }
		end,
	},
	init = function()
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, { desc = "Disable autoformat-on-save", bang = true })
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, { desc = "Re-enable autoformat-on-save" })
	end,
}

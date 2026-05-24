return {
	{
		-- Installs non-LSP CLI tools (linters/formatters) into Mason's bin.
		-- mason-lspconfig only handles LSP servers, so markdownlint goes here.
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = { "markdownlint" },
			})
		end,
	},
	{
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "InsertLeave" },
	config = function()
		local lint = require("lint")
		-- LSP already covers most: biome (TS/CSS/JSON), ruff (Python), rust-analyzer (Rust).
		-- nvim-lint here for things LSP misses. Add as needed.
		lint.linters_by_ft = {
			markdown = { "markdownlint" },
			-- javascript = { "eslint_d" },
			-- typescript = { "eslint_d" },
			-- python = { "mypy" },
		}
		local group = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			group = group,
			callback = function()
				if vim.bo.modifiable then
					lint.try_lint()
				end
			end,
		})
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger lint" })
	end,
	},
}

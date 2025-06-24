return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"pyright",
					"sqls",
					"svelte",
					"tailwindcss",
					"cssls",
					"ts_ls",
					"templ",
					"jsonls",
					"html",
					"htmx",
					"rust_analyzer",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",

		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				"lua_ls",
				"gopls",
				"pyright",
				"sqls",
				"svelte",
				"cssls",
				"ts_ls",
				"templ",
				"jsonls",
				"gleam",
				"rust_analyzer",
			}
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		config = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function()
			require("crates").setup({
				popup = {
					border = "rounded",
				},
			})
		end,
	},
}

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
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = { exclude = { "rust_analyzer" } },
				automatic_enable = {
					exclude = { "rust_analyzer" },
				},
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ruff",
					"biome",
					"svelte",
					"tailwindcss",
					"cssls",
					"ts_ls",
					"jsonls",
					"html",
					"taplo",
					"marksman",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",

		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				"lua_ls",
				"pyright",
				"ruff",
				"biome",
				"svelte",
				"tailwindcss",
				"cssls",
				"ts_ls",
				"jsonls",
				"html",
				"taplo",
				"marksman",
			}
			for _, server_name in ipairs(servers) do
				vim.lsp.config[server_name] = {
					cmd = vim.lsp.config[server_name] and vim.lsp.config[server_name].cmd or nil,
					capabilities = capabilities,
				}
				vim.lsp.enable(server_name)
			end

			local builtin = require("telescope.builtin")

			-- Standard LSP keymaps (bare keys - vim convention)
			-- Uses Telescope for results — auto-closes after selection
			vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Go to references" })
			vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to implementation" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })

			-- Leader LSP keymaps (discoverable via which-key)
			vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Go to references" })
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, { desc = "Show signature help" })
			vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })

			-- Diagnostics
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1 })
			end, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1 })
			end, { desc = "Next diagnostic" })

			-- Diagnostic signs
			vim.diagnostic.config({
				virtual_text = { prefix = "●" },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
				float = { border = "rounded" },
				severity_sort = true,
			})
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		config = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_command = "rustfmt"
			vim.g.rustfmt_options = ""
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
				lsp = {
					enabled = true,
					actions = true,
					completion = true,
					hover = true,
				},
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		ft = { "rust" },
		config = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
							check = {
								command = "clippy",
							},
						},
					},
				},
			}
		end,
	},
}

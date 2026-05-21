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
					"basedpyright",
					"ruff",
					"biome",
					"svelte",
					"tailwindcss",
					"cssls",
					"vtsls",
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

			-- uv-native python resolver: walk up for .venv/bin/python
			local function find_uv_python()
				local cwd = vim.fn.getcwd()
				local hits = vim.fs.find({ ".venv" }, {
					upward = true,
					path = cwd,
					stop = vim.loop.os_homedir(),
					type = "directory",
				})
				local venv_dir = hits[1]
				if not venv_dir then
					return nil, nil
				end
				local py = venv_dir .. "/bin/python"
				if vim.fn.executable(py) == 1 then
					return py, vim.fs.dirname(venv_dir)
				end
				return nil, nil
			end

			local servers = {
				"lua_ls",
				"basedpyright",
				"ruff",
				"biome",
				"svelte",
				"tailwindcss",
				"cssls",
				"vtsls",
				"jsonls",
				"html",
				"taplo",
				"marksman",
			}
			for _, server_name in ipairs(servers) do
				local cfg = {
					cmd = vim.lsp.config[server_name] and vim.lsp.config[server_name].cmd or nil,
					capabilities = capabilities,
				}
				if server_name == "basedpyright" then
					cfg.before_init = function(_, config)
						local py, venv_root = find_uv_python()
						if not py then
							return
						end
						config.settings = config.settings or {}
						config.settings.python = vim.tbl_deep_extend("force", config.settings.python or {}, {
							pythonPath = py,
							venvPath = venv_root,
							venv = ".venv",
						})
					end
				elseif server_name == "ruff" then
					local py = find_uv_python()
					if py then
						cfg.init_options = { settings = { interpreter = { py } } }
					end
				end
				vim.lsp.config[server_name] = cfg
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
			-- <leader>gf bound by conform.nvim

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

return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			local fb_actions = telescope.extensions.file_browser.actions

			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set(
				"n",
				"<leader>fb",
				":Telescope file_browser path=%:p:h select_buffer=true<CR>",
				{ noremap = true, desc = "File browser" }
			)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last search" })
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						".DS_Store",
						"package%-lock%.json",
						"pnpm%-lock%.yaml",
						"yarn%-lock%.json",
						"node_modules/",
						".idea/",
						".svelte%-kit/",
						".cache/",
						"%.git/",
						".vscode/",
						"target/debug/",
						"target/release/",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					file_browser = {
						theme = "dropdown",
						layout_strategy = "horizontal",
						layout_config = {
							height = 0.9,
							width = 0.9,
							preview_width = 0.5,
							prompt_position = "bottom",
						},
						hijack_netrw = true,
						mappings = {
							["i"] = {
								["<A-c>"] = fb_actions.create,
								["<S-CR>"] = fb_actions.create_from_prompt,
							},
							["n"] = {
								["c"] = fb_actions.create,
								["r"] = fb_actions.rename,
							},
						},
					},
				},
			})
			telescope.load_extension("ui-select")
			telescope.load_extension("file_browser")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}

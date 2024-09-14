return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			local fb_actions = telescope.extensions.file_browser.actions
			-- local actions = require("telescope.actions")
			-- local browser = telescope.extensions.file_browser

			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			-- vim.keymap.set("n", "<leader>fb", browser.file_browser, { noremap = true })
			-- instead of opening the root folder always, i choose the open the folder from buffer path that i am in.
			vim.keymap.set(
				"n",
				"<leader>fb",
				":Telescope file_browser path=%:p:h select_buffer=true<CR>",
				{ noremap = true }
			)

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						".DS_Store",
						"package-lock.json",
						"pnpm-lock.yaml",
						"yarn-lock.json",
					},
					folder_ignore_patterns = {
						"node_modules",
						".idea",
						".svelte-kit",
						".cache",
						".git",
						".vscode",
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
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							["i"] = {
								["<A-c>"] = fb_actions.create,
								["<S-CR>"] = fb_actions.create_from_prompt,
							},
							["n"] = {
								["c"] = fb_actions.create,
								["r"] = fb_actions.rename,
								-- ["<CR>"] = fb_actions.toggle_tree,
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

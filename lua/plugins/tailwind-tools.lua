return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
		"neovim/nvim-lspconfig",
	},
	ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
	opts = {
		document_color = {
			enabled = true,
			kind = "inline",
			inline_symbol = "󰝤 ",
			debounce = 200,
		},
		conceal = {
			enabled = false,
			min_length = nil,
			symbol = "󱏿",
		},
		cmp = { highlight = "foreground" },
		telescope = { utilities = { callback = function(_, _) end } },
		extension = { queries = {}, patterns = {} },
	},
	keys = {
		{ "<leader>ts", "<cmd>TailwindSort<cr>", desc = "Sort Tailwind classes" },
		{ "<leader>tc", "<cmd>TailwindConcealToggle<cr>", desc = "Toggle Tailwind conceal" },
		{ "<leader>tC", "<cmd>TailwindColorToggle<cr>", desc = "Toggle Tailwind colors" },
	},
}

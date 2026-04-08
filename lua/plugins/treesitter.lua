return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"python",
				"svelte",
				"regex",
				"rust",
				"css",
				"html",
				"markdown",
				"markdown_inline",
				"json",
				"yaml",
				"toml",
				"bash",
				"vimdoc",
				"xml",
				"graphql",
			},
		})
	end,
}

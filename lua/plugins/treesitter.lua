return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()

		-- Install parsers + queries (no-op if already installed)
		require("nvim-treesitter").install({
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
		})

		-- Enable treesitter-based highlighting
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}

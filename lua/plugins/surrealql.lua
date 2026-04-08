return {
	"dariuscorvus/tree-sitter-surrealdb.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = { "surql", "surrealdb" },
	config = function()
		require("tree-sitter-surrealdb").setup()
	end,
}

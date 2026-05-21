return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			delay = 300,
		})
		wk.add({
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "code" },
			{ "<leader>d", group = "debug" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git/goto" },
			{ "<leader>h", group = "git hunks" },
			{ "<leader>l", group = "lint" },
			{ "<leader>o", group = "opencode" },
			{ "<leader>r", group = "refactor" },
			{ "<leader>t", group = "tailwind" },
			{ "<leader>w", group = "windows" },
			{ "<leader>y", group = "yank" },
		})
	end,
}

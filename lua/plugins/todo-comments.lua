return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local tc = require("todo-comments")
		tc.setup()
		vim.keymap.set("n", "]t", function()
			tc.jump_next()
		end, { desc = "Next TODO" })
		vim.keymap.set("n", "[t", function()
			tc.jump_prev()
		end, { desc = "Previous TODO" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
	end,
}

return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				-- Add Treesitter integration for context-aware commenting
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				-- Basic mappings
				toggler = {
					line = "gcc", -- Line-comment toggle
					block = "gbc", -- Block-comment toggle
				},
				-- Operator-pending mappings
				opleader = {
					line = "gc", -- Line-comment operator
					block = "gb", -- Block-comment operator
				},
				-- Extra mappings
				extra = {
					above = "gcO", -- Add comment above
					below = "gco", -- Add comment below
					eol = "gcA", -- Add comment at end of line
				},
				-- Enable all mappings
				mappings = {
					basic = true,
					extra = true,
				},
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false, -- We handle this via Comment.nvim pre_hook
		},
	},
}

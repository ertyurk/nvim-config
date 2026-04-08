return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
			italic = {
				strings = false,
				emphasis = true,
				comments = true,
				operators = true,
				folds = true,
			},
			bold = true,
		})
		vim.cmd.colorscheme("gruvbox")
	end,
}

return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown", "markdown.mdx", "Avante" },
	opts = {
		file_types = { "markdown", "markdown.mdx", "Avante" },
		heading = { sign = false, position = "inline" },
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
			border = "thin",
		},
		checkbox = {
			unchecked = { icon = "󰄱 " },
			checked = { icon = " " },
		},
		bullet = { icons = { "●", "○", "◆", "◇" } },
	},
}

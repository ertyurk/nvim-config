return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			"css",
			"scss",
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
			"lua",
			"vim",
		}, {
			RGB = true,
			RRGGBB = true,
			RRGGBBAA = true,
			names = false,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			mode = "background",
		})
	end,
}

return {
	"yetone/avante.nvim",
	enabled = true,
	event = "VeryLazy",
	build = "make",
	opts = {
		---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
		provider = "openai",
		auto_suggestions_provider = "openai",
		---@type AvanteSupportedProvider
		openai = {
			endpoint = "https://api.openai.com/v1",
			model = "gpt-4o",
			timeout = 30000, -- Timeout in milliseconds
			temperature = 0,
			max_tokens = 4096,
			["local"] = false,
		},
		behaviour = {
			auto_suggestions = false, -- Experimental stage
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = false,
		},
		mappings = {
			ask = { key = "<leader>aa", desc = "Ask a question" },
			edit = { key = "<leader>ae", desc = "Edit the response" },
			refresh = { key = "<leader>ar", desc = "Refresh the suggestions" },
			--- @class AvanteConflictMappings
			diff = {
				ours = { key = "co", desc = "Use our changes" },
				theirs = { key = "ct", desc = "Use their changes" },
				all_theirs = { key = "ca", desc = "Use all their changes" },
				both = { key = "cb", desc = "Use both changes" },
				cursor = { key = "cc", desc = "Use changes at cursor" },
				next = { key = "]x", desc = "Go to next conflict" },
				prev = { key = "[x", desc = "Go to previous conflict" },
			},
			suggestion = {
				accept = { key = "<M-l>", desc = "Accept suggestion" },
				next = { key = "<M-]>", desc = "Next suggestion" },
				prev = { key = "<M-[>", desc = "Previous suggestion" },
				dismiss = { key = "<C-]>", desc = "Dismiss suggestion" },
			},
			jump = {
				next = { key = "]]", desc = "Jump to next" },
				prev = { key = "[[", desc = "Jump to previous" },
			},
			submit = {
				normal = { key = "<CR>", desc = "Submit in normal mode" },
				insert = { key = "<C-s>", desc = "Submit in insert mode" },
			},
		},
		hints = { enabled = true },
		windows = {
			---@type "right" | "left" | "top" | "bottom"
			position = "right", -- the position of the sidebar
			wrap = true, -- similar to vim.o.wrap
			width = 30, -- default % based on available width
			sidebar_header = {
				align = "center", -- left, center, right for title
				rounded = true,
			},
		},
		highlights = {
			---@type AvanteConflictHighlights
			diff = {
				current = "DiffText",
				incoming = "DiffAdd",
			},
		},
		--- @class AvanteConflictUserConfig
		diff = {
			debug = false,
			autojump = true,
			---@type string | fun(): any
			list_opener = "copen",
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below is optional, make sure to setup it properly if you have lazy=true
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
	},
}

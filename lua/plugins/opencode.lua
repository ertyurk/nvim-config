return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		{
			"folke/snacks.nvim",
			opts = {
				input = {},
				picker = {},
				terminal = {},
			},
		},
	},
	config = function()
		vim.g.opencode_opts = {}
		vim.o.autoread = true
	end,
	keys = {
		-- Core controls
		{ "<leader>oo", function() require("opencode").select() end, desc = "OpenCode select (picker)" },
		{ "<leader>oa", function() require("opencode").ask() end, desc = "OpenCode ask" },
		{ "<leader>ot", function() require("opencode").toggle() end, desc = "OpenCode toggle" },
		-- Visual mode - ask with selection
		{ "<leader>oa", function() require("opencode").ask() end, mode = "v", desc = "OpenCode ask with selection" },
		-- Built-in prompts
		{ "<leader>oe", function() require("opencode").prompt("explain") end, desc = "OpenCode explain" },
		{ "<leader>or", function() require("opencode").prompt("review") end, desc = "OpenCode review" },
		{ "<leader>of", function() require("opencode").prompt("fix") end, desc = "OpenCode fix diagnostics" },
		{ "<leader>od", function() require("opencode").prompt("document") end, desc = "OpenCode document" },
		{ "<leader>oi", function() require("opencode").prompt("implement") end, desc = "OpenCode implement" },
		{ "<leader>oz", function() require("opencode").prompt("optimize") end, desc = "OpenCode optimize" },
		{ "<leader>oT", function() require("opencode").prompt("test") end, desc = "OpenCode generate tests" },
		-- Operator mode (use with motions: goiw, goap, gG, etc.)
		{ "go", function() return require("opencode").operator() end, expr = true, desc = "OpenCode operator" },
		-- Session management
		{ "<leader>on", function() require("opencode").command("session.new") end, desc = "OpenCode new session" },
		{ "<leader>ol", function() require("opencode").command("session.list") end, desc = "OpenCode list sessions" },
		{ "<leader>oc", function() require("opencode").command("session.compact") end, desc = "OpenCode compact session" },
		{ "<leader>ox", function() require("opencode").command("session.interrupt") end, desc = "OpenCode interrupt" },
	},
}

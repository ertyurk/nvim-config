-- Default indentation settings
-- Formatters (prettier, black, rustfmt, stylua) will handle the actual formatting
-- These are just editor defaults for manual editing
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- Set 2 spaces for web/config files
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"jsonc",
		"html",
		"css",
		"scss",
		"svelte",
		"yaml",
		"toml",
		"markdown",
		"xml",
		"graphql",
	},
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- Treat .env files as dotenv (bash highlighting + # comments, no BashLS linting)
vim.filetype.add({
	pattern = {
		["%.env"] = "dotenv",
		["%.env%..*"] = "dotenv",
		[".*%.env"] = "dotenv",
		[".*%.env%..*"] = "dotenv",
	},
})
vim.treesitter.language.register("bash", "dotenv")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dotenv"
	end,
})

-- Other settings
vim.opt.relativenumber = true
vim.opt.number = true

vim.g.mapleader = " "

-- Disable unused providers to silence warnings
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Suppress deprecation warnings from plugins (not your config)
vim.deprecate = function() end

-- Suppress harmless offset_encoding warnings (copilot uses utf-16, other LSPs use utf-8)
local original_notify = vim.notify
vim.notify = function(msg, ...)
	if type(msg) == "string" and (msg:match("offset_encoding") or msg:match("position_encoding")) then
		return
	end
	return original_notify(msg, ...)
end

-- Custom Functions
function yank_lines_dynamic()
	-- Prompt the user for input
	local input = vim.fn.input("Number of lines to yank (Enter for whole file): ")

	-- If input is empty or not a number, yank the whole file
	if input == "" or not tonumber(input) then
		vim.cmd('normal! gg"+yG')
		print("Entire file yanked to clipboard")
		return
	end

	local count = tonumber(input)

	-- Check if the input is valid
	if count < 1 then
		print("Invalid input. Please enter a positive number.")
		return
	end

	-- Enter visual mode
	vim.cmd("normal! V")

	-- Move down 'count' lines (subtract 1 because we're already on the current line)
	if count > 1 then
		vim.cmd("normal! " .. (count - 1) .. "j")
	end

	-- Yank the selected lines to the system clipboard
	vim.cmd('normal! "+y')

	-- Provide feedback
	print(count .. " line(s) yanked to clipboard")
end

vim.keymap.set("n", "<leader>ya", yank_lines_dynamic, { desc = "Yank lines to clipboard" })

-- Avante
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"

-- Add these settings
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Clear search highlights with Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in visual mode after indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Keep cursor centered on scroll/search
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result centered" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Paste over selection without losing register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without losing register" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window management
vim.keymap.set("n", "<leader>wq", "<C-w>q", { desc = "Close current window" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Make windows equal size" })

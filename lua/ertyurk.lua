-- Default indentation settings
-- Formatters (prettier, black, rustfmt, stylua) will handle the actual formatting
-- These are just editor defaults for manual editing
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- Set 2 spaces for JavaScript/TypeScript files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
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

vim.api.nvim_set_keymap("n", "<leader>ya", ":lua yank_lines_dynamic()<CR>", { noremap = true, silent = true })

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

-- Add visual block mode mappings
vim.keymap.set("v", "<S-i>", "<C-v>I", { desc = "Insert at beginning of block" })
vim.keymap.set("v", "<S-a>", "<C-v>A", { desc = "Append at end of block" })

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

-- Default settings (2 spaces)
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Function to set indent settings
local function set_indent(size)
	vim.opt_local.tabstop = size
	vim.opt_local.softtabstop = size
	vim.opt_local.shiftwidth = size
end

-- Autocommands for different file types
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml" },
	callback = function()
		set_indent(2)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "html", "templ", "python", "lua" },
	callback = function()
		set_indent(4)
	end,
})

-- Other settings
vim.opt.relativenumber = true
vim.opt.number = true

vim.g.mapleader = " "
vim.filetype.add({ extension = { templ = "templ" } })

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

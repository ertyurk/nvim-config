return {
    "olexsmir/gopher.nvim",
    config = function()
        vim.api.nvim_set_keymap("n", "<leader>if", ":GoIfErr<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tj", ":GoTagAdd json<CR>", { noremap = true, silent = true })
    end,
}

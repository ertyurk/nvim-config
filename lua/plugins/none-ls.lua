return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local on_attach = function(client, bufnr)
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({
                    group = augroup,
                    buffer = bufnr,
                })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
                vim.api.nvim_create_autocmd(
                    { "BufWritePre" },
                    { pattern = { "*.templ" }, callback = vim.lsp.buf.format }
                )
            end
        end
        -- Replace with the actual TEMPL formatter command
        local templ_formatter = null_ls.builtins.formatting.prettier.with({
            filetypes = { "templ" },
            command = { "templ", "lsp" },
            args = { "--stdin" },
            to_stdin = true,
        })
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.formatting.golines,
                templ_formatter,
            },
            on_attach = on_attach,
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}

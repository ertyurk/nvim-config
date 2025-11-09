return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ruff",
                    "svelte",
                    "tailwindcss",
                    "cssls",
                    "ts_ls",
                    "jsonls",
                    "html",
                    "rust_analyzer",
                    "eslint",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",

        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local servers = {
                "lua_ls",
                "pyright",
                "ruff",
                "svelte",
                "cssls",
                "ts_ls",
                "jsonls",
                "rust_analyzer",
                "eslint",
            }
            for _, server_name in ipairs(servers) do
                vim.lsp.config[server_name] = {
                    cmd = vim.lsp.config[server_name] and vim.lsp.config[server_name].cmd or nil,
                    capabilities = capabilities,
                }
                vim.lsp.enable(server_name)
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
            vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, { desc = "Show signature help" })
            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        config = function()
            vim.g.rustfmt_autosave = 1
            vim.g.rustfmt_command = "rustfmt"
            vim.g.rustfmt_options = ""
        end,
    },
    {
        "saecki/crates.nvim",
        ft = { "rust", "toml" },
        config = function()
            require("crates").setup({
                popup = {
                    border = "rounded",
                },
                lsp = {
                    enabled = true,
                    actions = true,
                    completion = true,
                    hover = true,
                },
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                            check = {
                                command = "clippy",
                            },
                        },
                    },
                },
            }
        end,
    },
}

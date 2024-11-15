return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "javascript", "go", "typescript", "python", "svelte", "regex", "gleam" },
            highlight = { enable = true },
            indent = { enable = true },
        })
        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
    end,
}

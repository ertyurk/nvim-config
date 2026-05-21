# Neovim Config

Personal setup: Rust, Python, React/TypeScript, Svelte, Markdown.

Entry: `init.lua` → `lua/ertyurk.lua` (settings) + `lua/plugins/*.lua` (lazy.nvim specs).

## Keymaps

Full reference: [`KEYMAPS.md`](./KEYMAPS.md).

Leader = `<Space>`. Press `<leader>` and wait 300ms — which-key shows groups (`b` buffer, `c` code, `d` debug, `f` find, `g` git/goto, `h` git hunks, `o` opencode, `r` refactor, `w` windows, `y` yank).

Top picks:
- `<C-p>` / `<leader>ff` — fff find files (indexed)
- `<leader>fg` — fff live grep
- `gd` / `gr` — LSP definition / references (telescope)
- `<leader>ca` — code actions
- `<leader>gf` — format buffer
- `<leader>hp` — preview git hunk
- `<leader>ot` — toggle OpenCode
- `<leader>fb` — file browser (create/rename/delete via telescope)

## Plugin stack

| Area | Plugins |
|---|---|
| Pickers | `fff.nvim` (files/grep), `telescope.nvim` (LSP/help/diag/recents) |
| File browser | `telescope-file-browser` (`<leader>fb` — create/rename/delete) |
| Completion | `nvim-cmp` + `cmp-nvim-lsp` + `cmp-path` + `LuaSnip` + `friendly-snippets` |
| LSP | `mason.nvim` + `mason-lspconfig` + `nvim-lspconfig` |
| Rust | `rustaceanvim`, `crates.nvim` |
| Format | `none-ls.nvim` (stylua, prettier-md) + LSP formatters |
| Debug | `nvim-dap` + `dap-ui` + `mason-nvim-dap` |
| Git | `vim-fugitive`, `gitsigns.nvim` |
| Edit | `Comment.nvim`, `nvim-surround`, `nvim-autopairs`, `nvim-ts-autotag` |
| Syntax | `nvim-treesitter` |
| UI | `lualine`, `gruvbox`, `nvim-web-devicons`, `which-key` |
| AI | `opencode.nvim` (+ `snacks.nvim`), `copilot.lua` |
| Misc | `todo-comments.nvim`, `tree-sitter-surrealdb` |

## Languages

| Lang | LSP | Format | Debug |
|---|---|---|---|
| Rust | rust-analyzer (via rustaceanvim) | rustfmt + clippy | codelldb |
| Python | pyright | ruff | debugpy |
| TS/JS/TSX/JSX | ts_ls | biome | js-debug-adapter |
| Svelte | svelte | biome | — |
| CSS/HTML | cssls, html, tailwindcss | biome | — |
| TOML | taplo | taplo | — |
| Markdown | marksman | prettier (`--prose-wrap always --print-width 80`) | — |
| Lua | lua_ls | stylua | — |

Auto-format on save where formatter exists.

## Install / update

```bash
nvim       # first launch — lazy clones plugins, mason installs LSPs
```

Inside nvim:
- `:Lazy sync` — install/update plugins
- `:Lazy clean` — remove uninstalled
- `:Mason` — LSP / DAP / linter manager
- `:TSUpdate` — refresh treesitter parsers
- `:checkhealth` — diagnose setup

## File layout

```
init.lua              # entry
KEYMAPS.md            # keymap reference
lazy-lock.json        # locked plugin versions
lua/
├── ertyurk.lua       # opts, autocmds, base keymaps
├── plugins.lua       # copilot
└── plugins/          # plugin specs (one per concern)
```

## Tips

- `vimtutor` (terminal) — vim basics
- `:help <topic>` or `:h <plugin>` — docs
- `<leader>` then wait → which-key menu (live discovery)
- `<C-o>` — jump back after `gd`

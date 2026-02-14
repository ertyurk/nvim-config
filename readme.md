# Neovim Configuration Guide

> Personal Neovim setup focused on Rust, Python, and React/TypeScript development

## Table of Contents

- [Quick Reference](#quick-reference)
- [Vim Motions & Editing](#vim-motions--editing)
- [Plugin Features](#plugin-features)
- [Language-Specific Features](#language-specific-features)

---

## Quick Reference

### Essential Keybindings

| Category | Action | Keybinding |
|----------|--------|------------|
| **File Navigation** | Find files | `<C-p>` |
| | Live grep | `<leader>fg` |
| | File browser | `<leader>fb` |
| **Code Navigation** | Go to definition | `gd` or `<leader>gd` |
| | Find references | `gr` or `<leader>gr` |
| | Go to implementation | `gi` |
| | Hover documentation | `K` |
| **Editing** | Format buffer | `<leader>gf` |
| | Code actions | `<leader>ca` |
| | Rename symbol | `<leader>rn` |
| **Comments** | Toggle line comment | `gcc` |
| | Toggle block comment | `gbc` |
| | Comment visual selection | `gc` (visual mode) |
| **Git** | Git status | `<leader>gs` |
| | Next/Prev hunk | `]c` / `[c]` |
| | Stage hunk | `<leader>hs` |
| **Debug** | Toggle breakpoint | `<leader>db` |
| | Continue | `<leader>dc` |
| | Step over/into/out | `<leader>do/di/dO` |
| **Windows** | Navigate windows | `<C-h/j/k/l>` |
| | Close current window | `<leader>wq` or `:q` |
| | Close other windows | `<leader>wo` |
| **AI (OpenCode)** | Toggle terminal | `<leader>ot` |
| | Ask AI | `<leader>oa` |
| | Select action | `<leader>oo` |
| | Explain code | `<leader>oe` |
| | Fix errors | `<leader>of` |

**Note**: `<leader>` is mapped to `<Space>`

---

## Vim Motions & Editing

### Navigation

#### Basic Movement
```
h/j/k/l         - Left/Down/Up/Right
5j              - Move 5 lines down
0/$             - Start/End of line
^               - First non-blank character
w/b             - Forward/Backward by word
W/B             - Forward/Backward by WORD (whitespace-separated)
e               - End of word
```

#### Jumping
```
f{char}         - Jump forward to {char}
F{char}         - Jump backward to {char}
*/#             - Search forward/backward for word under cursor
n/N             - Next/Previous search result
C-o             - Jump back (after "go to definition")
```

#### Paragraphs & Sentences
```
{/}             - Previous/Next paragraph
(/)             - Previous/Next sentence
```

### Editing Commands

#### Insert Mode
```
i/a             - Insert before/after cursor
I/A             - Insert at start/end of line
o/O             - New line below/above
```

#### Text Operations
```
yy              - Copy (yank) line
p               - Paste after cursor
P               - Paste before cursor
dd              - Delete line
u               - Undo
C-r             - Redo
.               - Repeat last command
```

#### Text Objects
```
viw             - Select inside word
vi(             - Select inside parentheses
vi{             - Select inside curly braces
vi[             - Select inside square brackets
vi"             - Select inside double quotes
ci(             - Change inside parentheses
da{             - Delete around curly braces
```

#### Visual Block Mode
```
C-v             - Enter visual block mode
Shift-i         - Insert at start of block
Shift-a         - Append at end of block
```

#### Line Operations
```
J               - Join lines with space
gJ              - Join lines without space
```

### Search & Replace

```
/pattern        - Search forward
?pattern        - Search backward
:%s/old/new/gc  - Replace in whole file with confirmation
  %             - Entire file
  s             - Substitute
  g             - All occurrences in line
  c             - Confirm each
```

### Bookmarks

```
m{char}         - Set bookmark at {char}
`{char}         - Jump to bookmark {char}
``              - Jump to previous position
```

---

## Plugin Features

### Telescope (Fuzzy Finder)

```
<C-p>           - Find files
<leader>fg      - Live grep (search in files)
<leader>fb      - File browser
```

Inside Telescope:
```
<C-n>/<Down>    - Next item
<C-p>/<Up>      - Previous item
<CR>            - Select item
<C-x>           - Open in horizontal split
<C-v>           - Open in vertical split
```

### LSP (Language Server)

#### Navigation
```
gd              - Go to definition
<leader>gd      - Go to definition (alternative)
gr              - Go to references
<leader>gr      - Find references
gi              - Go to implementation
K               - Show hover documentation
<leader>k       - Show signature help (normal mode)
<C-k>           - Show signature help (insert mode)
```

#### Actions
```
<leader>rn      - Rename symbol
<leader>ca      - Code actions
<leader>gf      - Format buffer
```

#### Diagnostics
```
[d              - Previous diagnostic
]d              - Next diagnostic
<leader>e       - Show diagnostic in float
<leader>q       - Open diagnostics list
```

### Completion (nvim-cmp)

```
<C-n>           - Next item
<C-p>           - Previous item
<Tab>           - Next item
<Shift-Tab>     - Previous item
<CR>            - Confirm selection
<C-Space>       - Trigger completion
<C-e>           - Close completion menu
<C-b>           - Scroll docs backward
<C-f>           - Scroll docs forward
```

### Copilot (AI Suggestions)

```
<Tab>           - Accept suggestion
<M-]>           - Next suggestion
<M-[>           - Previous suggestion
<C-]>           - Dismiss suggestion
```

### Commenting (Comment.nvim)

#### Line Comments
```
gcc             - Toggle line comment
gc{motion}      - Comment motion (e.g., gc3j)
gcO             - Add comment above
gco             - Add comment below
gcA             - Add comment at end of line
```

#### Block Comments
```
gbc             - Toggle block comment
gb{motion}      - Block comment motion
```

#### Visual Mode
```
gc              - Comment selection (line)
gb              - Comment selection (block)
```

**Context-aware**: Automatically uses correct syntax for Rust (`//`), Python (`#`), HTML (`<!-- -->`), JSX (`{/* */}`), etc.

### Git Integration

#### Fugitive
```
<leader>gs      - Git status
<leader>gc      - Git commit
<leader>gp      - Git push
<leader>gl      - Git pull
<leader>gb      - Git blame
<leader>gd      - Git diff split
<leader>gv      - Git vertical diff split
```

#### GitSigns (Hunk Operations)
```
]c              - Next hunk
[c              - Previous hunk
<leader>hs      - Stage hunk
<leader>hr      - Reset hunk
<leader>hS      - Stage buffer
<leader>hu      - Undo stage hunk
<leader>hR      - Reset buffer
<leader>hp      - Preview hunk
<leader>hb      - Blame line
<leader>hd      - Diff this
ih              - Select hunk (text object)
```

### Debugging (nvim-dap)

```
<leader>db      - Toggle breakpoint
<leader>dc      - Continue/Start debugging
<leader>di      - Step into
<leader>do      - Step over
<leader>dO      - Step out
<leader>dt      - Terminate debugging
<leader>du      - Toggle DAP UI
```

**Breakpoint icons**: 🔴 = breakpoint, 🟡 = conditional, ▶️ = stopped, ❌ = rejected

### OpenCode (AI Assistant)

Integrates the opencode CLI with Neovim for editor-aware AI assistance.

#### Opening & Closing
```
<Leader>ot      - Toggle opencode terminal
<Leader>oo      - Open picker (browse all features)
<Leader>oa      - Ask opencode (input prompt)
```

#### Asking Questions
```
<Leader>oa      - Open ask input (normal mode)
<Leader>oa      - Ask about selection (visual mode)
go{motion}      - Operator: ask about motion target
goo             - Operator: ask about current line
goiw            - Operator: ask about word under cursor
goap            - Operator: ask about paragraph
```

#### Built-in Prompts
```
<Leader>oe      - Explain code
<Leader>or      - Review code for correctness
<Leader>of      - Fix diagnostics/errors
<Leader>od      - Add documentation/comments
<Leader>oi      - Implement stub code
<Leader>oz      - Optimize for performance/readability
<Leader>oT      - Generate test cases
```

#### Session Management
```
<Leader>on      - New session (fresh conversation)
<Leader>ol      - List all sessions
<Leader>oc      - Compact session (reduce context)
<Leader>ox      - Interrupt current operation
```

#### Context Placeholders (in prompts)

Use these in your prompts to inject context:
```
@this           - Selection, range, or cursor position
@buffer         - Current buffer content
@buffers        - All open buffers
@visible        - Visible text on screen
@diagnostics    - LSP/lint diagnostics
@quickfix       - Quickfix list items
@diff           - Git diff output
@marks          - Global mark positions
```

**Example prompts:**
- `explain @this` - Explain selected code
- `fix @diagnostics` - Fix current file errors
- `review @diff` - Review git changes

#### Inside OpenCode Terminal
```
<S-C-u>         - Scroll half page up
<S-C-d>         - Scroll half page down
```

#### Requirements
- Install opencode CLI: `go install github.com/sst/opencode@latest`
- Run opencode with `--port` flag for Neovim integration

### Custom Yanker

```
<leader>ya      - Interactive yank
  <Enter>       - Yank entire file
  {number}      - Yank N lines
```

### Window Management (Splits)

#### Navigation Between Windows
```
<C-h>           - Move to left window
<C-j>           - Move to bottom window
<C-k>           - Move to top window
<C-l>           - Move to right window
<C-w>w          - Cycle through windows
<C-w>p          - Go to previous window
```

#### Window Actions
```
<leader>wq      - Close current window (:q)
<leader>wo      - Close all other windows
<leader>ws      - Split horizontally
<leader>wv      - Split vertically
<leader>w=      - Make all windows equal size
:q              - Close current window
<C-w>q          - Close current window (alternative)
<C-w>o          - Close all other windows
```

#### Window Resizing
```
<C-w>=          - Make all windows equal size
<C-w>_          - Maximize current window height
<C-w>|          - Maximize current window width
<C-w>+          - Increase height
<C-w>-          - Decrease height
<C-w>>          - Increase width
<C-w><          - Decrease width
```

#### Moving Windows Around
```
<C-w>H          - Move window to far left (full height)
<C-w>J          - Move window to bottom (full width)
<C-w>K          - Move window to top (full width)
<C-w>L          - Move window to far right (full height)
<C-w>r          - Rotate windows
```

---

## Language-Specific Features

### Rust Development

**Tooling**:
- ✅ `rust-analyzer` - LSP for IntelliSense
- ✅ `rustfmt` - Auto-format on save
- ✅ `clippy` - Linting with best practices
- ✅ `rustaceanvim` - Enhanced Rust features
- ✅ `crates.nvim` - Cargo.toml dependency management
- ✅ `lldb` - Full debugging support

**Features**:
- Automatic formatting on save
- Clippy diagnostics on save
- Hover for crate versions in Cargo.toml
- All cargo features enabled
- Inline type hints

### Python Development

**Tooling**:
- ✅ `pyright` - Type checking & IntelliSense
- ✅ `ruff` - Fast linting & formatting (replaces black, isort, flake8)
- ✅ `debugpy` - Debugging support

**Features**:
- Auto-format on save with ruff
- Type checking with pyright
- Import sorting and optimization
- Code quality diagnostics
- Full breakpoint debugging

### React/TypeScript Development

**Tooling**:
- ✅ `ts_ls` - TypeScript LSP
- ✅ `eslint` - Linting
- ✅ `prettier` - Formatting
- ✅ `tailwindcss` - Tailwind IntelliSense
- ✅ `js-debug-adapter` - Debugging

**Features**:
- Auto-closing JSX/HTML tags (`nvim-ts-autotag`)
- Auto-pairing brackets/quotes (`nvim-autopairs`)
- Context-aware commenting in JSX
- Tailwind class autocomplete
- ESLint auto-fix on save
- Prettier formatting on save
- Full React debugging support

### JavaScript/TypeScript

Same as React, plus:
- Node.js debugging
- Template string support
- CommonJS & ESM module resolution

### HTML/CSS

- Auto-closing tags
- Emmet-like expansions (via LSP)
- CSS class IntelliSense
- HTML/CSS validation

### Svelte

- Full LSP support
- Context-aware commenting (HTML/JS/CSS)
- Syntax highlighting
- Auto-formatting

### Lua (Neovim Config)

- ✅ `lua_ls` - Neovim-aware LSP
- ✅ `stylua` - Formatting
- Neovim API completion
- vim.* namespace awareness

---

## Additional Features

### Auto-Formatting

Auto-formats on save for:
- **Rust**: rustfmt
- **Python**: ruff
- **TypeScript/JavaScript/JSX/TSX**: prettier
- **Lua**: stylua
- **HTML/CSS/JSON/YAML**: prettier

### Treesitter Syntax Highlighting

Enhanced syntax for:
- Rust, Python, Lua
- JavaScript, TypeScript, JSX, TSX
- HTML, CSS
- Svelte, Regex

### Theme

- **Gruvbox** (hard contrast, dark mode)
- Italic comments and operators
- Bold emphasis

---

## Tips & Tricks

### Efficient Editing Workflow

1. **Use relative line numbers**: Jump quickly with `{number}j/k`
2. **Combine operators with motions**: `d3w` (delete 3 words), `c$` (change to end)
3. **Visual block mode**: Multi-cursor editing with `<C-v>` + `I` or `A`
4. **Repeat with `.`**: Make a change, then repeat it elsewhere with `.`
5. **Use text objects**: `ci"` (change inside quotes), `da(` (delete around parentheses)

### Finding Things Fast

1. **Files**: `<C-p>` then fuzzy search
2. **Text**: `<leader>fg` then type pattern
3. **Symbols**: `<leader>gd` or `<leader>gr`
4. **Git changes**: `]c` / `[c]` to jump between hunks

### Code Quality

1. **Format before commit**: `<leader>gf`
2. **Check diagnostics**: `<leader>q` to see all issues
3. **Apply quick fixes**: `<leader>ca` on diagnostic
4. **Preview git changes**: `<leader>hp`

### Working with Splits (Windows)

1. **Go to definition in split**: `<leader>gd` opens definition below, use `<C-j>` to navigate to it
2. **Close split after viewing**: Press `:q` or `<leader>wq`
3. **Keep only current**: `<leader>wo` or `<C-w>o` closes all other windows
4. **Compare side-by-side**: `<leader>wv` to split vertically, then open another file
5. **Quick navigation**: Use `<C-h/j/k/l>` to jump between splits without thinking

---

## Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── ertyurk.lua         # General settings & keymaps
│   └── plugins/            # Plugin configurations
│       ├── opencode.lua    # AI assistant (opencode.nvim)
│       ├── comment.lua     # Commenting
│       ├── completions.lua # Auto-completion
│       ├── dap.lua         # Debugging
│       ├── git.lua         # Git integration
│       ├── lsp-config.lua  # LSP servers
│       ├── lualine.lua     # Status line
│       ├── none-ls.lua     # Formatting
│       ├── plugins.lua     # Copilot configuration
│       ├── react.lua       # React/JSX features
│       ├── telescope.lua   # Fuzzy finder
│       ├── theme.lua       # Gruvbox theme
│       └── treesitter.lua  # Syntax highlighting
└── lazy-lock.json          # Plugin versions
```

---

## Learning Resources

- **Vim Tutor**: Run `vimtutor` in terminal
- **Neovim Docs**: `:help` or `:h <topic>`
- **Plugin Docs**: `:h <plugin-name>`
- **LSP Info**: `:LspInfo`, `:Mason`
- **Telescope**: `:Telescope` then `<C-?>` for help

## Troubleshooting

```
:checkhealth              - Check setup issues
:Lazy                     - Plugin manager UI
:Mason                    - Install LSP servers/tools
:LspInfo                  - Check LSP status
:TSUpdate                 - Update Treesitter parsers
```

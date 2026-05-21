# Neovim Keymaps

Leader = `<Space>`. Auto-shown via which-key (300ms delay).

## Find (fff + telescope)

| Key | Action |
|---|---|
| `<C-p>` / `<leader>ff` | fff find files (indexed, frecency-aware) |
| `<leader>fg` | fff live grep (bigram-indexed) |
| `<leader>fo` | recent files (oldfiles) |
| `<leader>fh` | help tags |
| `<leader>fd` | diagnostics list |
| `<leader>fr` | resume last picker |
| `<leader>fs` | document symbols (LSP) |
| `<leader>fw` | grep word under cursor |
| `<leader>ft` | TODO comments |

## LSP / Goto

| Key | Action |
|---|---|
| `gd` / `<leader>gd` | go to definition |
| `gD` | go to declaration |
| `gr` / `<leader>gr` | references |
| `gi` | implementations |
| `K` | hover doc |
| `<leader>k` / `<C-k>` (insert) | signature help |
| `<leader>rn` | rename symbol |
| `<leader>ca` | code actions (n+v) |
| `<leader>gf` | format buffer (conform, n+v) |
| `<leader>e` | show diagnostic float |
| `<leader>q` | diagnostics loclist |
| `[d` / `]d` | prev / next diagnostic |
| `<leader>ll` | trigger nvim-lint |

## Format / Lint (conform + nvim-lint)

| Key / Cmd | Action |
|---|---|
| `<leader>gf` | format buffer (async, LSP fallback) |
| `:FormatDisable` | disable autoformat-on-save globally |
| `:FormatDisable!` | disable autoformat-on-save for buffer |
| `:FormatEnable` | re-enable autoformat-on-save |
| `<leader>ll` | run linters on buffer |

## Tailwind

| Key | Action |
|---|---|
| `<leader>ts` | sort Tailwind classes |
| `<leader>tc` | toggle conceal |
| `<leader>tC` | toggle color swatches |

## Git (fugitive)

| Key | Action |
|---|---|
| `<leader>gs` | git status |
| `<leader>gc` | git commit |
| `<leader>gp` | git push |
| `<leader>gl` | git pull |
| `<leader>gb` | git blame |
| `<leader>gD` | Gdiffsplit |
| `<leader>gV` | Gvdiffsplit |

## Git hunks (gitsigns)

| Key | Action |
|---|---|
| `]c` / `[c` | next / prev hunk |
| `<leader>hs` | stage hunk (n+v) |
| `<leader>hr` | reset hunk (n+v) |
| `<leader>hS` | stage buffer |
| `<leader>hu` | undo stage hunk |
| `<leader>hR` | reset buffer |
| `<leader>hp` | preview hunk |
| `<leader>hb` | blame line (full popup) |
| `<leader>hB` | toggle inline blame (virt-text on cursor line) |
| `<leader>hd` | diff this |
| `<leader>hD` | diff this `~` |
| `ih` (o/x) | hunk text object |

## Debug (DAP)

| Key | Action |
|---|---|
| `<leader>db` | toggle breakpoint |
| `<leader>dc` | continue |
| `<leader>di` | step into |
| `<leader>do` | step over |
| `<leader>dO` | step out |
| `<leader>dt` | terminate |
| `<leader>du` | toggle DAP UI |

## OpenCode (AI)

| Key | Action |
|---|---|
| `<leader>oo` | select picker |
| `<leader>oa` | ask (n+v) |
| `<leader>ot` | toggle |
| `<leader>oe` | explain |
| `<leader>or` | review |
| `<leader>of` | fix diagnostics |
| `<leader>od` | document |
| `<leader>oi` | implement |
| `<leader>oz` | optimize |
| `<leader>oT` | generate tests |
| `<leader>on` / `ol` / `oc` / `ox` | new / list / compact / interrupt session |
| `go` | operator (combine w/ motions: `goiw`, `goap`, `gG`) |

## Comment

| Key | Action |
|---|---|
| `gcc` | toggle line comment |
| `gbc` | toggle block comment |
| `gc` / `gb` (op) | line / block comment operator |
| `gcO` / `gco` | add comment above / below |
| `gcA` | add comment at EOL |

## Buffer

| Key | Action |
|---|---|
| `<leader>bn` / `]b` | next buffer |
| `<leader>bp` / `[b` | prev buffer |
| `<leader>bd` | delete buffer |

## Window

| Key | Action |
|---|---|
| `<C-h/j/k/l>` | move left / down / up / right window |
| `<leader>ws` / `wv` | split horizontal / vertical |
| `<leader>wq` | close current |
| `<leader>wo` | close others |
| `<leader>w=` | equal sizes |

## Editing

| Key | Action |
|---|---|
| `<Esc>` | clear search highlight |
| `<A-j>` / `<A-k>` (n+v) | move line / selection down / up |
| `<` / `>` (v) | indent and reselect |
| `<C-d>` / `<C-u>` | scroll centered |
| `n` / `N` | next / prev search centered |
| `<leader>p` (v) | paste w/o losing register |
| `<leader>ya` | yank N lines → clipboard (prompts count) |
| `]t` / `[t` | next / prev TODO |

## File browser (telescope-file-browser)

Open: `<leader>fb` (starts in current buffer's dir).

Insert mode:
| Key | Action |
|---|---|
| `<A-c>` | create file/dir (suffix `/` for dir) |
| `<S-CR>` | create from prompt text |
| `<CR>` | open file / enter dir |

Normal mode (press `<Esc>` first):
| Key | Action |
|---|---|
| `c` | create |
| `r` | rename |
| `d` | delete |
| `m` | move |
| `y` | copy |
| `h` | go up dir |
| `l` | open file / enter dir |
| `/` | toggle hidden |

## Surround (`nvim-surround`)

| Key | Action |
|---|---|
| `ys{motion}{char}` | add surround (e.g. `ysiw"` → wrap word in quotes) |
| `cs{old}{new}` | change surround (e.g. `cs"'` → " to ') |
| `ds{char}` | delete surround |
| `S{char}` (v) | surround selection |

## Copilot

| Key | Action |
|---|---|
| `<Tab>` | accept suggestion |
| `<M-w>` | accept next word |
| `<M-]>` / `<M-[>` | next / prev suggestion |
| `<C-]>` | dismiss |

## which-key groups

`<leader>` then wait 300ms → menu shows: `b` buffer, `c` code, `d` debug, `f` find, `g` git/goto, `h` git hunks, `l` lint, `o` opencode, `r` refactor, `t` tailwind, `w` windows, `y` yank.

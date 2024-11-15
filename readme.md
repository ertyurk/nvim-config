# Base

## Motions

### Basic Navigation

- `<h/j/k/l>`: Move left/down/up/right
- `<5j>`: Move 5 lines down
- `<$>`: Move to the end of the line
- `<0>`: Move to the start of the line
- `<^>`: Move to the first non-empty character
- `<C-o>`: Return from "Go to definition"

### Character Navigation

- `<f{char}>`: Move forward to `{char}`
- `<F{char}>`: Move backward to `{char}`

### Sentence/Paragraph Navigation

- `<(>)`: Move up/down by sentence
- `<{>} `: Move up/down by paragraph

### Word Navigation

- `<e/w/b>`: Move to end/forward/backward by word
- `<W/B>`: Move by whitespace-separated words

### Insert Mode

- `<o>`: Insert after the current line
- `<O>`: Insert before the current line
- `<i/a>`: Insert before/after the cursor

### Block Operations

- `<vib>`: Select inside parentheses
- `<viB>`: Select inside curly braces
- `<vi]>`: Select inside square brackets
- `<vi">`: Select inside double quotes
- `<cib>`: Change inside parentheses
- `<ciB>`: Change inside curly braces
- `<Ctrl-v>`: Enter visual block mode for multi-line edits
- `<Shift-i>`: Insert at the beginning of the block
- `<Shift-a>`: Append at the end of the block

### Joining Lines

- `<J>`: Join lines with space
- `<gJ>`: Join lines without space

### Replace Key

- Use `%s/old_key/new_key/gc` for search and replace:
  - `%`: Search in the entire file
  - `s`: Substitute
  - `g`: Replace all occurrences in each line
  - `c`: Confirm each replacement

### Search

- `<n/N>`: Move to the next/previous occurrence
- `<*>/#>`: Search forward/backward for the word under the cursor
- `gd`: Go to definition
- `gr`: Go to references
- `gi`: Go to implementation

### Text Operations

- `<C>`: Change to the end of the line
- `<S>`: Replace the current line
- `<s>`: Replace the current character
- `<yy/p>`: Copy/Paste line
- `<u/Ctrl-r>`: Undo/Redo
- `<yi(/{)>`: Copy inside parentheses/curly braces
- `<da{char}>`: Delete until `{char}`
- `<.>`: Repeat the last command

### Bookmarks

- `<m{char}>`: Set bookmark
- ``<`{char}>``: Go to bookmark
- ``<`>` ``: Toggle between the last two positions

## Custom Keybindings

### File Navigation

- `<C-p>`: Open file finder (Telescope `find_files`)
- `<leader>fg>`: Open live grep (Telescope `live_grep`)
- `<leader>fb>`: Open file browser (Telescope `file_browser`)

### Editing

- `K`: Show hover information
- `<leader>gd>`: Go to definition
- `<leader>gr>`: Go to references
- `<leader>ca>`: Trigger code action
- `<C-b/f>`: Scroll docs backward/forward
- `<C-Space>`: Open completion menu
- `<CR>`: Confirm selection

### Commenting

- `gcc`: Toggle line comment
- `gbc`: Toggle block comment
- `gc`: Comment in visual mode
- `gb`: Block comment in visual mode

### Custom Copier/Yanker

- `<leader>ya + Enter>`: Yank the entire file
- `<leader>ya + {number}>`: Yank {number} lines
- `<leader>ya + {input}>`: Yank entire file

## Language Server Protocol (LSP)

- `gd`: Go to definition
- `gr`: Go to references
- `gi`: Go to implementation
- `K`: Show hover information
- `<C-k>`: Show signature help
- `<leader>rn>`: Rename symbol
- `<leader>ca>`: Trigger code action
- `<leader>gf>`: Format buffer
- `<leader>gr>`: Find references
- `<leader>gd>`: Go to definition

## Completion (nvim-cmp)

- `<C-n/Down>`: Next item
- `<C-p/Up>`: Previous item
- `<CR/Tab>`: Confirm selection
- `<C-b/f>`: Scroll docs
- `<C-Space>`: Open completion menu
- `<C-e>`: Close completion menu

## Copilot

- `<Tab>`: Accept suggestion
- `<C-]>`: Dismiss suggestion
- `<M-]>`: Next suggestion
- `<M-[>`: Previous suggestion

## Avante for Neovim

The following key bindings are available for `avante.nvim`:

- `<Leader>aa`: Show sidebar
- `<Leader>ar`: Refresh sidebar
- `co`: Choose ours
- `ct`: Choose theirs
- `ca`: Choose all
- `cb`: Choose both
- `c0`: Choose none
- `]x`: Move to the previous conflict
- `[x`: Move to the next conflict
- `<M-l>`: Accept suggestion
- `<M-]>`: Next suggestion
- `<M-[>`: Previous suggestion
- `<C-]>`: Dismiss suggestion
- `]]`: Jump to the next conflict
- `[[`: Jump to the previous conflict
- `<CR>`: Submit the current conflict
- `<C-s>`: Submit the current conflict in insert mode

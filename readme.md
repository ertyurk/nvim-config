## My Needs

1. **Navigation within the File:**
   - Search for a key and replace it.
   - Select and replace all occurrences of a searched key.
   - Move up, down, left, right by X amount of chars/lines.
   - Go to the implementation of the selected key.
   - Go to references of the selected key.
   - Search and replace all with one-by-one approval throughout the whole project.
   - Automate within the file to replace all instances.

## Motions

- **Basic Motions:**
  - `<h>`: Left
  - `<j>`: Down
  - `<k>`: Up
  - `<l>`: Right
  - `<5j>`: Move 5 lines down
  - `<$>`: Jump to the end of the line
  - `<0>`: Jump to the beginning of the line
  - `<^>`: Jump to the first non-empty character

- **Character Navigation:**
  - `<f + {char}>`: Jump to the next occurrence of `{char}` in the line
  - `<F + {char}>`: Jump to the previous occurrence of `{char}` in the line

- **Sentence/Paragraph Navigation:**
  - `<(>`: One sentence up
  - `<)>`: One sentence down
  - `<{>`: One paragraph up
  - `<}>`: One paragraph down

- **Word Navigation:**
  - `<e>`: Jump to the end of the word
  - `<w>`: Move forward word by word
  - `<b>`: Move backward word by word
  - `<W>`: Move forward by whitespace-separated words
  - `<B>`: Move backward by whitespace-separated words

- **Insert Mode:**
  - `<o>`: Insert after the current line
  - `<O>`: Insert before the current line
  - `<i>`: Insert before the cursor
  - `<a>`: Insert after the cursor

- **Replace/Delete:**
  - `<C>`: Replace the current word
  - `<S>`: Replace the current line
  - `<s>`: Replace the current character
  - `<yy>`: Copy the whole line
  - `<p>`: Paste
  - `<u>`: Undo
  - `<Ctrl + r>`: Redo

- **Text Operations:**
  - `<y+i+{"( or {"}>`: Copy inside parentheses or curly braces without including them
  - `<y+a+{"( or {"}>`: Copy inside parentheses or curly braces including them
  - `<d + w>`: Delete the word
  - `<d + s>`: Delete the sentence
  - `<d + p>`: Delete the paragraph
  - `<d + t + {char}>`: Delete until a specific character
  - `<.>`: Repeat the last command

- **Search:**
  - `<n>`: Next occurrence of the highlighted keyword
  - `<N>`: Previous occurrence of the highlighted keyword
  - `<*>`: Search forward for the word under the cursor
  - `<#>`: Search backward for the word under the cursor

- **Bookmarks:**
  - `<m + {charX}>`: Set a bookmark
  - `<\` + {charX}>`: Go to the bookmark
  - `<\` + \`>`: Toggle between the last two positions
  - `<\` + .>`: Go to the last edit

## My Custom Keybindings

- `<C-p>`: Open file finder (builtin.find_files)
- `<leader>fg`: Open live grep (builtin.live_grep)
- `K`: Hover information (vim.lsp.buf.hover)
- `<leader>gd`: Go to definition (vim.lsp.buf.definition)
- `CTRL+o`: Back from "Go to definition"
- `<leader>gr`: Go to references (vim.lsp.buf.references)
- `<leader>ca`: Code action (vim.lsp.buf.code_action)
- `<C-b>`: Scroll docs backward (nvim-cmp)
- `<C-f>`: Scroll docs forward (nvim-cmp)
- `<C-Space>`: Open completion menu (nvim-cmp)
- `<C-e>`: Close completion menu (nvim-cmp)
- `<CR>`: Confirm selection (nvim-cmp)

## Commenting

- `gcc`: Toggle line comment
- `gbc`: Toggle block comment
- `gc`: Toggle line comment (visual mode)
- `gb`: Toggle block comment (visual mode)

## Custom Copier/Yanker

- `<leader>ya` + Enter: Yank the whole file.
- `<leader>ya` + number + Enter: Yank that many lines.
- `<leader>ya` + any non-numeric input + Enter: Yank the whole file.

## File Navigation

- `<C-p>`: Open file finder (Telescope `find_files`)
- `<leader>fg`: Open live grep (Telescope `live_grep`)
- `<leader>fb`: Open file browser (Telescope `file_browser`)

### File Browser Actions (Telescope)

- **Insert Mode:**
  - `<A-c>`: Create a new file/folder
  - `<S-CR>`: Create a new file/folder from the prompt
- **Normal Mode:**
  - `c`: Create a new file/folder
  - `r`: Rename the selected file/folder

## Copilot

- **Default Shortcuts:**
  - `<Tab>`: Accept suggestion (insert mode)
  - `<C-]>`: Dismiss suggestion
  - `<M-]>`: Next suggestion
  - `<M-[>`: Previous suggestion

## Language Server Protocol (LSP)

- `gd`: Go to definition
- `gr`: Go to references
- `gi`: Go to implementation
- `K`: Hover information
- `<C-k>`: Show signature help
- `<leader>rn`: Rename symbol
- `<leader>ca`: Code action
- `<leader>gf`: Format buffer
- `<leader>gr`: Find references
- `<leader>gd`: Go to definition

## Completion (nvim-cmp)

- `<C-n>` or `<Down>`: Next item in completion menu
- `<C-p>` or `<Up>`: Previous item in completion menu
- `<CR>` or `<Tab>`: Confirm selection
- `<C-b>`: Scroll docs backward
- `<C-f>`: Scroll docs forward
- `<C-Space>`: Open completion menu
- `<C-e>`: Close completion menu
- `<CR>`: Confirm selection

# My Vim Setup

### My Needs

1. **File Navigation:**

   - Search and replace specific keys.
   - Move by characters/lines.
   - Jump to key implementations and references.
   - Search and replace across the project with approval.

2. **Motions:**

   - `<ZZ>`: Save and exit
   - `<ZQ>`: Exit without saving
   - `<vib>`: Select inside parentheses
   - `<viB>`: Select inside curly braces
   - `<vi]>`: Select inside square brackets
   - `<vi">`: Select inside double quotes
   - `<cib>`: Change inside parentheses
   - `<ciB>`: Change inside curly braces
   - `<ctrl + v>`: Visual block mode for multi-line edits
   - `<shift + i>`: Insert at beginning, `<shift + a>`: Append at end
   - `<%>`: Jump to matching parentheses
   - `<J>`: Join lines
   - `<gJ>`: Join lines without spaces

3. **Replace Key:**

   - Use `%s/old_key/new_key/gc` for search and replace:
     - `%`: Entire file
     - `s`: Substitute
     - `g`: Replace all occurrences in each line
     - `c`: Confirm each replacement

4. **Basic Motions:**

   - `<h/j/k/l>`: Left/Down/Up/Right
   - `<5j>`: Move 5 lines down
   - `<$>`: End of line, `<0>`: Start of line
   - `<^>`: First non-empty character

5. **Character Navigation:**

   - `<f{char}>`: Forward to `{char}`
   - `<F{char}>`: Backward to `{char}`

6. **Sentence/Paragraph Navigation:**

   - `<(>)`: Up/Down by sentence
   - `<{>} `: Up/Down by paragraph

7. **Word Navigation:**

   - `<e/w/b>`: End of word/Forward by word/Backward by word
   - `<W/B>`: Move by whitespace-separated words

8. **Insert Mode:**

   - `<o>`: Insert after current line
   - `<O>`: Insert before current line
   - `<i/a>`: Insert before/after cursor

9. **Replace/Delete:**

   - `<C>`: Change to end of line
   - `<S>`: Replace current line
   - `<s>`: Replace current character
   - `<yy/p>`: Copy/Paste line
   - `<u/Ctrl + r>`: Undo/Redo

10. **Text Operations:**

    - `<yi( or {)>`: Copy inside parentheses/curly braces
    - `<da{char}>`: Delete until `{char}`
    - `<.>`: Repeat last command

11. **Search:**

    - `<n/N>`: Next/Previous occurrence
    - `<*>/#>`: Search forward/backward for word under cursor

12. **Bookmarks:**
    - `<m{char}>`: Set bookmark
    - `<\`{char}>`: Go to bookmark
    - `<\`\`>`: Toggle between last two positions

### Custom Keybindings

- **File Navigation:**

  - `<C-p>`: Open file finder
  - `<leader>fg>`: Open live grep
  - `<leader>fb>`: Open file browser

- **Editing:**

  - `K`: Hover information
  - `<leader>gd>`: Go to definition
  - `<leader>gr>`: Go to references
  - `<leader>ca>`: Code action
  - `<C-b/f>`: Scroll docs backward/forward
  - `<C-Space>`: Open completion menu
  - `<CR>`: Confirm selection

- **Commenting:**

  - `gcc`: Toggle line comment
  - `gbc`: Toggle block comment
  - `gc`: Comment (visual mode)
  - `gb`: Block comment (visual mode)

- **Custom Copier/Yanker:**
  - `<leader>ya + Enter>`: Yank entire file
  - `<leader>ya + {number}>`: Yank {number} lines
  - `<leader>ya + {input}>`: Yank entire file

### Language Server Protocol (LSP)

- `gd`: Go to definition
- `gr`: Go to references
- `gi`: Go to implementation
- `K`: Hover information
- `<C-k>`: Signature help
- `<leader>rn>`: Rename symbol
- `<leader>ca>`: Code action
- `<leader>gf>`: Format buffer
- `<leader>gr>`: Find references
- `<leader>gd>`: Go to definition

### Completion (nvim-cmp)

- `<C-n/Down>`: Next item
- `<C-p/Up>`: Previous item
- `<CR/Tab>`: Confirm selection
- `<C-b/f>`: Scroll docs
- `<C-Space>`: Open completion menu
- `<C-e>`: Close completion menu

### Copilot

- `<Tab>`: Accept suggestion
- `<C-]>`: Dismiss suggestion
- `<M-]`: Next suggestion
- `<M-[>`: Previous suggestion

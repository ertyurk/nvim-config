## My Needs

4. Navigation within the file
   1. search a key 2. replace the searched key 3. select all keys that is searched 1. and replace all
   2. up down left right with X amount of chars/lines
   3. go to implementation of the cursored key
   4. go to references of the cursored key
   5. search and replace all with one by one approval of the change in whole project
   6. Automation within the file to replace all

## MOTIONS:

<h> Left
<j> Down
<k> Up
<l> Right

these commands can be prefixed with a number i.e. <5j> will mean that <5 times j> 5 lines down

<$> jump to the end of the line
<0> jump to the beginning of the line
<^> jump to the first non empty character
<f + {char}> jump to the next char in the line
<F + {char}> jump to the previous char in the line

<(> one sentence up
<)> one sentence down
<{> one paragraph up
<}> one paragraph down

<ctrl+U>

<e> jump to the end oof the word
<w> Navigate forward word by word (combinable by numbers)
<b> Navigate backward word by word (combinable by numbers)

<W> Navigate forward ??
<B> Navigate backward ??

<o> Insert to after current line
<O> Insert to before current line
<i> Insert to the of the cursor
<a> Insert the text after the curser

<C> replace the current word
<S> Replace the current line
<s> replace the current char

<yy> copy the whole line

<p> paste
<u> undo
<ctrl + r> redo
<y+i+{"( or {"}> copies in between paranthesis or curly braces or square brackets but *without* including them 
<y+a+{"( or {"}> copies in between paranthesis or curly braces or square brackets but *WITH* including them

<d + w> delete the word
<d + s> delete the sentence
<d + p> delete the paragraph
<d + t + {char}> deletes until specific char

<.> we can repeate operations with dots.

<n> iterate on highlighted and matched keyword forwards
<N> iterate backwards

<\*> Search the word that cursor on forward
<#> search the word that cursor on backwards

<m + {charX}> bookmarking a position
<` + {charX}> bookmarking a position
<` + `> toggle on last two position 
<` + .> goes to where the last edit happened

My Customs
'<C-p>', builtin.find_files
'<leader>fg', builtin.live_grep
"K", vim.lsp.buf.hover
"<leader>gd", vim.lsp.buf.definition
"CTRL+o" back from go to definition
"<leader>gr", vim.lsp.buf.references
"<leader>ca", vim.lsp.buf.code_action

["<C-b>"] = cmp.mapping.scroll_docs(-4),
["<C-f>"] = cmp.mapping.scroll_docs(4),
["<C-Space>"] = cmp.mapping.complete(),
["<C-e>"] = cmp.mapping.abort(),
["<CR>"] = cmp.mapping.confirm({ select = true }),

## Comment Line

gcc: Toggle line comment
gbc: Toggle block comment
gc: Toggle line comment (in visual mode)
gb: Toggle block comment (in visual mode)

## My Custom Copier/yanker

<leader>ya followed by Enter: Yanks the whole file.
<leader>ya followed by a number and Enter: Yanks that many lines.
<leader>ya followed by any non-numeric input and Enter: Yanks the whole file.

# to be cleaned:

File Navigation: - `<C-p>`: Open Telescope file finder (find_files) - `<leader>fg`: Open Telescope live grep for searching file contents - `<leader>fb`: Open Telescope file browser

- File Browser Actions (when in Telescope file browser):
  - Insert mode:
    - `<A-c>`: Create a new file or folder
    - `<S-CR>`: Create a new file or folder from the prompt
  - Normal mode:
    - `c`: Create a new file or folder
    - `r`: Rename the selected file or folder
- Copilot:
  - Copilot is installed, but no custom keybindings are set. It typically uses its default shortcuts:
    - `<Tab>`: Accept suggestion (in insert mode)
    - `<C-]>`: Dismiss current suggestion
    - `<M-]>`: Cycle to next suggestion
    - `<M-[>`: Cycle to previous suggestion
- Language Server Protocol (LSP):
  - LSP is configured, but no custom keybindings are set. Typical default LSP shortcuts include:
    - `gd`: Go to definition
    - `gr`: Go to references
    - `gi`: Go to implementation
    - `K`: Show hover information
    - `<C-k>`: Show signature help
    - `<leader>rn`: Rename symbol
    - `<leader>ca`: Code action
    - `<leader>gf`: Format buffer
    - `<leader>gr`: Find references
    - `<leader>gd`: Go to definition
- Completion (nvim-cmp):
  - The completion plugin is installed, but no custom keybindings are set. Typical default behaviors include:
    - `<C-n>` or `<Down>`: Navigate to the next item in the completion menu
    - `<C-p>` or `<Up>`: Navigate to the previous item in the completion menu
    - `<CR>` or `<Tab>`: Confirm selection
  - Completion (nvim-cmp) Shortcuts:
  - <C-b>: Scroll docs backward
  - <C-f>: Scroll docs forward
  - <C-Space>: Open completion menu
  - <C-e>: Close completion menu
  - <CR> (Enter): Confirm selection

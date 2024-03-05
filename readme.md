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

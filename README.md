# vim-tiling-submode
vim "submode" to efficiently edit windows and buffers

The original idea of that submode was to stop pressing over and over `<C-W>`. So the "submode" does it for you : when you entered that mode, the usefull keys are prepended by `<C-W>`.

It also implements features like displaying existing buffers, selecting a buffer, maximizing a window, or opening a terminal on a window.

# basic principle

The "tiling submode" asks characters one by one.
You can quit it with pressing either `<space>`, `<cr>` or `q`

Keys like `h`, `j`, `k`, `l`, `s`, `v`, ... are prepended by `<C-W>`. That is because `<C-w>j` is quite usefull and annoying to type.
So all these keys are simply mapped to themselves, but with `<C-W>` before : `whjklHJKLorRc=+-<>_|sv`
Then, other keys are added to perform other action (like `n` that goes to the next buffer, or `!` that opens a terminal on the current window)

# list of features

| action | charater(s) |
| ------ | ----------- |
| add `<C-W>` before the key | `w`, `h`, `j`, `k`, `l`, `H`, `J`, `K`, `L`, `o`, `r`, `R`, `c`, `=`, `+`, `-`, `<`, `>`, `_`, `|`, `s`, `v`, `T` |
| quit submode | `<space>`, `<cr>`, `q` |
| split with an empty buffer | `S` |
| split with an empty buffer (vertical) | `V` |
| create a new tab | `t` |
| use markstory/vim-zoomwin plugin | `z` |
| maximize current window | `m` |
| use francoiscabrol/ranger.vim | `f` |
| use fzf (plugin) to find buffer | `b` |
| i display buffers (like `:ls` but in a popup) | `i` |
| prompt for a buffer name or number and open it in the current window | `B` |
| next buffer | `n` |
| previous buffer | `p` |
| start an embed terminal in the current window | `!` |



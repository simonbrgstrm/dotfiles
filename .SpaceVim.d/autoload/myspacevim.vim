function! myspacevim#after() abort
  set nohlsearch
  set guicursor=

endfunction

function! myspacevim#before() abort
let g:mapleader = ','
nmap <leader>ww :e ~/zettelkasten/index.md<CR>
nmap <leader>u :MundoShow<CR>
nmap <leader>sf :Files<CR>
nmap <leader>m :marks<CR>

"===========================================
" fzf 
" examples
" See :h fzf_colors

let $FZF_DEFAULT_OPTS = '--info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"===========================================

endfunction

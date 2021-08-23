function! myspacevim#after() abort
  set nohlsearch
  set incsearch
  set guicursor=
  set scrolloff=10
  set guifont=Hack\ Nerd\ Font\ 11

endfunction

function! myspacevim#before() abort



"=================== keys ====================

let g:mapleader = ','
nmap <leader>ww :e ~/zettelkasten/index.md<CR>
nmap <leader>u :MundoShow<CR>
nmap <leader>c :ColorizerToggle<CR>

"=============================================

nnoremap <silent> J :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>==``
nnoremap <silent> K :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>==``
xnoremap <silent> J :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv=gv
xnoremap <silent> K :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv=gv

"=============================================


"================= Telescope =================
call SpaceVim#custom#SPC('nnoremap', ['f', 'f'], ':Telescope find_files theme=get_ivy', 'find files in current buffer', 1)

call SpaceVim#custom#SPC('nnoremap', ['f', 'm'], ':Telescope marks theme=get_ivy', 'list marks and value', 1)

call SpaceVim#custom#SPC('nnoremap', ['f', 'j'], ':Telescope grep_string theme=get_ivy', 'search string in current dir', 1)


"=============================================


"==================== fzf ====================
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
"=============================================

endfunction

function! myspacevim#before() abort
  let g:mapleader = ','
nmap <leader>ww :e ~/zettelkasten/index.md<CR>
endfunction

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/4
augroup END

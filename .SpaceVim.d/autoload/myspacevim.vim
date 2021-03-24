function! myspacevim#before() abort
  let g:mapleader = ','
endfunction

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/4
augroup END

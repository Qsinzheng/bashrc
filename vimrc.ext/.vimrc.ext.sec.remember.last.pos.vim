""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rember last position setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [low-level]rember last position -- (copied from http://www.162cm.com/archives/884.html)
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$") | exe("norm '\"") | else | exe “norm $"|endif|endifset viminfo='1000,f1,<500

" [not-recommended]rember last position -- (copied from /etc/vimrc)
" When editing a file, always jump to the last known cursor position. 
" Don't do it when the position is invalid or when inside an event handler 
" (happens when dropping a file on gvim). 
"autocmd BufReadPost * 
"\ if line("'\"") > 0 && line("'\"") <= line("$") | 
"\   exe "normal g`\"" | 
"\ endif 

" [improved-version]rember last position -- (copied from http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session)
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

if has("folding")
  function! UnfoldCur()
    if !&foldenable
      return
    endif
    let cl = line(".")
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute "normal!" min . "zo"
      return 1
    endif
  endfunction
endif

augroup resCur
  autocmd!
  if has("folding")
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

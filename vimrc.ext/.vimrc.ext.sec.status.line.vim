""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status line setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi StatusLine term=bold cterm=bold ctermfg=black ctermbg=cyan
hi StatusHostname term=bold cterm=bold ctermfg=107 ctermbg=235 guifg=#799d6a

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

set laststatus=2
set statusline=%#StatusLine#%F%h%m%r\ %h%w%y\ col:%c\ lin:%l\/%L\ buf:%n\ win:%{WindowNumber()}\ \%=%#StatusLine#%{strftime(\"%d/%m/%Y-%H:%M\")}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

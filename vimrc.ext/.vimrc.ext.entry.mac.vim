" vimrc setting for mac
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc.common
""""""""""""""""""""""""""""""""""""""""
source ~/.vimrc.ext/.vimrc.ext.entry.common.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme setting for mac terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:colorscheme_use_default')
    if g:colorscheme_use_default != 'true'
        colorscheme desert
        "colorscheme evening
        "colorscheme ron
    endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

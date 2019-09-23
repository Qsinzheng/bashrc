" vimrc.simple
" vimrc setting of Qsinzheng, since 20110710, updated at 20171012
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim compatibility setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" get easier to use and more user friendly vim defaults
" CAUTION: This option breaks some vi compatibility. 
"          Switch it off if you prefer real vi compatibility
set nocompatible
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" 1.1.CONTENT settings(Basis)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encode setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set enc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,cp936,shift-jis
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" 2.1.APPEARANCE settings(Basis)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" line number setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:colorscheme_use_default')
    if g:colorscheme_use_default != 'true'
        "colorscheme desert
        colorscheme evening
        "colorscheme ron
    endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight setting 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax on
" highlight search 
set hlsearch
set incsearch
"" cursor line highlighting
"set cursorline
""hi CursorLine   cterm=NONE ctermbg=cyan
""hi CursorLine   cterm=NONE ctermbg=blue
"hi CursorLine   term=underline cterm=underline ctermbg=NONE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set cindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


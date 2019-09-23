set hidden " 避免必须保存修改才可以跳转buffer

" buffer快速导航
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>

" 查看buffers
nnoremap <Leader>l :ls<CR>

" 通过索引快速跳转
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" tabline setting
"function MyTabLine()
"  let s = ''
"  for i in range(tabpagenr('$'))
"    " select the highlighting
"    if i + 1 == tabpagenr()
"      let s .= '%#TabLineSel#'
"    else
"      let s .= '%#TabLine#'
"    endif
"
"    " set the tab page number (for mouse clicks)
"    let s .= '%' . (i + 1) . 'T'
"
"    " the label is made by MyTabLabel()
"    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
"  endfor
"
"  " after the last tab fill with TabLineFill and reset tab page nr
"  let s .= '%#TabLineFill#%T'
"
"  " right-align the label to close the current tab page
"  if tabpagenr('$') > 1
"    let s .= '%=%#TabLine#%999Xclose'
"  endif
"
"  return s
"endfunction
"set tabline=%!MyTabLine()


" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif


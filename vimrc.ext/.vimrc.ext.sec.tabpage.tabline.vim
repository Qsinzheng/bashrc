set hidden " 避免必须保存修改才可以跳转buffer

" tabpage快速导航
nnoremap <Leader>b gT
nnoremap <Leader>f gt

" 查看tabs
nnoremap <Leader>t :tabs<CR>

" 通过索引快速跳转
nnoremap <Leader>1  1gt<CR>
nnoremap <Leader>2  2gt<CR>
nnoremap <Leader>3  3gt<CR>
nnoremap <Leader>4  4gt<CR>
nnoremap <Leader>5  5gt<CR>
nnoremap <Leader>6  6gt<CR>
nnoremap <Leader>7  7gt<CR>
nnoremap <Leader>8  8gt<CR>
nnoremap <Leader>9  9gt<CR>
nnoremap <Leader>10 10gt<CR>
nnoremap <Leader>11 11gt<CR>
nnoremap <Leader>12 12gt<CR>
nnoremap <Leader>13 13gt<CR>
nnoremap <Leader>14 14gt<CR>
nnoremap <Leader>15 15gt<CR>
nnoremap <Leader>16 16gt<CR>
nnoremap <Leader>17 17gt<CR>
nnoremap <Leader>18 18gt<CR>
nnoremap <Leader>19 19gt<CR>
nnoremap <Leader>20 20gt<CR>

" buffer快速导航
nnoremap <Leader><Leader>b :bp<CR>
nnoremap <Leader><Leader>f :bn<CR>

" 查看buffers
nnoremap <Leader><Leader>l :ls<CR>

" 通过索引快速跳转
nnoremap <Leader><Leader>1  :1b<CR>
nnoremap <Leader><Leader>2  :2b<CR>
nnoremap <Leader><Leader>3  :3b<CR>
nnoremap <Leader><Leader>4  :4b<CR>
nnoremap <Leader><Leader>5  :5b<CR>
nnoremap <Leader><Leader>6  :6b<CR>
nnoremap <Leader><Leader>7  :7b<CR>
nnoremap <Leader><Leader>8  :8b<CR>
nnoremap <Leader><Leader>9  :9b<CR>
nnoremap <Leader><Leader>10 :10b<CR>
nnoremap <Leader><Leader>11 :11b<CR>
nnoremap <Leader><Leader>12 :12b<CR>
nnoremap <Leader><Leader>13 :13b<CR>
nnoremap <Leader><Leader>14 :14b<CR>
nnoremap <Leader><Leader>15 :15b<CR>
nnoremap <Leader><Leader>16 :16b<CR>
nnoremap <Leader><Leader>17 :17b<CR>
nnoremap <Leader><Leader>18 :18b<CR>
nnoremap <Leader><Leader>19 :19b<CR>
nnoremap <Leader><Leader>20 :20b<CR>

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


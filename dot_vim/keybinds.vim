""" Copy and paste from clipboard
vnoremap <Leader>x "+x
vnoremap <Leader>c "+y
map <Leader>v "+gP
cmap <C-v> <C-R>+

""" Unite
nnoremap <silent> <Leader>b :<C-u>UniteWithProjectDir buffer<CR>
nnoremap <silent> <Leader>o :<C-u>UniteWithProjectDir file<CR>
nnoremap <silent> <Leader>t :<C-u>UniteWithProjectDir file_rec/async<CR>
nnoremap <silent> <leader>p :<C-u>UniteWithProjectDir history/yank<CR>
nnoremap <silent> <leader>g :<C-u>UniteWithProjectDir grep:.<CR>

""" Undotree
nnoremap <leader>u :<C-u>:UndotreeToggle<CR>

""" Line movement (Unimpaired and etc)
" Bubble single lines
nmap <A-Up> [e
nmap <A-Down> ]e
" Bubble multiple lines
vmap <A-Up> [egv
vmap <A-Down> ]egv
" Indent
map <A-Right> >>
map <A-Left> <<
vmap <A-Right> >gv
vmap <A-Left> <gv

""" Viewports
nnoremap <silent> <C-Up> :<C-u>wincmd k<CR>
nnoremap <silent> <C-Down> :<C-u>wincmd j<CR>
nnoremap <silent> <C-Right> :<C-u>wincmd l<CR>
nnoremap <silent> <C-Left> :<C-u>wincmd h<CR>
nnoremap <silent> <C-S-Up> :<C-u>ObviousResizeUp<CR>
nnoremap <silent> <C-S-Down> :<C-u>ObviousResizeDown<CR>
nnoremap <silent> <C-S-Left> :<C-u>ObviousResizeLeft<CR>
nnoremap <silent> <C-S-Right> :<C-u>ObviousResizeRight<CR>
nnoremap <silent> <C-=> :<C-u>wincmd =<CR>
nnoremap <silent> <C-Backspace> :<C-u>ZoomWin<CR>
nnoremap <silent> <C-w> :<C-u>bw<CR>

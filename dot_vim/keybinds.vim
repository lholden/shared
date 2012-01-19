" CtrlP
map <Leader>t :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
vmap <Leader>t <ESC>:CtrlP<CR>
vmap <Leader>b <ESC>:CtrlPBuffer<CR>

" Bubble lines
map <C-Up> [e
map <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Indentation
map <Leader>[ <<
map <Leader>] >>
vmap <Leader>] >gv
vmap <Leader>[ <gv

" Commenting
map <Leader>/ <plug>NERDCommenterToggle<CR>
vmap <Leader>/ <plug>NERDCommenterToggle<CR>

" Viewports
map <Leader><Up> <C-w>k
map <Leader><Down> <C-w>j
map <Leader><Right> <C-w>l
map <Leader><Left> <C-w>h
map <Leader>= <C-w>=
map <Leader><Backspace> :ZoomWin<CR>
map <S-Up> :ObviousResizeUp<CR>
map <S-Down> :ObviousResizeDown<CR>
map <S-Right> :ObviousResizeRight<CR>
map <S-Left> :ObviousResizeLeft<CR>

" Gundo
map <leader>u :GundoToggle<CR>
vmap <leader>u <ESC>:GundoToggle<CR>

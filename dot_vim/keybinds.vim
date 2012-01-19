" FuzzyFinder
map <Leader>b :FufBuffer<CR>
vmap <Leader>b <ESC>:FufBuffer<CR>
map <Leader>o :FufFile<CR>
vmap <Leader>o <ESC>:FufFile<CR>

" CtrlP
map <Leader>t :CtrlP<CR>
vmap <Leader>t <ESC>:CtrlP<CR>

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

" Gundo
map <leader>u :GundoToggle<CR>
vmap <leader>u <ESC>:GundoToggle<CR>

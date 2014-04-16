""" Copy and paste from clipboard
vnoremap <Leader>x "+x
vnoremap <Leader>c "+y
map <Leader>v "+gP
cmap <C-v> <C-R>+

""" Unite
nnoremap <Leader>b :<C-u>Unite buffer<CR>
nnoremap <Leader>o :<C-u>Unite file<CR>
nnoremap <Leader>t :<C-u>Unite file_rec/async<CR>
nnoremap <leader>p :<C-u>Unite history/yank<CR>
nnoremap <leader>g :<C-u>Unite grep:.<CR>

""" Undotree
nnoremap <leader>u :<C-u>:UndotreeToggle<CR>

""" Unimpared
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

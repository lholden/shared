set nocompatible
runtime vundle.vim
runtime keybinds.vim

syntax on

filetype plugin indent on
filetype plugin on

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile {*.tt,*.tin} set syntax=tt

set autoindent
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nohls
set incsearch
set ignorecase
set smartcase
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,.hg
set wildmenu
set laststatus=2
set hidden
set title
set scrolloff=3
set shortmess=atI
set visualbell
set wrap
set linebreak
set breakat=\ |@-+;,./?^I
set showbreak=~>\ 
set cursorline
set modeline
set modelines=10
set backspace=indent,eol,start
set autoread

colorscheme jellybeans
hi SpellBad term=reverse cterm=underline ctermbg=88 gui=underline guibg=#401010 guisp=Red
hi SpellCap term=reverse cterm=underline ctermbg=20 gui=underline guibg=#000040 guisp=Blue
hi SpellRare term=reverse cterm=underline ctermbg=53 gui=underline guibg=#310041 guisp=Magenta
hi SpellLocal term=underline cterm=underline ctermbg=23 gui=underline guibg=#003020 guisp=Cyan
highlight Cursor guifg=black guibg=grey

" YankRing
let g:yankring_history_file = '.yankring_history'

" vim-statline
let g:statline_fugitive = 1

" ctrlp
let g:ctrlp_lazy_update = 100
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 12

" vimwiki
let g:vimwiki_list = [{'path': $HOME.'/.wiki/', 'path_html': $HOME.'/.wiki_html/'}]

" FuzzyFinder
let g:fuf_abbrevMap = {
      \ '^vim:' : [ $VIMHOME ],
      \ '^home:' : [ $HOME ],
      \}

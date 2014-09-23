let $VIMHOME=expand('<sfile>:p:h')
set nocompatible

"runtime vundle.vim
runtime packages.vim
runtime keybinds.vim

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile {*.tt,*.tin} set syntax=tt

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nohls
set ignorecase
set smartcase
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,.hg
set hidden
set title
set shortmess=atI
set visualbell
set wrap
set linebreak
"set breakat=\ |@-+;,./?^I
set showbreak=~>\ 
set cursorline
set modeline
set modelines=10
set ttymouse=xterm2
set mouse=a
set mousemodel=popup


colorscheme jellybeans
hi SpellBad term=reverse cterm=underline ctermbg=88 gui=underline guibg=#401010 guisp=Red
hi SpellCap term=reverse cterm=underline ctermbg=20 gui=underline guibg=#000040 guisp=Blue
hi SpellRare term=reverse cterm=underline ctermbg=53 gui=underline guibg=#310041 guisp=Magenta
hi SpellLocal term=underline cterm=underline ctermbg=23 gui=underline guibg=#003020 guisp=Cyan
highlight Cursor guifg=black guibg=grey

""" Unite Options
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1

""" Undotree Options
let g:undotree_SetFocusWhenToggle=1

""" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''

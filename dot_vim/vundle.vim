""" If VIM doesn't automatically clone vundle and setup the plugins:
" mkdir bundle; cd bundle
" git clone https://github.com/gmarik/vundle.git
" vim +BundleInstall

filetype off
let $VIMHOME=expand('<sfile>:p:h')

if !isdirectory($VIMHOME . "/bundle")
  echo "Making bundle directory\n"
  call mkdir($VIMHOME . "/bundle")
endif

if !isdirectory($VIMHOME . "/bundle/vundle")
  silent !git clone https://github.com/gmarik/vundle.git $VIMHOME/bundle/vundle
endif

let &rtp.=',' . $VIMHOME . '/bundle/vundle/'
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'millermedeiros/vim-statline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
Bundle 'sickill/vim-pasta'
Bundle 'kien/ctrlp.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/ZoomWin'
Bundle 'pangloss/vim-javascript'
Bundle 'mileszs/ack.vim'
Bundle 'auto_mkdir'
Bundle 'talek/obvious-resize'
Bundle 'YankRing.vim'
Bundle 'clones/vim-l9'
Bundle 'clones/vim-fuzzyfinder' 
Bundle 'vimwiki'
Bundle 'tangledhelix/vim-octopress'
Bundle 'syntax-highlighting-for-tintinttpp'
Bundle 'jayed/slimv'

if !isdirectory($VIMHOME . "/bundle/vim-fugitive/")
  BundleInstall
  exit
endif

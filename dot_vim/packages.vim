let $BUNDLEHOME=expand($VIMHOME.'/bundle')

if !isdirectory($BUNDLEHOME)
  call mkdir($BUNDLEHOME)
endif

if !isdirectory($BUNDLEHOME . '/neobundle.vim')
  silent !git clone https://github.com/Shougo/neobundle.vim $BUNDLEHOME/neobundle.vim
endif

let &rtp.=',' . $BUNDLEHOME . '/neobundle.vim/'

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
endif

call neobundle#begin($BUNDLEHOME)

""" Base
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

""" Languages
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'Mizuchi/STL-Syntax'

""" General
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'vits/ZoomWin'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'talek/obvious-resize'

""" Themes
NeoBundle 'nanotech/jellybeans.vim'

call neobundle#end()

NeoBundleCheck
silent NeoBundleClean !

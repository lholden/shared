if has("gui_running")
  set number
  set spell
  set spelllang=en_us
  set guioptions-=T
  set guioptions-=m
  set winaltkeys=no
  set clipboard=unnamed
  set mousemodel=popup 

  if has("gui_macvim")
    macmenu File.New\ Tab key=<D-T>
    macmenu File.Open\.\.\. key=<nop>
    macmenu Tools.Make key=<nop>
    macmenu Edit.Find.Find\.\.\. key=<nop>

    set fuoptions=maxhorz,maxvert
    set guifont=Menlo\ Regular:h12
  endif

  set guifont=DejaVu\ Sans\ Mono\ 11
endif

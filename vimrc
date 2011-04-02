set number
syntax enable
set ts=4
set ruler
set showmode
set showcmd
set hidden
set showmatch
set laststatus=2
set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%))

if has('gui_running')
  set background=dark
  colorscheme solarized
endif

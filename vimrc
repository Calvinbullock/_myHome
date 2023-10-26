set number relativenumber

" Formatting
filetype indent on
filetype plugin indent on

" code language highlighting  
:filetype plugin on
:syntax on

" mouse mode
" set mouse=a

" Spell check
set spell
" change from red highlighting to red underline
hi clear spellBad
hi SpellBad cterm=underline ctermfg=red
hi SpellBad gui=undercurl

" Changes the cursor shape between line (insert) bar normal
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" speeds up cursor change
set ttimeout
set ttimeoutlen=1
set ttyfast

" Set leader key to space
let mapleader = " "

" prevent x key from overwriting clipboard
noremap x "_x
noremap X "_x

" space f enters file explorer mode
:map  f :Ex<enter>

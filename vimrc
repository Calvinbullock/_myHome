
" Things To Add:
" 1 better syntax highlighting / LSP
" 2 ctrl+n auto complete (might tb conected to the above...)
" 3 Git intagration


" ------------------------------------- +
" LSP					|
" ------------------------------------- +
" Install Pathogen
"call pathogen#infect()

" Enable vim-monokai
"colorscheme monokai


" ------------------------------------- +
" Formatting:				|
" ------------------------------------- +

filetype indent on
filetype plugin indent on

" ------------------------------------- +
" Code Language Highlighting: 		|
" ------------------------------------- +

:filetype plugin on
:syntax on

" mouse mode
" set mouse=a

" ------------------------------------- +
" Spell Check: 				|
" ------------------------------------- +

" set spell
" change from red highlighting to red underline
hi clear spellBad
hi SpellBad cterm=underline ctermfg=red
hi SpellBad gui=undercurl

" ------------------------------------- +
" Cursor:     				|
" ------------------------------------- +

" Changes the cursor shape between line (insert) bar normal
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" speeds up cursor change
set ttimeout
set ttimeoutlen=1
set ttyfast

" Not 100% sure what this does
"updatetime = 250
"timeoutlen = 300

" ------------------------------------- +
" Key Remaps: 				|
" ------------------------------------- +

" Set leader key to space
let mapleader = " "

" prevent x key from overwriting clipboard
noremap x "_x
noremap X "_x

" space F enters file explorer mode
:map <Space>F :Ex<enter>

" sapce f enters file search
:map <Space>f :find 

" quick buffer switch
:map <Space>b :b 

" Appends typed cahricters to line start
:map  / :s/^/

" Clear all but current buffers
":map  c :%bd|e#<enter>

" ------------------------------------- +
" FINDING FILES:			|
" ------------------------------------- +

"Search down into sub folders
" provide tab completion for all file related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" ------------------------------------- +
" Appearance:				|
" ------------------------------------- +

set number relativenumber

" ------------------------------------- +
" Status Line:				|
" ------------------------------------- +

" Always show stat line
:set laststatus=2

" Status Line Custom
" Source: https://gist.github.com/meskarune/57b613907ebd1df67eb7bdb83c6e6641
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

" Status Line layout
" Source: https://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
set statusline=
set statusline +=%0*\ %{toupper(g:currentmode[mode()])}\ %* 	"The current mode
set statusline +=%1*\ %n\ %*            			"buffer number
set statusline +=%5*%{&ff}%*           				"file format
set statusline +=%3*%y%*                			"file type
set statusline +=%4*\ %<%F%*            			"full path
set statusline +=%2*%m%*                			"modified flag
set statusline +=%1*\ %=ln:\ %2l%*             			"current line
set statusline +=%2*/%L%*               			"total lines
set statusline +=%1*\ col:\ %2v\ %*            			"virtual column number
set statusline +=%2*\ %*         				"character under cursor

" Colours 
" Not Working:
" Source: https://gist.github.com/meskarune/57b613907ebd1df67eb7bdb83c6e6641

" au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
" au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
" hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
" 
" hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
" hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
" hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
" hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

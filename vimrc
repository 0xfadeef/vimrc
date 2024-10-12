set nocompatible

syntax on
filetype plugin indent on

set tabstop=4 shiftwidth=4
set list listchars=trail:.,tab:.\ 

" appearance
set title
set ruler
set number
setlocal cursorline
setlocal cursorlineopt=number
set showcmd cmdheight=2
set wildmenu

set history=200
set undolevels=1000

" linebreak is no-op if nowrap
set nowrap linebreak
set whichwrap=[,]
set backspace=indent,eol,start
set scrolloff=5
set nostartofline

set confirm
set hidden

set nobackup writebackup
set swapfile
set noundofile

set hlsearch incsearch

set encoding=utf-8
set fileencodings=utf-8,cp1251

" no-op if run from terminal
set guioptions-=T
set guifont=Courier_New:h13

" search upwards, stop in home dir
set tags+=./tags;~
set wildignore+=tags


if has("autocmd")
	" Restore cursor position upon reopening files
	autocmd BufReadPost *
	  \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
	  \     exe "normal! g`\"" |
	  \ endif

	" Use subtle gray highlighting for listchar tabs
	autocmd ColorScheme dracula
	  \ highlight! link SpecialKey DraculaSubtle
endif

if has("gui_running")
	colorscheme dracula
endif


" fix Python indent after open bracket
let g:pyindent_open_paren = 'shiftwidth()'


" ShowMarks config
let g:showmarks_ignore_type="mpq"


" vim-buftabline config
let g:buftabline_show = 1
let g:buftabline_numbers = 1
let g:buftabline_separators = 1
let g:buftabline_indicators = 1


" NERDTree
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 31
let NERDTreeQuitOnOpen = 3


command -nargs=1 LookUp vimgrep! /<args>/j ./**/* | :botright copen


" Key mappings
" use default leader key for my mappings
let mapleader = '\'

" Based on https://stackoverflow.com/a/26504944/7961781
nmap <silent> <leader>a :let v:hlsearch=(&hls && !v:hlsearch)<CR>
nmap <C-Q> :NERDTreeToggle<CR>

nmap <F1> :bprevious<CR>
nmap <F2> :bnext<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv



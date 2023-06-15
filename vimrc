set nocompatible

" autocmd BufRead * execute "chdir ".escape(expand("%:p:h"), ' ')
" set autochdir

syntax on
filetype plugin indent on

set tabstop=4 shiftwidth=4

" show tabs
set list listchars=trail:.,tab:.\ 

set title
set ruler
set number
set showcmd cmdheight=2
set wildmenu
set confirm

set history=200
set undolevels=1000

" linebreak is no-op if nowrap
set nowrap linebreak
set whichwrap=[,]
set backspace=indent,eol,start
set scrolloff=5
set nostartofline

set hidden

set nobackup writebackup
set swapfile
set noundofile

set hlsearch incsearch

set encoding=utf-8
set fileencodings=utf-8,cp1251
"set fileformats=dos


if has("gui_running")
	set mouse=nvi
	set guioptions-=T
	set guifont=Courier_New:h13
	colorscheme dracula
endif


if has("autocmd")
	" Restore cursor position upon reopening files
	autocmd BufReadPost *
	  \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
	  \     exe "normal! g`\"" |
	  \ endif
endif


" fix Python indent after open bracket
let g:pyindent_open_paren = 'shiftwidth()'


" ShowMarks config
let g:showmarks_ignore_type="mpq"


" /* I don't use ctags on mac */
" taglist
" let Tlist_Ctags_Cmd='"D:\Program Files\ctags58\ctags.exe"'
" let Tlist_Auto_Open=1
" let Tlist_Display_Tag_Scope=0
" let Tlist_Enable_Fold_Column=0
"let Tlist_Exit_OnlyWindow=1
" let Tlist_Show_One_File=1

" NERDTree
let NERDChristmasTree=0
let NERDTreeWinPos="right"
let NERDTreeWinSize=50

" set tags=D:\work\miscella\startags\tags
command -nargs=1 LookUp vimgrep! /<args>/j ./**/* | :botright copen

" Key mappings
nmap <F2> :bprevious<cr>
nmap <F3> :bnext<cr>
nmap <F4> :buffers<cr>
nmap <F5> :TlistToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F8> :nohlsearch<cr>
"nmap <F10> :TlistClose<cr> :NERDTreeClose<cr> :bd<cr> :TlistOpen<cr> :NERDTree<cr>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv



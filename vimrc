set nocompatible

syntax on
filetype plugin indent on

" appearance
set title
set ruler
set number
set showcmd cmdheight=2
set wildmenu

" gui options (no-op if in terminal)
set guioptions-=T
set guifont=Courier_New:h12

" text display
set tabstop=4
set list listchars=trail:.,tab:.\ 
set nowrap linebreak

" text search
set hlsearch
set incsearch

" history
set history=200
set undolevels=1000

" keystroke behaviors
set shiftwidth=4
set whichwrap=[,]
set backspace=indent,eol,start
set scrolloff=5
set nostartofline

set confirm
set hidden

set nobackup writebackup
set swapfile
set noundofile

set encoding=utf-8
set fileencodings=utf-8,cp1251

" search upwards, stop in home dir
set tags+=./tags;~
set wildignore+=tags


" :help restore-cursor
function! s:RestoreCursor()
	let line = line("'\"")
	if 1 < line && line <= line("$") && &filetype !~# "commit"
		normal! g'"
	endif
endfun

function! s:ToggleQuickfix()
	let winid = getqflist({"winid": 0}).winid
	execute winid ? "cclose" : "botright copen"
endfun


if has("autocmd") && !exists("autocommands_loaded")
	let autocommands_loaded = 1

	" Restore cursor position upon reopening files
	autocmd BufReadPost * call s:RestoreCursor()

	" Use subtle gray highlighting for listchar tabs
	autocmd ColorScheme dracula
	  \ highlight! link SpecialKey DraculaSubtle

	" Swap highlinghting for current and active buffers
	autocmd ColorScheme *
	  \ highlight! link BufTabLineCurrent PmenuSel |
	  \ highlight! link BufTabLineActive  TabLineSel
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
nmap          <leader>e :NERDTreeToggle<CR>
nmap          <leader>c :call <SID>ToggleQuickfix()<CR>

nmap <F1> :bprevious<CR>
nmap <F2> :bnext<CR>
nmap <F3> <Cmd>execute (v:count ? v:count.."buffer" : "buffers")<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" :help put-Visual-mode
" don't put selection into register when paste in visual mode
vnoremap p P
vnoremap $ $h


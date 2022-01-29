set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

" autocmd BufRead * execute "chdir ".escape(expand("%:p:h"), ' ')
" set autochdir

syntax on
set hidden
set tabstop=4 shiftwidth=4 expandtab
set number title ruler mouse=a

set nobackup
set nowritebackup
set noswapfile
set noundofile

set hlsearch incsearch
set nostartofline linebreak
"nowrap
set whichwrap=[,]
set showcmd
set cmdheight=2
filetype on
" how is it working?
set confirm

set list listchars=trail:.,tab:>\ 

set encoding=utf-8
set fileencodings=utf-8,cp1251
"set fileformats=dos

" ShowMarks
let showmarks_enable=1
let showmarks_include="abcdefghijklmnopqrstuvwxyz"
"let showmarks_hlline_upper=1

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

" colorscheme molokai
if has("gui_running")
	colorscheme dracula
	set guioptions-=T
	set lines=60 columns=140
	set guifont=Courier_New:h13
endif

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

map! <F1> <Nop>
map! <F2> <Nop>
map! <F3> <Nop>
map! <F4> <Nop>
map! <F5> <Nop>
map! <F6> <Nop>
map! <F7> <Nop>
map! <F8> <Nop>
map! <F9> <Nop>

" Macro
let @q='x4i j'

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


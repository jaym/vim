set nocompatible

call pathogen#infect()
let mapleader = ","

"indentation
set ai
set si
set noexpandtab
set tabstop=4
set shiftwidth=4

"windows
set equalalways
set splitbelow splitright
:noremap <leader>v :vsp^M^W^W<cr>
:noremap <leader>h :split^M^W^W<cr>

"tabs
set showtabline=2
map <leader>t <esc>:tabnew<cr>
map t <esc>:tabn<cr>
map T <esc>:tabp<cr>

"search
set hlsearch  "highlight search
set incsearch "incremental search
set smartcase "Ignore case when searching lowercase

"colors
syntax on
colorscheme mustang

"use system clipboard
set clipboard=unnamed

set linebreak "wrap at word

"navigate wrapped lines
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
map k gk
map j gj

"break out of insert mode
imap jj <esc>
imap kk <esc>
imap lll <esc>
imap hhh <esc>
imap nnn <esc>
imap bbb <esc>

map <Enter> o<esc>

"backups
set undofile
set undodir=~/.vim-tmp/undo//
set nobackup
set nowb
set noswapfile

filetype plugin indent on

"sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,help,resize,tabpages,winsize

set number "show line numbers
set matchpairs+=<:>
set vb t_vb= "turn off the bell
set mouse=a "enable the mouse

"nerd tree
:noremap <leader>n :NERDTreeToggle<cr>
let NERDTreeHijackNetrw=1 "user instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 "single click for everything

" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 50
"let g:AutoComplPop_NotEnableAtStart=1

"save position
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
" set viminfo^=%

function! RefreshAll()
	set noconfirm
	tabdo e!
	set confirm
endfunction

nmap <leader>r :call RefreshAll()<cr>
nmap <leader>s :setlocal spell! spell?<cr>

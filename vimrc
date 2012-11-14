set nocompatible "stop vim from behaving in a strongly vi-compatable way

call pathogen#infect()
let mapleader = ","

"filetype configuration
filetype plugin indent on

"colors
syntax on
"colorscheme wombat 
colorscheme mustang 

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
set showtabline=2 "never show tabs
map <leader>t <esc>:tabnew<cr>
map t <esc>:tabn<cr>
map T <esc>:tabp<cr>

"search
set hlsearch  "highlight search
set incsearch "incremental search
set smartcase "Ignore case when searching lowercase

"backups
set undofile
set undodir=~/.vim-tmp/undo//
set nobackup
set nowb
set noswapfile

"command auto complete
set wildmenu
set wildmode=list:longest

"session options
set sessionoptions=blank,buffers,curdir,help,resize,tabpages,winsize
nmap <leader>SS :wa<cr>:mksession! ~/.vim-tmp/session/
nmap <leader>SO :wa<cr>:so ~/.vim-tmp/session/
nmap <leader>SD :!rm ~/.vim-tmp/session/

"misc options
set clipboard=unnamed "use system clipboard
set linebreak "wrap  at word
set scrolloff=3 "pad cursor location
set number "show line numbers
set matchpairs+=<:>,$:$ "add to matching pairs
set vb t_vb= "turn off the bell
set mouse=a "enable the mouse

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
imap www <esc>
imap bbb <esc>

"enter creates new lines
map <Enter> o<esc>

"toggle spellchecking
nmap <leader>s :setlocal spell! spell?<cr>

"allow for saving of files as sudo
cmap w!! %!sudo tee > /dev/null %

"x doesn't yank text when in normal mode
nnoremap x "_x
nnoremap X "_X

"nerd tree mappings
:noremap <leader>n :NERDTreeToggle<cr>

"fugitive mappings
map <leader>gd :Gdiff<cr>
map <leader>gch :Gsplit<cr>
map <leader>gcv :Gvsplit<cr>
map <leader>gs :Gstatus<cr>
map <leader>gb :Gblame<cr>

"powerline options
"let g:Powerline_symbols = 'fancy'
set laststatus=2

"reload vim when vimrc is modified
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"save position
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"refresh all buffers
function! RefreshAll()
	set noconfirm
	bufdo e!
	set confirm
endfunction

nmap <leader>r :call RefreshAll()<cr>

"
let g:atp_Python = "/usr/bin/python2"

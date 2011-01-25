set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700

filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = ","
let g:mapleader = ","
"set timeoutlen=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=*.o,*.obj,.git,*.pyc,cache/**,log/**,test/**

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set hidden                        " Handle multiple buffers better.

set backspace=indent,eol,start    " Intuitive backspacing.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set splitbelow

set foldenable

set linespace=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basics 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable                     " Turn on syntax highlighting.

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Use an SCM instead of swap files
" set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set softtabstop=2                "Causes backspace to delete 4 spaces = converted <TAB>

set expandtab                    " Use spaces instead of tabs
set smarttab                     "Uses shiftwidth instead of tabstop at the start of lines

set smartindent
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<M-j> est équivalent à ALT+j
"<C-j> est équivalent à CTRL+j
"<D-j> est équivalent à CMD + j

" Map space to / (search) and c-space to ? (backgwards search)
" map <space> /
" map <c-space> ?
map <silent> <leader><cr> :noh<cr>

"map <CR> O<Esc>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

"nmap ,server :Nread ftp://user:pwd@serveur/path/to/domain/<cr>

nmap <space> :
nnoremap ; :
imap jj <esc>

" Bubble single lines
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
" Bubble multiple lines
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv

cmap w!! w !sudo tee % >/dev/null

""""""""""""""""""""""""""""""
" => Abbrev.
""""""""""""""""""""""""""""""

abbrev ff :! open -a firefox.app %:p<cr>

""""""""""""""""""""""""""""""
" => Symfony
""""""""""""""""""""""""""""""
map <F2> :!./symfony cc<cr>


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set laststatus=2                 " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

runtime macros/matchit.vim        " Load the matchit plugin.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $t <><esc>i

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>b :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
noremap <leader>m :CommandT<cr>
noremap <leader>flush :CommandTFlush<cr>

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
nmap ,nt :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""
set t_Co=256
colorscheme mustang
colors mustang

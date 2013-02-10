set nocompatible                  " Must come first because it changes other options.

"filetype off

call pathogen#infect()
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700

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
set wildignore+=*.o,*.obj,.git,*.pyc,cache/**,log/**,test/**,*/node_modules/*

set nonumber                      " Show line numbers.
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

set nofoldenable

set linespace=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basics 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
set softtabstop=4                "Causes backspace to delete 4 spaces = converted <TAB>

set expandtab                    " Use spaces instead of tabs
"set smarttab                     "Uses shiftwidth instead of tabstop at the start of lines

set smartindent
set autoindent

set shiftround

nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>:set softtabstop=2<cr>
nmap <leader>3 :set tabstop=3<cr>:set shiftwidth=3<cr>:set softtabstop=3<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set softtabstop=4<cr>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<M-j> = ALT + j
"<C-j> = CTRL + j
"<D-j> = CMD + j

map <silent> <leader><cr> :noh<cr>

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

" Bubble single lines
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
" Bubble multiple lines
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv

cmap w!! w !sudo tee % >/dev/null

" Delete buffer and file
nmap <leader>DEL :!rm %<cr>:bd<cr>

" Use perl regex style
nnoremap / /\v
vnoremap / /\v

""""""""""""""""""""""""""""""
" => FileType detection
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.less			setf css

""""""""""""""""""""""""""""""
" => Abbrev.
""""""""""""""""""""""""""""""
abbrev ff :! open -a firefox.app %:p<cr>

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set laststatus=2                 " Show the status line all the time

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\  
set statusline +=%{fugitive#statusline()}
set statusline +=%#warningmsg#
set statusline +=%{SyntasticStatuslineFlag()}
set statusline +=%*
set statusline +=\ %=%-16(\ %l,%c-%v\ %)%P

""""""""""""""""""""""""""""""
" => matchit plugin
""""""""""""""""""""""""""""""
runtime macros/matchit.vim        " Load the matchit plugin.

""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""
noremap <leader>t :CtrlP<cr>

""""""""""""""""""""""""""""""
" => SuperTab 
""""""""""""""""""""""""""""""
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
let g:SuperTabMappingTabLiteral = '<tab>'

""""""""""""""""""""""""""""""
" => ctags 
""""""""""""""""""""""""""""""
nmap <leader>ctags :!ctags -h ".php" --PHP-kinds=+cf --recurse --exclude=*/cache/* --exclude=*/logs/* --exclude=*/data/* --exclude="\.git" --exclude="\.svn" --languages=PHP &<cr>:CommandTFlush<cr> 
" To change tagfile name, add  ':set tags=.ctags<cr>'

""""""""""""""""""""""""""""""
" => Buffergator
""""""""""""""""""""""""""""""
nmap <leader>b :BuffergatorToggle<CR>
let g:buffergator_suppress_keymaps = 1

""""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""
set t_Co=256

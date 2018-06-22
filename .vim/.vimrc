"Vim needs a POSIX-Compliant shell. Fish is not.
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'          " Must come before markdown
Plugin 'plasticboy/vim-markdown'
"Plugin 'vhdirk/vim-cmake'
"Plugin 'jansenm/vim-cmake'
Plugin 'rhysd/vim-clang-format'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mbbill/undotree'
Plugin 'supercollider/scvim'

call vundle#end()
filetype plugin indent on

syntax on
syntax enable

colorscheme onedark

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

set number
set hidden
set history=100
set encoding=utf-8
set backspace=indent,eol,start
set autoread
set shellpipe=2>/dev/null>
set noshowcmd
set laststatus=2
set splitright
set splitbelow
set mouse=a
set ttymouse=xterm2
set guifont=Terminess\ Powerline\ 8

" Search
set incsearch
set hlsearch
set viminfo='100,f1

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set list
set listchars=tab:\ \ ,trail:·
set nowrap

" Fold
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Completion
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups

" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Mappings
map <leader>rr :source ~/.vimrc<CR>
map <C-t> :NERDTreeToggle<CR>


set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle start
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-bufferline'
Plugin 'airblade/vim-gitgutter'
"the following was used to create the bash prompt
"Plugin 'edkolev/promptline.vim'

" All plugins must be added before the following
call vundle#end()            " required
filetype plugin indent on    " required
" Vundle end

" My prefs start
colorscheme solarized        " Use solarized colors
set background=dark         " As oposed to light
set encoding=utf-8           " Set vim to unicode
set shortmess=atI            " Don’t show the intro message when starting Vim
set number                   " Enable line numbers
syntax on                    " Enable syntax highlighting
set wildmenu                 " Enhance command-line completion
set cursorline               " Highlight current line
set backspace=indent,eol,start " Allow backspace in insert mode
set tabstop=2                " Make tabs as wide as two spaces
set esckeys                  " Allow cursor keys in insert mode
set encoding=utf-8 nobomb    " Use UTF-8 without BOM
set binary                   " Don’t add empty newlines at the end of files
set noeol                    " Don’t add empty newlines at the end of files
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_   " Show “invisible” characters
set list                     " Show “invisible” characters
set hlsearch                 " Highlight searches
set ignorecase               " Ignore case of searches
set secure                   " Disable insecure .vimrc stuff
set noerrorbells             " Disable error bells
set nostartofline            " Don’t reset cursor to start of line when moving around
set ttyfast                  " Optimize for fast terminal connections
set laststatus=2             " Always show status line
set showmode                 " Show the current mode
set title                    " Show the filename in the window titlebar
set incsearch                " Highlight dynamically as pattern is typed
set scrolloff=3              " Start scrolling three lines before the horizontal window border
set showcmd                  " Show the (partial) command as it’s being typed
set ruler                    " Show the cursor position
set modeline                 " Respect modeline in files
set modelines=4              " Respect modeline in files
set backupskip=/tmp/*,/private/tmp/*    " Don’t create backups when editing files in certain directories
set backupdir=~/.vim/backups " Centralize backups
set directory=~/.vim/swaps   " Centralize swapfiles
if exists("&undodir")        " Centralize undo history
    set undodir=~/.vim/undo
endif
" My prefs end

" Syntastic plugin settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline plugin settings
let g:airline_powerline_fonts = 1       " set font to SourceCodePro https://github.com/powerline/fonts
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
" Enable non-vi compatible features
set nocompatible

" Automatic reloading on write
autocmd! bufwritepost ~/.vimrc source %

" Use Vundle to manage plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'moll/vim-bbye'
call vundle#end()

" Enable loading of plugins and indent format depending on filetype
filetype plugin indent on
syntax on

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Flags

set number " show line numbers
set relativenumber " show line numbers relative to cursor
set hlsearch " search highlighting
set incsearch " incremental search
set showcmd " show the command as it's being entered
set ignorecase " ignore case when searching
set smartcase " unless the pattern contains an uppercase char
set clipboard=unnamed,unnamedplus " use * and + registers for yanks
set matchpairs+=<:> " match also < and >
set scrolloff=5 " always show 5 lines of context when scrolling
set listchars=tab:>·,trail:~,extends:>,precedes:<
autocmd FileType go setlocal listchars=tab:\ \ ,trail:~,extends:>,precedes:<
set list " show unprintable characters with the listchar format
set splitbelow " open new splits in best direction
set splitright " "
set colorcolumn=80 " show column at 80 characters
highlight ColorColumn ctermbg=8

" Mappings

imap jk <Esc> " set different escape sequence for insert
nnoremap ge :cal cursor(0, 80)<CR> " go to column 80

" Move trough windows using Ctrl-{h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Exchange : and ;
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Write as sudo with :w!!
cmap w!! w !sudo tee > /dev/null %

" Make deleting buffers not suck
cnoremap bd Bdelete

" Move lines with Ctrl-Alt-{j,k,l,;}
source ~/.vim/move_lines.vim

" Toggle between line number mode
source ~/.vim/line_number_toggle.vim

" Autocomplete paired characters
source ~/.vim/autoclose_brackets.vim

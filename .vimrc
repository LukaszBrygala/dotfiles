call plug#begin('~/.vim/plugged')

" fundamental
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'alvan/vim-closetag' " allows to automatically close xml tags
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs' " closes braces and qoutes
Plug 'justinmk/vim-sneak'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'stephpy/vim-yaml' " fix slow yamls
Plug 'tpope/vim-abolish' " contains cr command (changing case-style for word)
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch' " ???
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
" Plug 'vim-syntastic/syntastic'

" js
" Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" haskell
Plug 'neovimhaskell/haskell-vim'

" ts
" Plug 'leafgarland/typescript-vim' " syntax highlight
" Plug 'Shougo/vimproc.vim', {'do' : 'make'} " required by tsuquyomi
" Plug 'Quramy/tsuquyomi' " typescript support

" c#
" Plug 'OmniSharp/omnisharp-vim'

" handy stuff
" Plug 'junegunn/vim-easy-align'
" Plug 'tpope/vim-jdaddy'

" colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

call plug#end()

set nocompatible

set autoread " if file was changed outside of vim and not inside vim, reload automatically
set hidden " hide current buffer on switching

set ttimeout
set ttimeoutlen=100
set timeoutlen=1000

set nobackup
set noswapfile

set showmatch " briefly show matching bracket
set matchtime=2
set incsearch
set hlsearch
set ignorecase
set smartcase

set lazyredraw " don't redraw while executing macro

set foldcolumn=1
set foldmethod=indent
set number
set foldlevel=10
set cursorline
set colorcolumn=81

set winminheight=0
set winminwidth=0

set nowrap
set textwidth=0

set scrolloff=5 " min number of lines to keep above/below cursor
set sidescrolloff=10 " min number of columns to keep to the left/right of cursor
set sidescroll=1 " how many columns to scroll horizontally while moving cursor (zh and zl not affected)

set expandtab " use spaces to expand a tab
set shiftwidth=4
set softtabstop=-1

set autoindent

set backspace=indent,eol,start

set wildmenu
set wildmode=longest,full

set completeopt-=preview

set clipboard=unnamed

set t_Co=256

set laststatus=2
set noshowmode
set showcmd

set visualbell

syntax enable

if !empty(glob("~/.vim/plugged/base16-vim")) && filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

if !empty(glob("~/.vim/plugged/vim-airline"))
    let g:airline_theme = 'base16_twilight'
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_mode_map = {
                \ 'n'  : 'N',
                \ 'i'  : 'I',
                \ 'v'  : 'V',
                \ 'V'  : 'V',
                \ '' : 'V'
                \ }
    let g:airline#extensions#default#layout = [
                \ [ 'a', 'b', 'c' ],
                \ [ 'x', 'z', 'error', 'warning' ]
                \ ]
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#close_symbol = 'windows >'
    let g:airline#extensions#tabline#buffers_label = '< buffers'
    let g:airline#extensions#branch#format = 2
    let g:airline#extensions#wordcount#enabled = 0
    let g:airline#extensions#syntastic#enabled = 0
endif

if !empty(glob("~/.vim/plugged/ctrlp.vim"))
    let g:ctrlp_user_command = ['.git', 'git ls-files --cached --others --exclude-standard %s']
    let g:ctrlp_match_window = 'max:20'
endif

if !empty(glob("~/.vim/plugged/ack.vim"))
    let g:ackprg = 'ag --vimgrep --hidden'
endif

if !empty(glob("~/.vim/plugged/syntastic"))
    " let g:syntastic_javascript_checkers=['eslint']
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_auto_loc_list=2 " don't open loc list automatically, but close if there are no errors
endif

if !empty(glob("~/.vim/plugged/vim-sneak"))
    let g:sneak#label = 1
    let g:sneak#use_ic_scs = 1
    let g:sneak#prompt = 'sneak > '
endif

if !empty(glob("~/.vim/plugged/vim-closetag"))
    let g:closetag_filenames = '*.xml,*.html,*.xhtml,*.phtml'
endif

if !empty(glob("~/.vim/plugged/gundo.vim"))
    let g:gundo_preview_bottom = 1
endif

if !empty(glob("~/.vim/plugged/vim-tmux-navigator"))
    let g:tmux_navigator_disable_when_zoomed = 1
endif

" xmap ga <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)

nnoremap <C-W>z <C-W>_<C-W><Bar>
nnoremap <C-W>j :set splitbelow<CR>:sp<CR>:set nosplitbelow<CR>
nnoremap <C-W>k :sp<CR>
nnoremap <C-W>l :set splitright<CR>:vsp<CR>:set nosplitright<CR>
nnoremap <C-W>h :vsp<CR>

noremap <silent> zl @='10zl'<CR>
noremap <silent> zh @='10zh'<CR>

map <Space> <Leader>

nnoremap <Leader>/ :nohl<CR>

nnoremap <Leader>s :%s/
vnoremap <Leader>s :s/

nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>d :bp\|:bd #<CR>

noremap <Leader>x "_
vnoremap <Leader>r "_dP

nnoremap <Leader>p :CtrlPLine%<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>a :Ack<CR>
nnoremap <Leader>A :Ack<Space>
vnoremap <Leader>a y:Ack<Space><C-R>*<CR>

inoremap <C-U> <C-G>u<C-U>

" nmap gr "ayiw[{V%:s/<C-r>a//gcI<left><left><left><left>

if has('mouse')
    set mouse=a
endif

if has('autocmd')
    augroup vimrcEx
        au!
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

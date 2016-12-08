call plug#begin('~/.vim/plugged')
" fundamental
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-sneak'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
" js
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
" ts
Plug 'leafgarland/typescript-vim' " syntax highlight
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " required by tsuquyomi
Plug 'Quramy/tsuquyomi' " typescript support
" elm
Plug 'lambdatoast/elm.vim'
" c#
Plug 'OmniSharp/omnisharp-vim'
" haskell
Plug 'neovimhaskell/haskell-vim'
" handy stuff
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish' " contains cr command (changing case-style for word)
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
" pretty stuff
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

set foldcolumn=1
set number
set cursorline
set colorcolumn=100

set winminheight=0
set winminwidth=0

set nowrap

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

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:airline_theme = 'base16_ashes'
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
let g:airline_skip_empty_sections = 1
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

let g:ctrlp_user_command=['.git', 'cd %s && git ls-files']
let g:ctrlp_match_window='max:20'

let g:ack_use_dispatch = 1
let g:ackprg = 'ag --vimgrep'

let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list=2

let g:sneak#streak = 1
let g:sneak#use_ic_scs = 1

let g:jsx_ext_required = 0

let g:javascript_plugin_flow = 1

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

map <Space> <Leader>

nnoremap <Leader>/ :nohl<CR>

nnoremap <Leader>s :%s/
vnoremap <Leader>s :s/

nnoremap <Leader>c :so ~/.vimrc<CR>

nnoremap <Leader>n <C-S-^>

nnoremap <Leader>z <C-W>_<C-W><Bar>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>d :bp\|:bd #<CR>
nnoremap <Leader>w :w<CR>

nnoremap <Leader>e :! eslint --fix "%"

noremap <Leader>x "_
vnoremap <Leader>r "_dP

nnoremap <Leader>p :CtrlPLine%<CR>

nnoremap <Leader>a :Ack<CR>
vnoremap <Leader>a y:Ack<Space><C-R>*<CR>
nnoremap <Leader>ga :Ack<Space>

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

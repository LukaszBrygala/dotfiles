call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf' " required fzf to be already installed with brew
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs' " closes braces and qoutes
Plug 'junegunn/fzf.vim'
" Plug 'justinmk/vim-sneak'
Plug 'mileszs/ack.vim'
Plug 'stephpy/vim-yaml' " fix slow yamls
Plug 'tpope/vim-abolish' " contains (for example) cr command (changing case-style for word)
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround' " allows bindings for changing suuroundings (parentheses, brackets...)
Plug 'tpope/vim-unimpaired' " [x / ]x -like mappings
Plug 'tpope/vim-vinegar'

" colors
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'

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
set background=light
colorscheme solarized

if !empty(glob("~/.vim/plugged/lightline.vim"))
    let g:lightline = {
         \ 'colorscheme': 'solarized',
         \ }
endif

if !empty(glob("~/.vim/plugged/fzf.vim"))
    function! s:ag_with_opts(arg, bang)
        let tokens  = split(a:arg)
        let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
        let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
        call fzf#vim#ag(query, ag_opts, a:bang ? {} : {'down': '40%'})
    endfunction

    autocmd VimEnter * command! -nargs=* -bang FzfAgOpt call s:ag_with_opts(<q-args>, <bang>0)

    let g:fzf_command_prefix = 'Fzf'
endif

if !empty(glob("~/.vim/plugged/ack.vim"))
    let g:ackprg = 'ag --vimgrep --hidden'
endif

if !empty(glob("~/.vim/plugged/vim-sneak"))
    let g:sneak#label = 1
    let g:sneak#use_ic_scs = 1
    let g:sneak#prompt = 'sneak > '
endif

if !empty(glob("~/.vim/plugged/vim-tmux-navigator"))
    let g:tmux_navigator_disable_when_zoomed = 1
endif

nnoremap <C-p> :FzfGFiles<CR>

nnoremap <C-W>z <C-W>_<C-W><Bar>
nnoremap <C-W>j :set splitbelow<CR>:sp<CR>:set nosplitbelow<CR>
nnoremap <C-W>k :sp<CR>
nnoremap <C-W>l :set splitright<CR>:vsp<CR>:set nosplitright<CR>
nnoremap <C-W>h :vsp<CR>
nnoremap <silent> <Leader><c-l> :TmuxNavigateRight<cr>

noremap <silent> zl @='20zl'<CR>
noremap <silent> zh @='20zh'<CR>

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

nnoremap <Leader>f :Ack<Space><C-R><C-W><CR>
nnoremap <Leader>F :Ack<Space>
nnoremap <Leader>p :FzfBuffers<CR>
nnoremap <Leader>l :FzfBLines<CR>
nnoremap <Leader>a :FzfAgOpt<Space><C-R><C-W><Space>--hidden<CR>
vnoremap <Leader>a y:FzfAgOpt<Space><C-R>*<Space>--hidden<CR>

inoremap <C-U> <C-G>u<C-U>

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

highlight SpellBad ctermbg=LightRed
highlight SpellCap ctermbg=LightYellow

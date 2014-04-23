"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 General                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Needed for vundle, will be turned on after vundle inits
filetype off

" Setup vundle
set rtp+=~/.dotfiles/vim/bundle/vundle/
call vundle#rc()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Vundle configuration                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'c9s/bufexplorer'
Bundle 'vim-scripts/netrw.vim.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'bling/vim-bufferline'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'
Bundle 'surround.vim'
Bundle 'rstacruz/sparkup.git', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'matchit.zip'
Bundle 'leshill/vim-json'
Bundle 'SirVer/ultisnips'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tudorprodan/html_annoyance.vim.git'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'slim-template/vim-slim.git'
Bundle 'mhinz/vim-startify'
Bundle 'chriskempson/base16-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           reset vimrc augroup                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" We reset the vimrc augroup. Autocommands are added to this group throughout
" the file
augroup vimrc
  autocmd!
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Bundle commands!
filetype plugin indent on

set colorcolumn=80
set titlestring=
set titlestring+=%f\       " file name
set titlestring+=%h%m%r%w  " flags
set titlestring+=\ >\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory
" With this, the gui (gvim and macvim) now doesn't have the toolbar, the left
" and right scrollbars and the menu.
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M
set antialias
set noshowmode          " don't show the mode ("-- INSERT --") at the bottom
set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h14
set modelines=0
set number                                   " show line numbers
set history=1000                             " limit :cmdline history
set linebreak
set nowrap                                   " no carriage returns
set novisualbell                             " no blinking .
set noerrorbells                             " no noise.
set laststatus=2                             " always show status line.
set tabstop=2                                " number of spaces of tab character
set shiftwidth=2                             " number of spaces to (auto)indent
set smarttab
set smartindent
set expandtab
set nostartofline
set noautowrite                              " don't write on :next
set autoindent                               " auto indents the next new line
set timeoutlen=400                           " shortens the lag time with using leader
set lz                                       " lazy redraw - when macros are running don't redraw
set backspace=indent,eol,start
set backspace=2                              " make backspace work the way it should
set whichwrap+=<,>,h,l                       " make backspace and cursor keys wrap accordingly
set incsearch                                " set search to automatically show the next match while typing
set ignorecase                               " make searches case-insensitive
set hlsearch                                 " turn on highlighted search
set laststatus=2                             " always have the status bar visible
set matchtime=2
set matchpairs+=<:>
set hidden                                   " allow movement to another buffer without saving the current one
set clipboard+=unnamed                       " share clipboard
set dictionary=/usr/share/dict/words         " more words
set cursorline cursorcolumn                  " vertical cursorline
set nobackup
set nowritebackup
set noswapfile
set wildmode=full "complete first full match
set wildignore=*.dll,*.exe,*.pyc,*.pyo,*.egg,*.class
set wildignore+=*.jpg,*.gif,*.png,*.o,*.obj,*.bak,*.rbc
set wildignore+=Icon*,\.DS_Store,*.out,*.scssc,*.sassc
set wildignore+=.git/*,.hg/*,.svn/*,*/swp/*,*/undo/*,Gemfile.lock
set wildmenu "show completion matches above command line
set encoding=utf-8

colorscheme base16-atelierdune 

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
  set macmeta
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            auto commands                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" resize splits on windows resize
au VimResized * exe "normal! \<c-w>="

" jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

" highlight current line vertically
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn

au vimrc BufEnter *.snippets setf snippets
au vimrc FileType snippets set noexpandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            custom mappings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

imap <S-space> <Esc>
map <leader>= <c-W>=
map <leader>n :e.<CR>

" configuration resetting
nmap <leader>sv :so $MYVIMRC<CR>

" H/L is more natural than 0/$
map H 0
map L $

" simple visual block
map T <C-v>

" add empty lines with no insert mode
map <S-enter> O<Esc>
map <enter> o<Esc>

" toggle search highlighting
nnoremap <leader>/ :set hlsearch!<CR>

" better j/k overwrapped lines
nnoremap j gj
nnoremap k gk

" delete char without yank
noremap x "_x
noremap X "_X

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" keep search results in the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" buffer
map <leader><leader> <c-W><c-W>
nmap <leader>sa  :leftabove  vnew<CR>
nmap <leader>sd  :rightbelow vnew<CR>
nmap <leader>sw  :leftabove  new<CR>
nmap <leader>ss  :rightbelow new<CR>

" disabled keys
map K <nop>

" remove extra line spaces
nnoremap <silent> <leader><leader>c :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Ack                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>a :Ack

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Gundo                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><F3> :GundoToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Ctrl P                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>f'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Sparkup                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sparkupExecuteMapping = '<leader>e'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Syntastic                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['pyflakes']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Airline                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             UltiSnips                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetsDir         = $HOME . '/dotfiles/vim/UltiSnips'
let g:UltiSnipsExpandTrigger       = "<S-C-k>"
let g:UltiSnipsJumpForwardTrigger  = "<m-h>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Startify "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_header = [
            \ '                                                 ',
            \ '            _________________________            ',
            \ '            |                       |            ',
            \ '             |____     _____     ____|           ',
            \ '      ********* |    |    |    | *********       ',
            \ '   *************|    |    |  ****************    ',
            \ ' *****        **|    |    ********        *****  ',
            \ '****            |    |******** |            **** ',
            \ '****            |    ******    |            **** ',
            \ '****            | ********|    |            **** ',
            \ ' *****        ********    |    |**        *****  ',
            \ '   ***************   |    |    |*************    ',
            \ '      *********_|    |____|    |_*********       ',
            \ '           |          |             |            ',
            \ '           |________________________|            ',
            \ '                                                 ',
            \ '                                                 ',
            \ '                                                 ',
            \ ]

let g:ctrlp_reuse_window = 'startify'
let g:startify_skiplist = [
       \ 'COMMIT_EDITMSG',
       \ $VIMRUNTIME .'/doc',
       \ 'bundle/.*/doc',
       \ '\.DS_Store'
       \ ]


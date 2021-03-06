"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 General                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Needed for vundle, will be turned on after vundle inits
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Vundle configuration                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Setup Vimplug
call plug#begin('~/.vim/plugged')

" Base VIM behavior enhancement
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'c9s/bufexplorer'
Plug 'tpope/vim-vinegar'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-hugefile'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'JazzCore/ctrlp-cmatcher'

" Basic Syntax Support
Plug 'leshill/vim-json'
Plug 'groenewege/vim-less'
Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'
Plug 'pangloss/vim-javascript'
Plug 'mhartington/vim-typings'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'digitaltoad/vim-pug'

" React Specific
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" ColorScheme
Plug 'rakr/vim-one'
Plug 'muellan/am-colors'
Plug 'trevordmiller/nova-vim'

call plug#end()

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
set titlestring+=\ >\ %{substitute(getcwd(),\ $HOME,\ '𝕱~',\ '')} " working directory
" With this, the gui (gvim and macvim) now doesn't have the toolbar, the left
" and right scrollbars and the menu.
set guioptions-=TlLrRmM
set noshowmode          " don't show the mode ("-- INSERT --") at the bottom
set modelines=0
set number                                   " show line numbers
set history=1000                             " limit :cmdline history
set linebreak                                " line can be split on whitespace only
set nowrap                                   " no carriage returns
set novisualbell                             " no blinking .
set noerrorbells                             " no noise.
set laststatus=2                             " always show status line.
set tabstop=2                                " number of spaces of tab character
set shiftwidth=2                             " number of spaces to (auto)indent
set smarttab
set smartindent
set expandtab                                " convert tabs to spaces
set nostartofline
set iskeyword+=-                             " acts-as-1-word"
set noautowrite                              " don't write on :next
set autoindent                               " auto indents the next new line
set timeoutlen=400                           " shortens the lag time with using leader
set lz                                       " lazy redraw - when macros are running don't redraw
set backspace=indent,eol,start               " force delete/backspace
set whichwrap+=<,>,h,l                       " make backspace and cursor keys wrap accordingly
set incsearch                                " set search to automatically show the next match while typing
set ignorecase                               " make searches case-insensitive
set hlsearch                                 " turn on highlighted search
set matchtime=2
set matchpairs+=<:>
set hidden                                   " allow movement to another buffer without saving the current one
set clipboard+=unnamed                       " share clipboard
set dictionary=/usr/share/dict/words         " more words
set cursorline cursorcolumn                  " vertical cursorline
set nobackup
set nowritebackup
set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildmode=full                            "complete first full match
set wildmenu                                 "show completion matches above command line
set encoding=utf-8
set list lcs=trail:·,tab:»·
set helpheight=200                           " help windows take up near full window size
set linespace=8

" Set default theme to light with amcolors.
set background=light
colorscheme ampresent

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
  set antialias
  set macmeta
  set macligatures
  "set guifont=Mononoki\ Italic:h15
  set guifont=Operator\ Mono\ Medium:h16
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

" H/L is more natural to me than 0/$
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

" <tab> / <s-tab> | Circular windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

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

" map tag bar to <F8>
nmap <F8> :TagbarToggle<CR>

"duplicate line cmd-d
map <D-d> yyp

" cmd + number for switching tabs
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> 0gt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Typescript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_liststyle     = 0
let g:netrw_keepdir       = 1
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_retmap        = 1
let g:netrw_silent        = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Vim GO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Ack                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>a :Ack!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Ctrl P                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>f'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Syntastic                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': ['coffee'],
                     \ 'passive_filetypes': ['html, js'] }

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Signify                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_vcs_list = [ 'git' ]
let g:signify_line_highlight     = 0
let g:signify_sign_overwrite     = 1
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=159
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Fancy Ligs                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
highlight xmlAttrib gui=italic
highlight xmlAttrib cterm=italic

" Find any keywork to map highlights
nm <silent> <F1> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>

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


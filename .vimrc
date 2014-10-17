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

Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'c9s/bufexplorer'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-hugefile'
Plug 'mhinz/vim-startify'
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'reedes/vim-colors-pencil'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/goyo.vim',      { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'junegunn/vim-emoji'
Plug 'airblade/vim-gitgutter'

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
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M
set antialias
set noshowmode          " don't show the mode ("-- INSERT --") at the bottom
set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h12
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
set wildmode=full                            "complete first full match
set wildignore=*.dll,*.exe,*.pyc,*.pyo,*.egg,*.class
set wildignore+=*.jpg,*.gif,*.png,*.o,*.obj,*.bak,*.rbc
set wildignore+=Icon*,\.DS_Store,*.out,*.scssc,*.sassc
set wildignore+=.git/*,.hg/*,.svn/*,*/swp/*,*/undo/*,Gemfile.lock
set wildmenu                                 "show completion matches above command line
set encoding=utf-8
set list
set lcs=trail:༎,eol:ᚋ,                       "show “invisible” characters
set helpheight=200                           " help windows take up near full window size

colorscheme pencil

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
"                                 Functions                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Better_colors_for_syntax_highlighting

function! ReverseBackground()
  let Mysyn=&syntax
  if &bg=="light"
    se bg=dark
    highlight Normal guibg=black guifg=white
  else
    se bg=light
    highlight Normal guibg=white guifg=black
  endif
  syn on
  exe "set syntax=" . Mysyn
endfunction
command! Invbg call ReverseBackground()


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

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

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

" toggle between light/dark background colors
noremap <F3> :Invbg<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Functions                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/dotfiles/blob/master/vimrc#L632
" <F8> | Color scheme selector
function! s:rotate_colors()
  if !exists('s:colors_list')
    let s:colors_list =
    \ sort(map(
    \   filter(split(globpath(&rtp, "colors/*.vim"), "\n"), 'v:val !~ "^/usr/"'),
    \   "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"))
  endif
  if !exists('s:colors_index')
    let s:colors_index = index(s:colors_list, g:colors_name)
  endif
  let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
  let name = s:colors_list[s:colors_index]
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <F8> :call <SID>rotate_colors()<cr>

" https://github.com/junegunn/dotfiles/blob/master/vimrc#L726
" SaveMacro / LoadMacro
function! s:save_macro(name, file)
  let content = eval('@'.a:name)
  if !empty(content)
    call writefile(split(content, "\n"), a:file)
    echom len(content) . " bytes save to ". a:file
  endif
endfunction
command! -nargs=* SaveMacro call <SID>save_macro(<f-args>)

function! s:load_macro(file, name)
  let data = join(readfile(a:file), "\n")
  call setreg(a:name, data, 'c')
  echom "Macro loaded to @". a:name
endfunction
command! -nargs=* LoadMacro call <SID>load_macro(<f-args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              VimEmoji + Gitgutter                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif
set completefunc=emoji#complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Goyo "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>G :Goyo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Limelight                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:limelight_default_coefficient = 0.8
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
nnoremap <F2> :Limelight!!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Airline                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'pencil'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Netrw                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_liststyle=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Ack                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>a :Ack!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Ctrl P                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>f'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:15,results:15'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_switch_buffer = '0'
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
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': ['coffee'],
                     \ 'passive_filetypes': ['html, js'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Airline                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

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


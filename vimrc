let g:alivim_dir = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')

"===============================================================================
" Plugins
"===============================================================================

""
" Installing vim-plug on first use. https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"
let s:alivim_vim_plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:alivim_vim_plug_dest = g:alivim_dir . '/autoload/plug.vim'
if empty(glob(s:alivim_vim_plug_dest))
  " Download vim-plug
  silent execute '!curl -fLo ' . s:alivim_vim_plug_dest . ' --create-dirs '
    \ . s:alivim_vim_plug_url

  augroup alivim_vim_plug
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

""
" Adding plugins
"
call plug#begin()
Plug 'tpope/vim-sensible'
call plug#end()

"===============================================================================
" Behavioural
"===============================================================================

""
" Files and directories (vim related)
"
let s:alivim_undo_dir = g:alivim_dir . '/undo'

if !isdirectory(s:alivim_undo_dir)
    call mkdir(s:alivim_undo_dir, "", 0700)
endif

let &undodir = s:alivim_undo_dir

set nobackup
set noswapfile
set undofile
set undolevels=2000
set autowriteall

""
" Indentation
"
set expandtab
set shiftwidth=2
set tabstop=2

""
" Input timeout
"
set ttimeout
set ttimeoutlen=100

""
" Search
"
set ignorecase
set smartcase

""
" Wild menu
"
" wildmenu is set by sensible
set wildmode=longest,full
set wildignore=build,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

""
" Miscellaneous
"
set completeopt+=noinsert             " causes completion to select first choice
set hidden                            " enable multiple modified buffer
set omnifunc=syntaxcomplete#Complete  " turn on builtin auto-completion
set switchbuf=useopen,usetab,newtab   " switching buffers behaviour

" remove trailing whitespace on save
augroup alivim_better_behaviour
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END

"===============================================================================
" Visual
"===============================================================================


" vim:set filetype=vim expandtab shiftwidth=2:

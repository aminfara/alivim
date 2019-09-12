let g:alivim_dir = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')
let g:alivim_plug_dir = g:alivim_dir . '/plugged'

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
Plug 'chriskempson/base16-vim'
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

""
" Terminal
"

" Setting color to 16
set t_Co=16

" Setting color to 256 for more sophisticated terminals
if $TERM =~ '256color'
  set t_Co=256
endif

" clearing using the current background color
set t_ut=


""
" Folding
"
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set foldenable

""
" Invisible characters
"
set listchars=tab:⇥\ ,trail:·
set list  " Show invisible characters

""
" Scroll offsets
"
set scrolloff=5
set sidescrolloff=10

""
" Splitting windows
"
set splitbelow
set splitright

""
" Wrapping
"
set colorcolumn=120
set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set breakindent

""
" Line numbers
"
set number relativenumber
augroup neospace_layers_better_visual_line_numbers
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

""
" Miscellaneous
"
set cursorline                        " draws a line to show the current line
set noshowmode                        " don't show mode, status bar plugin will show it
set ruler                             " show cursor position
set showcmd                           " show partial command
set visualbell                        " beep visually

"===============================================================================
" Theme
"===============================================================================

if isdirectory(g:alivim_plug_dir . '/base16-vim')
  colorscheme base16-default-dark
  if &t_Co == 256
    let g:base16colorspace=256
  endif

  if filereadable(expand($HOME . "/.vimrc_background"))
    source ~/.vimrc_background
  endif
endif

" vim:set filetype=vim expandtab shiftwidth=2:

" This file only contains general vim settings.
" It does not include any plugin or mapping settings.
" Settings here makes vim more civilized and modern without any plugin.
"
" by Ali Aminfar (ali.aminfar@gmail.com) - July 2015


let mapleader = ","
let maplocalleader = "\\"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Behavioral
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Being modern
""""""""""""""""""""""""""""""""""""""""
set nocompatible
syntax on
filetype plugin indent on

"" Encoding
""""""""""""""""""""""""""""""""""""""""
if has("multi_byte")
  scriptencoding utf-8
  set encoding=utf-8
  set fileencoding=utf-8
  " set bomb is commented out because we use utf-8
  " for other multi-byte ucs please remove comment
  "set bomb

  " Order of fileencoding for existing files, ucs needs to precedes utf-8
  set fileencodings=ucs-bom,utf-8,latin1
  if &termencoding == ""
    " Handling keyboard inputs same as 'encoding'
    let &termencoding = &encoding
  endif
endif

" Use Unix as the standard file type for EOL
set fileformats=unix,dos,mac

"" Indentation
""""""""""""""""""""""""""""""""""""""""
" do not use smartindent of cindent as they interfere with filetype indents
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2

"" Spell-checking
""""""""""""""""""""""""""""""""""""""""
call system('mkdir -vp ~/.vim/spell/ > /dev/null 2>&1')
set spell
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add

"" swap, backup, undo
""""""""""""""""""""""""""""""""""""""""
call system('mkdir -vp ~/.vim/tmp/undo/ > /dev/null 2>&1')
call system('mkdir -vp ~/.vim/tmp/swap/ > /dev/null 2>&1')
call system('mkdir -vp ~/.vim/tmp/backup/ > /dev/null 2>&1')
set undodir=~/.vim/tmp/undo,.
set directory=~/.vim/tmp/swap,.
set backupdir=~/.vim/tmp/backup,.
set nobackup
set noswapfile
set undofile
set undolevels=1000

"" Search
""""""""""""""""""""""""""""""""""""""""
set incsearch
set hlsearch
set ignorecase
set smartcase

"" Mouse settings
""""""""""""""""""""""""""""""""""""""""
if has("mouse")
  set mouse=a
  " Hide mouse pointer on insert mode."
  set mousehide
  set mousemodel=popup
endif

"" Automatic file read / write
""""""""""""""""""""""""""""""""""""""""
set autoread
set autowriteall

"" Miscellaneous behavioral
""""""""""""""""""""""""""""""""""""""""

" Fix backspace indent
set backspace=indent,eol,start

" enable multiple modified buffers
set hidden

" number of commands to preserve in history
set history=1000

" Use modeline overrides (vim commands in a particular file)
set modeline
set modelines=5

" turn on omni completion
set omnifunc=syntaxcomplete#Complete

" use bash for shell commands
set shell=/bin/bash

" More characters will be sent to the screen for redrawing
set ttyfast

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Visual
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Wrapping (requires vim > 7.4.346)
""""""""""""""""""""""""""""""""""""""""
" Do not wrap words with EOL (insert)
set textwidth=0
set wrapmargin=0
" wrap words with indent (view)
set wrap
set linebreak
set breakindent

"" Line number, cursor position (ruler)
""""""""""""""""""""""""""""""""""""""""
set number
set numberwidth=3
set ruler

"" Terminal color settings
""""""""""""""""""""""""""""""""""""""""
" Setting Color to 16 for xterm
if &term == "xterm" || &term == 'screen'
  set t_Co=16
  " clearing uses the current background color
  set t_ut=
  colorscheme default
endif

if $COLORTERM == 'gnome-terminal'
  term='xterm-256color'
endif

" Setting color to 256 for more sophisticated terminals
if &term =~ '256color'
  set t_Co=256
  " clearing uses the current background color
  set t_ut=
endif

"" Show invisible characters
""""""""""""""""""""""""""""""""""""""""
"set listchars=tab:⇥\ ,trail:·,eol:⏎
set listchars=tab:⇥\ ,trail:·
set list

"" Code / Text folding
""""""""""""""""""""""""""""""""""""""""
" columns for folding
set foldcolumn=0
set foldmethod=syntax
set foldlevel=9
" don't fold by default
set nofoldenable

"" Switching buffers and splitting windows
""""""""""""""""""""""""""""""""""""""""
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" use open buffers when switching buffers, check the :help switchbuff
set switchbuf=useopen,usetab,newtab

"" Miscellaneous visual
""""""""""""""""""""""""""""""""""""""""

" show popup menu for completion
set completeopt=menuone,preview

" always show the status line
set laststatus=2

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" Show (partial) command in status line
set showcmd

" Highlight matching brace
set showmatch

" use visual bell instead of beeping
set visualbell

" Enhanced command completion, shows possible matches
set wildmenu
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

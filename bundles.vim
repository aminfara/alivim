" This file sets NeoBundle and adds plugins to vim using NeoBundle.
" It also includes ~/.vimrc.bundles for to add user plugins as well.
"
" by Ali Aminfar (ali.aminfar@gmail.com) - July 2015

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if !filereadable(expand('~/.vim/bundle/neobundle.vim/README.md'))
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"" Plugins

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
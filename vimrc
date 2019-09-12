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

" vim:set filetype=vim expandtab shiftwidth=2:

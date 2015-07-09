" This file is used for plugin configurations and keyboard mappings.
"
" by Ali Aminfar (ali.aminfar@gmail.com) - July 2015

"" General Keyboard mappings
""""""""""""""""""""""""""""""""""""""""
" <F2> toggles spell checking for file
nnoremap <F2> :<C-u>call ToggleOption('spell', 'local')<CR>

" <F3> toggles paste mode
" The first line is for normal mode and the second is for insert mode
nnoremap <F3> :<C-u>call ToggleOption('paste')<CR>
set pastetoggle=<F3>

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" NERDTree(Tabs)
""""""""""""""""""""""""""""""""""""""""
function! NTTFinder() "{{{
    :NERDTreeTabsOpen
    :NERDTreeTabsFind
endfunction "}}}

let g:NERDTreeChDirMode=2
let g:NERDTreeSortOrder=['\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinSize = 20
let g:NERDTreeBookmarksFile=expand("~/.vim/tmp/NERDTreeBookmarks")
let g:nerdtree_tabs_focus_on_files = 1
nnoremap <silent> <leader>nn :<C-u>call NTTFinder()<CR>
nnoremap <silent> <leader>nc :<C-u>NERDTreeTabsClose<CR>

"" vim-fugitive
""""""""""""""""""""""""""""""""""""""""
noremap <Leader>ga :<C-u>Gwrite<CR>
noremap <Leader>gc :<C-u>Gcommit<CR>
noremap <Leader>gsh :<C-u>Gpush<CR>
noremap <Leader>gll :<C-u>Gpull<CR>
noremap <Leader>gs :<C-u>Gstatus<CR>
noremap <Leader>gb :<C-u>Gblame<CR>
noremap <Leader>gd :<C-u>Gvdiff<CR>
noremap <Leader>gr :<C-u>Gremove<CR>

"" Syntastic
""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_warning_symbol = '⚠⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1

" Ruby syntax checking and lint
let g:syntastic_ruby_checkers = ['mri']
if executable('rubocop')
    let g:syntastic_ruby_checkers = g:syntastic_ruby_checkers + ['rubocop']
    let g:syntastic_ruby_rubocop_args     = '--display-cop-names'
endif

if executable('ruby-lint')
    let g:syntastic_ruby_checkers = g:syntastic_ruby_checkers + ['rubylint']
endif

" Javascript check
if executable('jshint')
    let g:syntastic_javascript_checkers = ['jshint']
endif

"" ctrlp
""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cache_dir = '~/.vim/tmp/ctrlp'
let g:ctrlp_switch_buffer = 'ETVH'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_open_multiple_files = 'vjr'

nnoremap <C-p> :<C-u>CtrlP<cr>
nnoremap <leader>pp :<C-u>CtrlP<cr>
nnoremap <leader>p. :<C-u>CtrlPClearCache<cr>:<C-u>CtrlP<cr>
nnoremap <leader>pl :<C-u>CtrlPLine<cr>
nnoremap <leader>pm :<C-u>CtrlPMRUFiles<cr>
nnoremap <leader>pb :<C-u>CtrlPBuff<cr>
nnoremap <leader>pt :<C-u>CtrlPBufTag<cr>
nnoremap <leader>pT :<C-u>CtrlPBufTagAll<cr>

" ctrlp leaves stale caches behind if there is another vim process running
" which didn't use ctrlp. so we clear all caches on each new vim invocation
if exists(':CtrlP')
  call ctrlp#clra()
endif

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'mixed', 'line']

"" vim-airline
""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if g:airline_powerline_fonts == 0
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline_symbols.readonly  = '⊘'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇' "➔, ➥, ⤴
  let g:airline_symbols.paste     = 'ρ' "Þ, ∥
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

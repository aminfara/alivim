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

"" Language specific configs
""""""""""""""""""""""""""""""""""""""""

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
  let g:syntastic_ruby_rubocop_exec = '~/.vim/scripts/rubocop.sh'
  let g:syntastic_ruby_checkers = g:syntastic_ruby_checkers + ['rubocop']
  let g:syntastic_ruby_rubocop_args = '--display-cop-names'
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
let g:airline_powerline_fonts = 0
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = '┃'
let g:airline#extensions#tabline#left_alt_sep = '│'
let g:airline#extensions#tabline#right_sep = '┃'
let g:airline#extensions#tabline#right_alt_sep = '│'
let g:airline_left_sep          = '┃'
let g:airline_left_alt_sep      = '│'
let g:airline_right_sep         = '┃'
let g:airline_right_alt_sep     = '│'
let g:airline_symbols.readonly  = '⊘'
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⮑' "⎇, ➔, ➥, ⤴
let g:airline_symbols.paste     = 'ρ' "Þ, ∥
let g:airline_symbols.whitespace = 'Ξ'

"" Color scheme
""""""""""""""""""""""""""""""""""""""""
if &term =~ '256color'
  silent! colorscheme solarized
  set background=dark
endif

"" EasyMotion
""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
vmap s <Plug>(easymotion-s2)

" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0

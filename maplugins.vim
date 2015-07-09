" This file is used for plugin configurations and keyboard mappings.
"
" by Ali Aminfar (ali.aminfar@gmail.com) - July 2015

"" General Keyboard mappings
""""""""""""""""""""""""""""""""""""""""
" <F2> toggles spell checking for file
nnoremap <F2> :<C-u>call ToggleOption('spell')<CR>

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
let NERDTreeBookmarksFile=expand("~/.vim/tmp/NERDTreeBookmarks")
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

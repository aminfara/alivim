" This file is used for plugin configurations and keyboard mappings.
"
" by Ali Aminfar (ali.aminfar@gmail.com) - July 2015

"" NERDTree(Tabs)
""""""""""""""""""""""""""""""""""""""""
function! NTTFinder()
    :NERDTreeTabsOpen
    :NERDTreeTabsFind
endfunction

let g:NERDTreeChDirMode=2
let g:NERDTreeSortOrder=['\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinSize = 20
let g:nerdtree_tabs_focus_on_files = 1
nnoremap <silent> <leader>nn :call NTTFinder()<CR>
nnoremap <silent> <leader>nc :NERDTreeTabsClose<CR>

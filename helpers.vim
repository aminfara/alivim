" This file contains some helper functions that can be used for
" recurring tasks.
"
" by Ali Aminfar (ali.aminfar@gmail.com) - July 2015

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Helper Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle options. "{{{
function! ToggleOption(option_name, ...)
  let command='set'
  if a:0 > 0
    if a:1 == 'local'
      let command='setlocal'
    elseif a:1 == 'global'
      let command='setglobal'
    endif
  endif
  execute command a:option_name.'!'
  execute command a:option_name.'?'
endfunction  "}}}

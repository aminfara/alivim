" This is the main config file which sources all other configuration files.
" It does not have any configurations itself.
"
" by Ali Aminfar (ali.aminfar@gmail.com) - July 2015

" helpers.vim contains helper functions used in other files
source ~/.vim/helpers.vim

" bundles.vim setup NeoBundle and adds plugins
source ~/.vim/bundles.vim

" generals.vim is the file for general basic vim settings
source ~/.vim/generals.vim

" maplugins.vim for mappings and plugins settings
source ~/.vim/maplugins.vim

" ~/.vimrc.local user defined configurations
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

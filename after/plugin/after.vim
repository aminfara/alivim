" ~/.vimrc.after user defined configurations runs after all plugins
" This will override all configurations
if filereadable(glob("~/.vimrc.after"))
    source ~/.vimrc.after
endif

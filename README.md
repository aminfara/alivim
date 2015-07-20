# alivim
Ali's vim distribution. This distribution is mostly for Ruby on Rails and Javascript development.

# Requirements
Here is the list of requirements for this distribution works efficiently.
* vim
* Ruby >= 1.9
* Syntastic requirements:
 * rubocop
 * jshint


# Installation
Please copy and paste the following lines in terminal.
```bash
cd ~
git clone https://github.com/aminfara/alivim.git ~/.alivim
ln -sfn ~/.alivim ~/.vim
ln -sfn ~/.alivim/vimrc ~/.vimrc
vim
```

# Features & Usage
## General vim features
General settings are consists of:
* utf-8 encoding
* Automatic indentation (2 spaces per tab, you can overwrite that in customization files)
* Spell-checking (en_us)
* Persistent undo
* Automatic file read / write
* Modern indented text wrapping (requires vim > 7.4.346)
* Compatible with 16 / 256 colors terminals
For details you can check *generals.vim* file.

## General keyboard mappings
Here are the keyboard mappings for vim features, they are defined at the top of *maplugins.vim* file. Specific plugin mappings are in each plugins section.
* F2 toggles spell-checking
* F3 toggles paste mode (if you are using OSX you may need to press fn+F2)
* ctrl+h jumps to left window
* ctrl+l jumps to right window
* ctrl+j jumps to down window
* ctrl+k jumps to up window

## User plugins
You can add your plugins to *~/.vimrc.bundles* file. Add plugins using NeoBundle as follows:
```vim
" Format:
NeoBundle 'plugin'

" Example:
NeoBundle 'tomasr/molokai'
```

## Bundled plugins
### NERDTree (NERDTreeTabs)
I use NERDTreeTabs because it all NERDTrees sychronized in different tabs. It is good if you work on just one project at a time. Mappings are:
* ,nn use (open or focus) NERDTree
* ,nc close NERDTree

### vim-fugitive
Mappings are:
* ,ga :Gwrite
* ,gc :Gcommit
* ,gsh :Gpush
* ,gll :Gpull
* ,gs :Gstatus
* ,gb :Gblame
* ,gd :Gvdiff
* ,gr :Gremove

### Syntastic
Configured for the following languages:
* Ruby
* Javascript
* viml

### CtrlP
Mappings are:
* CTRL-P or ,pp for bringing CtrlP
* ,p. clears CtrlP cache a then opens CtrlP
* ,pl CtrlPLine
* ,pm CtrlPMRUFiles
* ,pb CtrlPBuff
* ,pt CtrlPBufTag
* ,pT CtrlPBufTagAll

### vim-surround
Just works. check github page for help. https://github.com/tpope/vim-surround

### vim-airline
A beautiful status line. If you do not have *powerline* fonts install in your terminal, please put the following in your *~/.vimrc.local*.
```vim
let g:airline_powerline_fonts = 0
```
### Solarized color scheme
You need to add color scheme to you terminal emulator as well so it works fine. You can install terminal colors from http://ethanschoonover.com/solarized/files/solarized.zip . If you had any problems installing solarized you can easily overwrite color scheme in your *~/.vimrc.local* as below:
```vim
colorscheme default
```

# Structure
## User defined files
* ***~/.vimrc.bundles***: You will add your plugins to installation using this file. Just add your plugin as described in *README.md* **'User Plugins'**
* ***~/.vimrc.local***: Your personal config overrides. This file will be loaded after all other config files before plugin runs. You can add your own customizations here.

## Important Files
* ***vimrc***: This is the main config file which sources all other configuration files. It does not have any configurations itself.
* ***helpers.vim***: This file contains some helper functions that can be used for recurring tasks.
* ***bundles.vim***: This file sets NeoBundle and adds plugins to vim using NeoBundle. It also includes ~/.vimrc.bundles for to add user plugins as well.
* ***generals.vim***: This file only contains general vim settings. It does not include any plugin or mapping settings. Settings here makes vim more civilized and modern even without any plugin.
* ***maplugins.vim***: This file is used for plugin configurations and keyboard mappings.
# TODO
Adding the following plugins:
* vimproc

# References
https://github.com/avelino/vim-bootstrap<br />
https://github.com/astrails/dotvim<br />
https://amix.dk/vim/vimrc.html<br />
http://vimconfig.com

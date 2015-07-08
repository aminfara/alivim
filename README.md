# alivim
Ali's vim distribution. This distribution is mostly for Ruby on Rails and Javascript development.

# Requirements
Here is the list of requirements for this distribution works efficiently.
* vim > 7.4.346 (required for indented text wrapping)
* Ruby >= 1.9

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

## User Plugins
You can add your plugins to *~/.vimrc.bundles* file. Add plugins using NeoBundle as follows:
```vim
" Format:
NeoBundle 'plugin'

" Example:
NeoBundle 'tomasr/molokai'
```


# Structure
## User defined files
* ***~/.vimrc.bundles***: You will add your plugins to installation using this file. Just add your plugin as described in *README.md* **'User Plugins'**

## Important Files
* ***vimrc***: This is the main config file which sources all other configuration files. It does not have any configurations itself.
* ***bundles.vim***: This file sets NeoBundle and adds plugins to vim using NeoBundle. It also includes ~/.vimrc.bundles for to add user plugins as well.
* ***generals.vim***: This file only contains general vim settings. It does not include any plugin or mapping settings. Settings here makes vim more civilized and modern even without any plugin.

# References
https://github.com/avelino/vim-bootstrap<br />
https://github.com/astrails/dotvim<br />
https://amix.dk/vim/vimrc.html<br />
http://vimconfig.com

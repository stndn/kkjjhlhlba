# kkjjhlhlba
Customizations for `vim`, because +30 can go a long way.

### Introduction

This is my personal `.vimrc` setup, with additional plugins which helps me go further with Vim.

Some manual setup required, as there is not much point to automate the setup since they won't change that often anyway.

### Dependencies

1. [Vim](https://www.vim.org/) and/or [MacVim](https://macvim.org/)
2. [vim-plug](https://github.com/junegunn/vim-plug/)
3. (optional) [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) (if using `ag`)
4. (optional) [Pyflakes](https://github.com/PyCQA/pyflakes) as the Python linter to [ALE](https://github.com/dense-analysis/ale) (*personal preference applies*)

### Setup

1. Clone this repository to `~/.vim`, taking care not to replace extras that were previously there
2. Add the following line to existing `.vimrc`:
	```
	" +30
	source ${HOME}/.vim/kkjjhlhlba.vim
	```
3. Customize as needed
4. Start `vim` and issue the following command to download and install the plugins:
	```
	:PlugInstall
	```
5. Restart `vim`

### Plugins

List of plugins I used:
* https://github.com/NLKNguyen/papercolor-theme
* https://github.com/bronson/vim-trailing-whitespace
* https://github.com/ctrlpvim/ctrlp.vim
* https://github.com/dense-analysis/ale
* https://github.com/preservim/nerdcommenter
* https://github.com/preservim/nerdtree
* https://github.com/vim-airline/vim-airline
* https://github.com/vim-airline/vim-airline-themes

Each plugins are tagged to ensure the same experience across machines, and to avoid surprises that may come with newer version of the plugins.

### Extras

* Tabs in [MacVim](https://macvim.org/) has specific minimum width, which may cause the tabs to be hidden behind `>>` if too many tabs are opened. To resolve this, run the following command on Terminal, adjusting the value for `MMTabMinWidth` as needed:
    ```
    defaults write org.vim.MacVim MMTabMinWidth 60
    ```


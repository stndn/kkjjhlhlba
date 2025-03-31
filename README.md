# kkjjhlhlba
Customizations for `vim`, because +30 can go a long way.

### Introduction

This is my personal `.vimrc` setup, with additional plugins which helps me go further with Vim.

Some manual set up is required, as there is not much point to automate the setup since they won't change that often anyway.

Note that the setup is intended for Ubuntu server, so some commands may not apply depending on the OS where this is installed at.


### Dependencies

1. [Vim][url-vim] and/or [MacVim][url-macvim]
2. [vim-plug][url-vim-plug]
3. (optional) [The Silver Searcher][url-the-silver-searcher] (if using `ag`)
4. (optional) [Pyflakes][url-pyflakes] as the Python linter to [ALE][url-ale] (*personal preference applies*)

### Setup

1. Clone this repository to `~/.vim`, taking care not to replace extras that were previously there.
1. Install the required [vim-plug][url-vim-plug] by executing the command below.
    ```
    make vim-plug
    ```
1. Install the optional dependencies by executing any or all of the commands below (note: Ubuntu 24.04+ only, requires `sudo`).
    ```
    # Install pyflakes
    make pyflakes

    # Install the silver searcher
    make ag
    ```
1. Add the following line to existing `.vimrc`:
	```
	" +30
	source ${HOME}/.vim/kkjjhlhlba.vim
	```
1. Customize your [`${HOME}/.vim/kkjjhlhlba.vim`][url-kkjjhlhlba] file as needed.
1. Install the plugins with the command below. Note that it may produce error message due to missing color scheme, which can be disregarded for the first execution.
    ```
    make plug-setup
    ```
1. Restart `vim`


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

* Tabs in [MacVim][url-macvim] has specific minimum width, which may cause the tabs to be hidden behind `>>` if too many tabs are opened. To resolve this, run the following command on Terminal, adjusting the value for `MMTabMinWidth` as needed:
    ```
    defaults write org.vim.MacVim MMTabMinWidth 60
    ```

<!-- Links -->
[url-vim]: https://www.vim.org/
[url-macvim]: https://macvim.org/
[url-vim-plug]: https://github.com/junegunn/vim-plug/
[url-the-silver-searcher]: https://github.com/ggreer/the_silver_searcher
[url-pyflakes]: https://github.com/PyCQA/pyflakes
[url-ale]: https://github.com/dense-analysis/ale
[url-kkjjhlhlba]: kkjjhlhlba.vim


" kkjjhlhlba+30

" Prevent double sourcing and skip when forcing vi compatibility
if exists('g:kkjjhlhlba') || &compatible
  finish
else
  let g:kkjjhlhlba = 'yes'
endif


" Variables {{{
" Some values can be adjusted here instead of far down at the bottom

let s:foldlevelstart=8        " Fold level to start with
let s:foldnestmax=10          " Max level of fold nesting
let s:histcount = 256         " Number of commands to be saved in history
let s:linemarkerpos = 80      " Position of line marker
let s:numcolwidth = 5         " Width of number column (left side of editor)
let s:tabpagemax = 50         " Maximum number of tab pages opened on startup
let s:tabsize = 2             " Width of tab/space
let s:hzscrolloffset = 5      " Number of visible columns when scrolling horizontally
let s:vtscrolloffset = 0      " Number of visible rows when scrolling vertically
let s:undoreloadcount = 1024  " Count of reload undo's stored in buffer

let s:bkupdir = $HOME."/.vim/backup"    " Preferred backup dir

" }}}


" Editor settings {{{

" Force utf-8 encoding
set encoding=utf-8
if has("fileencoding")
  set fileencoding=utf-8,latin1,default
endif

" Allow backspace in insert mode
set backspace=indent,eol,start

" Open new split window after current
set splitbelow splitright

" Maximum number of tab pages to be opened by `-p` or `:tab all`
let &tabpagemax = s:tabpagemax

" Keep certain rows and columns visible when scrolling towards the edge
let &scrolloff = s:vtscrolloffset
let &sidescrolloff = s:hzscrolloffset

" Enable file type detection
filetype on

" Enable plugins and load plugin for the detected file type
filetype plugin on

" Adjust the number of commands saved in history
if &history < s:histcount
  let &history = s:histcount
endif

" Disable sound notifications on errors. Stick with visual notification
set noerrorbells
set visualbell

" Save file in unix format when possible
set fileformats=unix,mac,dos

" }}}


" Editing {{{

" Paste settings
if has('gui_running')
   set nopaste        " Reset paste mode since most GUI knows about pasting
else
   set paste          " Put Vim in paste mode, useful if we want to paste texts from outside to Vim
endif

" Where possible, delete comment character when joining multiple comment lines
set formatoptions+=j

" Show partial command typed in the last line of the screen
set showcmd

" Briefly show matching brackets when inserted
set showmatch

" Enable filename auto completion menu after pressing tab
set wildmenu

" Make wildmenu behaves similar to Bash completion
set wildmode=list:longest

" Ignore these files as we would not edit them with Vim
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}


" Display {{{

" Use dark mode
set background=dark

" Enable syntax highlighting
syntax enable

" Show line number
set number

" Minimum width for showing line number
let &numberwidth = s:numcolwidth

" Highlight the text line of the cursor
set cursorline

" Show marker to indicate the position of specified column
let &colorcolumn = s:linemarkerpos

" Always report number of lines changed
set report=0

" Display long last line as much as possible. When not included, long line is replaced with `@`
set display=lastline

" Do not wrap long lines
set nowrap

" Do not break long lines
set textwidth=0

" Show the current mode on the last line
set showmode

" Do not redraw while running macros
set lazyredraw

" Hide the mouse cursor when typing
set mousehide

" }}}


" Spacing and indentation {{{

" Set the width of tabs/spaces and line shifting
let &softtabstop = s:tabsize
let &shiftwidth = s:tabsize
let &tabstop = s:tabsize

" Use space characters instead of tabs
set expandtab

" Do not copy indentation from current line when starting new line
set noautoindent nosmartindent

" Disable C-style indentation
set nocindent

" Disable indentation for detected file type. Turn it on to enable autoindent
filetype indent off

" }}}


" Backup and undo {{{

" Allow undo file changes even after saving (and quitting) it
let &undodir = s:bkupdir
set undofile
let &undoreload = s:undoreloadcount

" Several settings related to backups:

" Skip backups from here
set backupskip=/tmp/*,/private/tmp/*

" Backup directory
let &backupdir = s:bkupdir
set backupdir+=/tmp

" Directory for temporary/swap files
let &directory = s:bkupdir
set directory+=/tmp

" Create backup before overwriting file. Keep it during edit and delete afterwards
set nobackup writebackup

" }}}


" Searching {{{

" Incremental search and highlight matches as we type
set incsearch

" Ignore case during search, unless when searching using mixed caps
set ignorecase smartcase

" Do not highlight search result
set nohlsearch

" }}}


" Folding {{{

" Fold based on indent level. Should be adjusted by file type
set foldmethod=indent

" Max nesting of fold. This prevents nested foldings from going overboard
let &foldnestmax = s:foldnestmax

" Start with folding enabled
set foldenable

" Start with specified fold level
let &foldlevelstart = s:foldlevelstart
" }}}


" Shortcuts and Key re/maps {{{
" Assign shortcuts and other command alternatives

" Resize split windows using arrow keys by pressing: CTRL+(up/down/left/right)
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Make shift-insert work for pasting. Depends on the environment
"map <S-Insert> "+p
"map! <S-Insert> "+p
"imap <S-Insert> <ESC><S-Insert>a

" }}}


" Plugins {{{
" Using plugin manager from https://github.com/junegunn/vim-plug

" Use specific versions of the plugins to ensure same version used everywhere
call plug#begin()
  Plug 'https://github.com/NLKNguyen/papercolor-theme',       { 'tag': 'v1.0' }
  Plug 'https://github.com/bronson/vim-trailing-whitespace',  { 'tag': '1.0' }
  Plug 'https://github.com/ctrlpvim/ctrlp.vim',               { 'tag': '1.81' }
  Plug 'https://github.com/dense-analysis/ale',               { 'tag': 'v3.3.0' }
  Plug 'https://github.com/preservim/nerdcommenter',          { 'tag': '2.6.0' }
  Plug 'https://github.com/preservim/nerdtree',               { 'tag': '6.10.16' }
  Plug 'https://github.com/vim-airline/vim-airline',          { 'tag': 'v0.11' }
  Plug 'https://github.com/vim-airline/vim-airline-themes'

  " For future considerations
  " Plug 'https://github.com/sheerun/vim-polyglot',             { 'tag': 'v4.17.0' }
  " Plug 'https://github.com/tpope/vim-fugitive',               { 'tag': 'v3.7' }
call plug#end()

" }}}


" Plugin settings {{{

" PaperColor Theme {{{2
if has_key(plugs, 'papercolor-theme')
  let g:PaperColor_Theme_Options = {
    \   'theme': {
    \     'default': {
    \       'transparent_background': 1
    \     }
    \   }
    \ }
  colorscheme PaperColor
endif
" 2}}}

" ALE {{{2
if has_key(plugs, 'ale')
  " Don't auto lint during edits
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 0

  " Integrate with vim-airline
  let g:airline#extensions#ale#enabled = 1

  " Show problems where the cursor lies
  let g:ale_virtualtext_cursor = 'current'

  " Uncomment to disable auto lint on file open
  " let g:ale_lint_on_enter = 0

  " Override linter used for python
  " Requires pyflakes: https://github.com/PyCQA/pyflakes
  let g:ale_linters = {'python': ['pyflakes']}
endif

" 2}}}

" CtrlP {{{2
if has_key(plugs, 'ctrlp')
  " Shortcut for toggling CtrlP
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'

  let g:ctrlp_match_window = 'bottom,order:ttb'
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_working_path_mode = 0

  " Use `ag` to perform search when available
  " Requires The Silver Searcher: https://github.com/ggreer/the_silver_searcher
  if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

    " When `ag` is fast enough that CtrlP does not need to cache, enable the line below:
    " let g:ctrlp_use_caching = 0
  endif
endif

" 2}}}

" NERDTree {{{2
if has_key(plugs, 'nerdtree')
  " Shortcut for toggling NERDTree
  nmap <leader>t :NERDTreeToggle<CR>
  nmap <leader>T :NERDTreeFind<CR>
endif

" 2}}}

" NERDCommenter {{{2
if has_key(plugs, 'nerdcommenter')
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1
endif

" 2}}}

" }}}


" Custom functions {{{

" Case switching based on code at http://vim.wikia.com/wiki/Switching_case_of_characters
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" }}}


" Autocmd's {{{

if has('autocmd')

  " FixWhitespace upon save
  if has_key(plugs, 'vim-trailing-whitespace')
    autocmd BufWritePre * :FixWhitespace
  endif

endif

" }}}


" Overrides {{{
" Things to override after everything is (almost) done

" Use true dark background color
highlight Normal guibg=#000000
highlight NonText guibg=#000000

" Python styles is really about individual preferences
let g:python_recommended_style=0

" }}}


" vim:foldenable:foldmethod=marker:foldlevel=0

" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

set nocompatible               " be iMproved
filetype off                   " required for vundle

set pastetoggle=<F2>

" close buffers with Ctrl-F4 using bufferkill
nnoremap <F4> :BD<CR>

" disable command line history
map q: :q

let mapleader = ","            " remaping the leader key

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" E492: Not an editor command: Q
command! Q q
command! Qa qa
command! QA qa
command! W w
command! Wq wq
command! WQ wq

"ctrl-hjkl switches windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set noerrorbells                  " I
set vb t_vb=                      " REALLY
if has('autocmd') && has('gui')   " HATE
  au GUIEnter * let &t_vb = ""    " BELLS
endif                             " autocmd necessary because gvim clobbers vb setting

set directory=~/tmp,/var/tmp,/tmp,$TEMP/ "directory where the .swp files are created.

set undofile                            "save file undo history
set undodir=~/tmp,/var/tmp,/tmp,$TEMP/

set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=indent,eol,start     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
"set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.
 
filetype plugin indent on
syntax on
set nowrap

" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
set t_Co=256
"set t_Co=88
if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  runtime! plugin/guicolorscheme.vim
  "GuiColorScheme desert256
  "GuiColorScheme peaksea
  "GuiColorScheme solarized
  GuiColorScheme xoria256
else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
  colorscheme xoria256
endif

""" VUNDLE SETTINGS { plugin manager
  set runtimepath+=~/.vim/bundle/vundle/ "add vundle to the run time path
  call vundle#rc()                    "Run vundle
  """ BUNDLES {
    "git wrapper
    Bundle 'tpope/vim-fugitive'
    Bundle 'Lokaltog/vim-easymotion'
    let g:EasyMotion_leader_key = '<Leader>m'

    "tool to find buffers and tags quickly
    Bundle 'L9'
    Bundle 'FuzzyFinder' 

    Bundle 'scrooloose/nerdtree'
    nnoremap <leader>d :NERDTreeToggle<cr>

    "ring of copied text
    Bundle 'YankRing.vim'
    let g:yankring_history_file = '.yankring_history'

    "color matching Parenthesis
    Bundle 'Rainbow-Parenthsis-Bundle'

    "kill buffers(BD) without destroying windows
    Bundle 'bufkill.vim'

    "Easily quote/tag text
    Bundle 'surround.vim'

    "Open file:linenumber files properly
    Bundle 'file-line'

    "* and # search for visual selections
    Bundle "http://github.com/gmarik/vim-visual-star-search.git"

    "Visualize undo history
    Bundle "Gundo"
    nnoremap <F5> :GundoToggle<CR>

    "the solarized color scheme
    Bundle "https://github.com/altercation/vim-colors-solarized.git"

    Bundle 'msanders/snipmate.vim'

    Bundle 'wincent/Command-T'
    nnoremap <leader>t :CommandT<cr>

    Bundle 'jeetsukumaran/vim-filesearch'

    Bundle 'Raimondi/delimitMate'

    Bundle 'docunext/closetag.vim'

    Bundle 'kevinw/pyflakes-vim'

    Bundle 'scrooloose/nerdcommenter'

    Bundle 'ervandew/supertab'

    Bundle 'majutsushi/tagbar'

    Bundle 'vcscommand.vim'
  """ } BUNDLES
""" } VUNDLE SETTINGS

" Movement between tabs OR buffers
nnoremap L :call MyNext()<CR>
nnoremap H :call MyPrev()<CR>

" MyNext() and MyPrev(): Movement between tabs OR buffers
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction

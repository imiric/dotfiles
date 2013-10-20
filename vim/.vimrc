" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

set nocompatible               " be iMproved
set nocompatible               " be iMproved

set pastetoggle=<F2>

" remove trailing whitespace from a file
nnoremap <silent> <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" close buffers with Ctrl-F4 using bufferkill
nnoremap <silent> <F4> :BD<CR>

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

"set rtp+=/home/ivan/src/powerline/powerline/bindings/vim

"ctrl-hjkl switches windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move over displayed instead of physical lines
nnoremap j gj
nnoremap k gk

" Getting rid of the help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" No more shift!
nnoremap ; :

" Execute file being edited with <Shift> + e:
"map <buffer> <S-e> :w<CR>:!/usr/bin/env python %<CR>
nmap <buffer> <S-e> :w<CR>:!chmod +x %:p<CR>:!time %:p<CR>

" Folding
"set foldmethod=indent
"set foldnestmax=2
"nnoremap <space> za
"vnoremap <space> zf

" NERDCommenter
nnoremap <Bslash><Bslash> :call NERDComment('n', 'toggle')<cr>
vnoremap <Bslash><Bslash> :call NERDComment('x', 'toggle')<cr>

" global yank/paste
vmap <silent> <leader>y "xy<CR>:wviminfo! ~/.viminfo<CR>
nmap <silent> <leader>p :rviminfo! ~/.viminfo<CR>"xp

" vim-latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

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

" Adding a column indicator and changing its color
set colorcolumn=85
au ColorScheme * highlight ColorColumn ctermbg=8
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight NonText ctermbg=none

set nowrap

" Disabling highlighting after search
nnoremap <silent> <leader><space> :noh<cr>

" Using tab to jump between bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" If file is already opened, switch to its tab
set switchbuf=usetab,newtab

nnoremap <silent> <leader>1 :tabnext 1<cr>
nnoremap <silent> <leader>2 :tabnext 2<cr>
nnoremap <silent> <leader>3 :tabnext 3<cr>
nnoremap <silent> <leader>4 :tabnext 4<cr>
nnoremap <silent> <leader>5 :tabnext 5<cr>
nnoremap <silent> <leader>6 :tabnext 6<cr>
nnoremap <silent> <leader>7 :tabnext 7<cr>
nnoremap <silent> <leader>8 :tabnext 8<cr>
nnoremap <silent> <leader>9 :tabnext 9<cr>
nnoremap <silent> - :tabprevious<cr>
nnoremap <silent> = :tabnext<cr>

" Cycling between tabs
au TabLeave * :let g:last_tab=tabpagenr()
fun! <sid>LastTab()
    if !exists("g:last_tab")
        return
    endif
    exec "tabn" g:last_tab
endfun
nmap <silent> <bs> :call <sid>LastTab()<cr>

" Django stuff
" let g:last_relative_dir = ''
" nnoremap <leader>1 :call RelatedFile ("models.py")<cr>
" nnoremap <leader>2 :call RelatedFile ("views.py")<cr>
" nnoremap <leader>3 :call RelatedFile ("urls.py")<cr>
" nnoremap <leader>4 :call RelatedFile ("admin.py")<cr>
" nnoremap <leader>5 :call RelatedFile ("tests.py")<cr>
" nnoremap <leader>6 :call RelatedFile ( "templates/" )<cr>
" nnoremap <leader>7 :call RelatedFile ( "templatetags/" )<cr>
" nnoremap <leader>8 :call RelatedFile ( "management/" )<cr>
" nnoremap <leader>0 :tabnew settings.py<cr>
" nnoremap <leader>9 :tabnew urls.py<cr>
" 
" fun! RelatedFile(file)
"     "This is to check that the directory looks djangoish
"     if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
"         let buffername = bufname(a:file)
"         if buffername == ""
"             exec "tabnew %:h/" . a:file
"         else
"             let buffernumber = bufnr(buffername) 
"             exec "tabnext " . buffernumber
"         endif
"         let g:last_relative_dir = expand("%:h") . '/'
"         return ''
"     endif
"     if g:last_relative_dir != ''
"         let buffername = bufname(a:file)
"         if buffername == ""
"             exec "tabnew " . g:last_relative_dir . a:file
"         else
"            let buffernumber = bufnr(buffername) 
"            exec "tabnext " . buffernumber
"         endif
"         return ''
"     endif
"     echo "Cant determine where relative file is : " . a:file
"     return ''
" endfun
" 
" fun SetAppDir()
"     if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
"         let g:last_relative_dir = expand("%:h") . '/'
"         return ''
"     endif
" endfun
" autocmd BufEnter *.py call SetAppDir()

" Underline the current line with dashes in normal mode
nnoremap <leader>- yyp<c-v>$r-
nnoremap <leader>= yyp<c-v>$r=

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
    Bundle 'gmarik/vundle' 
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
    Bundle 'vim-scripts/YankRing.vim'
    let g:yankring_history_file = '.yankring_history'
    let g:yankring_manual_clipboard_check = 0

    "color matching Parenthesis
    Bundle 'Rainbow-Parenthsis-Bundle'

    "kill buffers(BD) without destroying windows
    Bundle 'bufkill.vim'

    "Easily quote/tag text
    Bundle 'surround.vim'
    let g:surround_{char2nr('o')} = "**\r**"
    
    "Extends '.' to be used for plugin maps
    Bundle 'tpope/vim-repeat'

    "Open file:linenumber files properly
    Bundle 'file-line'

    "* and # search for visual selections
    Bundle "http://github.com/gmarik/vim-visual-star-search.git"

    "Visualize undo history
    Bundle "Gundo"
    nnoremap <F5> :GundoToggle<CR>

    "the solarized color scheme
    Bundle "https://github.com/altercation/vim-colors-solarized.git"

    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle "tomtom/tlib_vim"
    Bundle 'garbas/vim-snipmate'

    Bundle 'wincent/Command-T'
    nnoremap <leader>t :CommandT<cr>

    "Bundle 'kien/ctrlp.vim'
    "let g:ctrlp_custom_ignore = '\.pyc$'
    "let g:ctrlp_map = '<leader>t'
    ""let g:ctrlp_open_new_file = 1
    ""let g:ctrlp_open_multi = '1t'
    "let g:ctrlp_working_path_mode = 0
    " The following line is used by Command-T or ctrlp and it breaks Vundle
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc,*/venv/*,*/node_modules/*

    Bundle 'jeetsukumaran/vim-filesearch'

    Bundle 'Raimondi/delimitMate'

    "Bundle 'docunext/closetag.vim'
    Bundle 'tpope/vim-ragtag'

    "Bundle 'kevinw/pyflakes-vim'
    "let g:pyflakes_use_quickfix = 0
    Bundle 'scrooloose/syntastic'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_python_checker = "pyflakes"
    let g:syntastic_check_on_open=1

    Bundle 'scrooloose/nerdcommenter'

    Bundle 'ervandew/supertab'

    Bundle 'majutsushi/tagbar'

    Bundle 'vcscommand.vim'

    Bundle 'mileszs/ack.vim'
    nnoremap <leader>a :Ack 

    Bundle 'JumpToLastOccurrence'
    let g:JumpToLastOccurrence_Leader = ',,'
    
    Bundle 'tsaleh/vim-matchit'

    Bundle 'kchmck/vim-coffee-script'

    Bundle 'wavded/vim-stylus'

    Bundle 'statianzo/vim-jade'

    Bundle 'django.vim'

    Bundle 'guicolorscheme.vim'

    Bundle 'imiric/pythonhelper'

    Bundle 'vim-scripts/hgrev'
    let g:hgrevAutoUpdate = 1

    Bundle 'plasticboy/vim-markdown'

    Bundle 'mattn/webapi-vim'
    Bundle 'mattn/gist-vim'
    let g:gist_post_private = 1
    let g:gist_open_browser_after_post = 1

    "Bundle 'henrik/vim-indexed-search'
  """ } BUNDLES
""" } VUNDLE SETTINGS

" Movement between tabs OR buffers
nnoremap <silent> L :call MyNext()<CR>
nnoremap <silent> H :call MyPrev()<CR>

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

filetype off                   " required for vundle
syntax on
filetype plugin indent on

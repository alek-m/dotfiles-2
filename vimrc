" Shaon Diwakar <shaon@shaon.net>
" 5 October 2015

" Don't need old school vi
set nocompatible

" Full color
set t_Co=256

" Set our tab labels
autocmd VimEnter * set guitablabel=%N:\ %t\ %M

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Languages
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'wookiehangover/jshint.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'jtratner/vim-flavored-markdown.git'
Bundle 'skwp/vim-html-escape'
Bundle 'ap/vim-css-color'

" File Management
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'

" Autocompletion
" Plugin 'Valloric/YouCompleteMe'
Bundle "Shougo/neocomplete.git"
Bundle "skwp/YankRing.vim"

" Git
Plugin 'tpope/vim-fugitive'


" UI improvements
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tcomment_vim'
Bundle "chrisbra/color_highlight.git"
Bundle "xsunsmile/showmarks.git"
Bundle "godlygeek/csapprox.git"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "skwp/vim-colors-solarized"

call vundle#end()

" Run these only if there's a GUI
if has('gui_running')
    let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'fugitive': 'MyFugitive',
        \   'readonly': 'MyReadonly',
        \   'filename': 'MyFilename',
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
        \ }

  function! MyReadonly()
    if &filetype == "help"
      return ""
    elseif &readonly
      return "⭤ "
    else
      return ""
    endif
  endfunction

  function! MyFugitive()
    if exists("*fugitive#head")
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
    return ''
  endfunction

  function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
         \ ('' != expand('%') ? expand('%') : '[NoName]')
  endfunction

  nmap <F8> :TagbarToggle<CR>
endif

" Check that colour schemes are enabled.
if exists("##ColorScheme")
  syntax on
  colorscheme solarized
endif

" Set our most awesome font
if has('gui_running')
  set guifont=Hack:h16,Source\ Code\ Pro\ for\ Powerline:h15,Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
endif

" This is to stop keyboard mapping problems, enable if you have issues
" set term=builtin_ansi

" Remapping the <LEADER> key
let mapleader = ','

" Basic config
set number
set ignorecase
set incsearch
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set encoding=utf-8
set hidden
set ruler
set showcmd
set showmode
set visualbell
set noerrorbells

" Auto-completion
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set title
set softtabstop=2
set smartindent
set autoindent
set hlsearch
set backspace=2
set nobackup
set smartcase
set lbr
set formatoptions=cqt
set wrapmargin=0
set textwidth=80
set foldcolumn=0
set foldlevelstart=5
set foldmethod=syntax
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" Start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" Set new vertical splits to be on the right
set splitright

" set colorcolumn=+1
" highlight ColorColumn ctermfg=LightGreen guifg=DarkGreen ctermbg=NONE

" Set the default language for this host
"set spellfile=~/.vim/spell
setlocal spelllang=en_au

" Sets the temporary directory
" set directory=~/.vim/tmp/

set nobackup
set noswapfile

" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> ,f <C-]>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" Neocomplete
" Next generation completion framework.
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_smart_case = 1

" Default # of completions is 100, that's crazy.
let g:neocomplete#max_list = 5

" Set minimum syntax keyword length.
let g:neocomplete#auto_completion_start_length = 3

" Map standard Ctrl-N completion to Ctrl-Space
inoremap <C-Space> <C-n>

" This makes sure we use neocomplete completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out.
let g:neocomplete#force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Make Python syntax highlighting highlight more things
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1

" Set the status line preferences
set laststatus=2


" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Toggle the fold column
nnoremap <leader>f :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=2
    endif
endfunction

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

" Ensure we're always enabling file type checking
filetype off
filetype indent on
filetype plugin on
filetype plugin indent on


" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Load our Js checker
let g:syntastic_javascript_checkers = ['jshint']

" Tell showmarks to not include the various brace marks (),{}, etc
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"

" Remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Mouse control homie 'G
if has("mouse")
  set mouse=a
endif

" tComment
" ========================================
" extensions for tComment plugin. Normally
" tComment maps 'gcc' to comment current line
" this adds 'gcp' comment current paragraph (block)
" using tComment's built in <c-_>p mapping
nmap <silent> gcp <c-_>p

" Tell Yankring to put its history file in a neat location
let g:yankring_history_dir = '~/.vim'

" ==== NERD tree
" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>

" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

"Go to last edit location with ,.
nnoremap ,. '.

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

syntax enable
set background=dark
colorscheme solarized

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

" Disable the macvim toolbar
set guioptions-=T

let vimsettings = '~/.vim/settings'
so ~/.vim/settings/solarized.vim
so ~/.vim/settings/windowkiller.vim

let g:NERDTreeWinSize=60
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeMapOpenInTab='\r'
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" NERDTreeTabsToggle Options
let g:nerdtree_tabs_open_on_console_startup=1

set shell=bash
set ttymouse=xterm2

" Syntastic opions
let g:syntastic_full_redraws=1

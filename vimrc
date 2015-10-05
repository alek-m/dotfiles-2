" Shaon Diwakar <shaon@shaon.net>
" 5 October 2015

set nocompatible


set t_Co=256
autocmd VimEnter * set guitablabel=%N:\ %t\ %M

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
" Plugin 'altercation/solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
" Plugin 'Lokaltog/powerline'
" Plugin 'stephenmckinney/vim-solarized-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'wookiehangover/jshint.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'garbas/vim-snipmate.git'
Bundle 'honza/vim-snippets'
Bundle 'jtratner/vim-flavored-markdown.git'
Bundle 'nelstrom/vim-markdown-preview'
Bundle 'skwp/vim-html-escape'
Bundle "chrisbra/color_highlight.git"
Bundle "skwp/vim-colors-solarized"
Bundle "jby/tmux.vim.git"
Bundle "morhetz/gruvbox"
Bundle "xsunsmile/showmarks.git"
Bundle "chriskempson/base16-vim"
Bundle "skwp/YankRing.vim"
Bundle "Shougo/neocomplete.git"
Bundle "godlygeek/csapprox.git"
Bundle "nathanaelkane/vim-indent-guides"

call vundle#end()

" Run these only if there's a GUI
if has('gui_running')
  " Adding powerline and YouCompleteMe
  let g:Powerline_theme='short'
  let g:Powerline_colorscheme='solarized256_dark'

  " Adding support for powerline
  " set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

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
        \ }
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

if has('gui_running')
  set guifont=Hack:h16,Source\ Code\ Pro\ for\ Powerline:h15,Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
endif

" This is to stop keyboard mapping problems, enable if you have issues
" set term=builtin_ansi

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
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class

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
set foldmethod=indent
set foldlevelstart=5

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
set directory=~/.vim/tmp//

" Backup files to into .vim
"set backupdir=~/.vim/backup//
"set backup
set nobackup
set noswapfile

" neocomplete
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
" This is overridden by vim-powerline
set laststatus=2
" set statusline=
" set statusline+=%3.3n\
" set statusline+=%f\
" set statusline+=%h%m%r%w
" set statusline+=\[%{strlen(&ft)?&ft:'none'}]
" set statusline+=%=
" set statusline+=0x%-8B
" set statusline+=%-14(%l,%c%V%)
" set statusline+=%<%P
" set statusline+=%{fugitive#statusline()}

" Remapping the <LEADER> key
let mapleader = ','

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

" Enable JShint checking
let g:syntastic_javascript_checkers = ['jshint']

" JavaScript folding & extended syntax
" au FileType javascript call JavaScriptFold()

" Tell showmarks to not include the various brace marks (),{}, etc
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"

" Remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

if !has('lua')
  let g:neocomplete#enable_at_startup = 0
else
  let g:neocomplete#enable_at_startup = 1
endif

set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" ================ Completion =======================

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

" Release the kraken!
if has("mouse")
  set mouse=a
endif

set foldmethod=syntax
au FileType javascript call JavaScriptFold()

" Tell Yankring to put its history file in a neat location
let g:yankring_history_dir = '~/.vim'

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
" ------------------------------------------------------------------
" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
syntax enable
set background=dark
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=16
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1
"

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

" Shaon Diwakar <shaon@shaon.net> 08Aug2010

" Check that colour schemes are enabled. 
if exists("##ColorScheme")
    syntax on
    colorscheme torte 
endif 

" This is to stop keyboard mapping problems, enable if you have issues
set term=builtin_ansi

set nocompatible
set background=dark
set number
set ignorecase
set incsearch
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set encoding=utf-8
set ruler
set showcmd
set showmode
set visualbell
set noerrorbells
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
" set rtp+=/usr/local/go/misc/vim
set colorcolumn=+1
highlight ColorColumn ctermfg=LightGreen guifg=DarkGreen ctermbg=NONE

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

" Ensure we're always enabling file type checking
filetype on
filetype indent on
filetype plugin on

" Allow tab autocompletion of commands
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType sql set omnifunc=sqlcomplete#CompleteSQL

" Make Python syntax highlighting highlight more things
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1

" Set the status line preferences
set laststatus=2
set statusline=
set statusline+=%3.3n\
set statusline+=%f\
set statusline+=%h%m%r%w
set statusline+=\[%{strlen(&ft)?&ft:'none'}]
set statusline+=%=
set statusline+=0x%-8B
set statusline+=%-14(%l,%c%V%)
set statusline+=%<%P

" Map the following commands for block commenting
map ,# :s/^/#/<CR>:nohlsearch<CR>
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ,> :s/^/> /<CR>:nohlsearch<CR>
map ," :s/^/\"/<CR>:nohlsearch<CR>
map ,% :s/^/%/<CR>:nohlsearch<CR>
map ,! :s/^/!/<CR>:nohlsearch<CR>
map ,; :s/^/;/<CR>:nohlsearch<CR>
map ,- :s/^/--/<CR>:nohlsearch<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" Map keys for wrap around commenting
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" Adding Pathogen support
call pathogen#infect()
call pathogen#helptags()

" We are adding support for flake8 (and PEP8)
autocmd BufWritePost *.py call Flake8()

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For MacVIM or GVIM
if has('gui_running')

    set mouse=a
    colorscheme guru

    set lines=55
    set columns=150
    set transparency=4
    set guifont=Source\ Code\ Pro:h14

    " Function that puts a number into the tab label
    set guitablabel=(%N%M)\ %t

    " Turn off the toolbar
    set guioptions-=T

    " Turn off the right-hand side scrollbar
    set guioptions-=r 
    
    " Ensure I always use the tree style for browsing files
    let g:netrw_liststyle=3

    " If we are in the gui, highlight the lines that are longer than 80 characters
    " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    " match OverLength /\%81v.\+/

endif 

" Shaon Diwakar <shaon@shaon.net> 08Aug2010

" Check that colour schemes are enabled. 
if exists("##ColorScheme")
    syntax on
    colorscheme torte 
endif 

" This is to stop keyboard mapping problems, enable if you have issues
" set term=builtin_ansi

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
" set formatoptions=cqt
set formatoptions=qnjc
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

" set rtp+=/usr/local/go/misc/vim
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
" This is overridden by vim-powerline
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
set statusline+=%{fugitive#statusline()}

" Remapping the <LEADER> key
"let mapleader = ','

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

" JSLint: https://github.com/hallettj/jslint.vim
let g:JSLintHighlightErrorLine = 0

" Adding support for powerline
set rtp+=/Users/sdiwakar/.vim/bundle/powerline/powerline/bindings/vim

" Disable a few plugins
let g:pathogen_disabled = ['jslint', 'jsbeautify', 'vim-indent-guides', 'vim-powerline']

" Adding Pathogen support
call pathogen#infect()
call pathogen#helptags()

" For MacVIM or GVIM
if has('gui_running')

    set mouse=a
    colorscheme guru

    set lines=55
    set columns=180
    set transparency=0
    set guifont=Source\ Code\ Pro\ for\ Powerline:h15
    "set guifont=Inconsolata:h16
    "set linespace=1.3 

    " Turn off the toolbar
    set guioptions-=T

    " Turn off the right-hand side scrollbar
    set guioptions-=r 
    
    " Ensure I always use the tree style for browsing files
    let g:netrw_liststyle=3

    " If we are in the gui, highlight the lines that are longer than 80 characters
    " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    " match OverLength /\%81v.\+/

    " Show the tabline
    set showtabline=1

    " Show tab pages
    set guioptions+=e

    " Function that puts a number into the tab label
    set guitablabel=(%N)\ %t

    " Set the Cursor Line
    set cursorline

    " Show invisibles
    set listchars=tab:▸\ ,eol:¬
    "set list

    " Make NERDTree hijack netrw
    let NERDTreeHijackNetrw=1
    
endif 

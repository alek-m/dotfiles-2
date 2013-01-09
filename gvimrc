" For MacVIM or GVIM
if has('gui_running')

    set mouse=a
    colorscheme guru

    set lines=55
    set columns=150
    set transparency=4
    set guifont=Source\ Code\ Pro:h14

    " Turn off the toolbar
    set guioptions-=T

    " Turn off the right-hand side scrollbar
    set guioptions-=r 
    
    " Ensure I always use the tree style for browsing files
    let g:netrw_liststyle=3

    " If we are in the gui, highlight the lines that are longer than 80 characters
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/

    " Show the tabline
    set showtabline=1

    " Show tab pages
    set guioptions+=e

    " Function that puts a number into the tab label
    set guitablabel=(%N)\ %t

    " Set the Cursor Line
    set cursorline

endif 

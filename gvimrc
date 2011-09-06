" For MacVIM or GVIM
if has('gui_running')

    set mouse=a
    colorscheme vibrantink

    set lines=70
    set columns=150
    set transparency=5
    set guifont=Inconsolata:h16

    " Function that puts a number into the tab label
    set guitablabel=(%N%M)\ %t

    " Turn off the toolbar
    set guioptions-=T
    
    " Ensure I always use the tree style for browsing files
    let g:netrw_liststyle=3

    " If we are in the gui, highlight the lines that are longer than 80 characters
    " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    " match OverLength /\%81v.\+/

endif 
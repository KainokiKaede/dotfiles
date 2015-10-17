" Even if you have set the colorscheme in $HOME/_vimrc, you have to reset
" it here. Because default .gvimrc will be read AFTER reading $HOME/_vimrc.
colorscheme desert  " Defaults I like: torte, koehler, desert, slate, pablo

set lines=999  " Diagonally maximize.
set columns=83  " 4 (numberwidth) + 1 (a blank line) + 79 (PEP8)
command IniSize set lines=999 | set columns=83

" If you don't know the exact fontname, use GUI interface
" (i.e. choose a font from a toolbar) and do :set guifont?
" This will show the vim-readable fontname, so write it in your _gvimrc
if has('gui') && has('mac')
    " Not 'gui_macvim'; maybe I'll use another GUI-Vim in the future.

    " Ricty font is in $HOME/vimfiles/ Please install to the OS before use.
    " In windows, this font won't show pretty.
    set guifont=Ricty\ Regular:h16
endif

" Use English menubar
source $VIMRUNTIME/delmenu.vim
set langmenu=none
source $VIMRUNTIME/menu.vim

" Do not use pop-up dialogue (use console dialogue instead). See: :help go-c
set guioptions+=c

" Minify font (for privacy reasons)
command MinFont call MinifyFont()
let g:minifyfont_on = 0
function! MinifyFont()
    if g:minifyfont_on
        set guifont=Ricty\ Regular:h16
        let g:minifyfont_on = 0
        echo 'MinFont is off.'
    else
        set guifont=Ricty\ Regular:h7
        let g:minifyfont_on = 1
        echo 'MinFont is on.'
    endif
endfunction

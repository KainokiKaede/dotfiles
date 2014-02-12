" Use NeoBundle
source ~/vimfiles/neobundle_setting.vim

set backspace=indent,eol,start  " Use backspace on everything in insert mode
set history=50   " keep 50 lines of command line history
set ruler        " show the cursor position all the time
set showcmd      " display incomplete commands: may be slow if online.
set incsearch    " do incremental searching
set number       " Show line numbers
set cindent      " This is smarter than smartindent. See :help C-indenting
set scroll=8     " Lines to scroll by CTRL-D & CTRL-U
set scrolloff=5  " Show 5 lines around the current line when scrolling.
set ignorecase   " ignore case
set smartcase    " but don't ignore if search string has uppercase letters
set showmatch    " showmatch: Show the matching bracket for the last ')'?
set wrap         " wrap by default
set hidden       " use hidden buffers
set confirm      " Confirm when overwriting, quitting w/o saving, and else.
set nobackup     " Do not create backup file.
set backupcopy=yes         " Making a copy and overwriting the original file.
set virtualedit+=block     " select void in rectangle selection
set formatoptions=q        " Disable auto-linebreak
set textwidth=0            " Disable autoreturn (PEP8 requires textwidth=79)
set whichwrap=b,s,<,>,[,]  " Wrap <BS>, <Space>, <LEFT>, <RIGHT>
set list                   " Show invisible characters.
set listchars=tab:>.,trail:_,extends:>,precedes:<   " How to show invisibles.
set expandtab tabstop=4 shiftwidth=4 softtabstop=4  " Python-like indentation
syntax enable      " Syntax highlight: see :help syntax-on for alternative
" Set colorscheme. Defaults I like: torte, koehler, desert, slate, pablo
try | colorscheme desert256 | catch | colorscheme torte | endtry

"""""""""""""""""""" Python Settings START """"""""""""""""""""""""
" Indentation.
" No need to set autoindent nor smartindent, because cindent is set above.
filetype plugin on
autocmd FileType python setl cinwords=if,elif,else,for,while,try,except,finally,def,class

" type "gpy" to execute python on vim.
autocmd FileType python nnoremap gpy :<C-u>! python "%:p" -v<CR>
" Type "gpu" to execute python and show the output in scratch buffer.
" FYI: In scratch.vim, these 4 options are set: setl buftype=nofile bufhidden=hide noswapfile buflisted
"      To make the buffer optional to save, buftype=nofile is the only necessary option to set.
"      To know better, read the code: https://github.com/vim-scripts/scratch.vim/
"      To learn why 'execute' is used, see :help :bar
"      _ is the blackhole register. See :help registers
autocmd FileType python nnoremap gpu :<C-u>new \| setl buftype=nofile \| execute'r!python "#:p" -v' \| 1delete _<CR> G
" Require: Conque   "gpi" to use IPython, "gpo" to use ipdb and debug.
let g:ConqueTerm_CWInsert = 1
autocmd FileType python nnoremap gpi :<C-u>execute 'ConqueTermSplit ipython '.expand('%:p')<CR>
autocmd FileType python nnoremap gpo :<C-u>execute 'ConqueTermSplit ipdb '.expand('%:p')<CR>

" Change colorcolumn not only but all after 81th character.
" http://blog.remora.cx/2013/06/source-in-80-columns.html
" autocmd FileType python execute "setl colorcolumn=" . join(range(81, 9999), ',')

" Defining :make and errorformat.
" See: :help errorformat-multi-line
autocmd FileType python setl makeprg=python\ %
autocmd FileType python setl efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Settings of jedi.vim:
" Do not use auto-configuration. Do it by myself.
" let g:jedi#auto_vim_configuration = 0
" Do not select the first candidate when using autocompletion.
let g:jedi#popup_select_first = 0
" let g:jedi#auto_vim_configuration = 1
" The reason to deactivate jedi#auto_vim_configuration
" au FileType python setlocal completeopt-=preview
"""""""""""""""""""" Python Settings  END  """"""""""""""""""""""""

" Bring searched word to center.
" http://lambdalisue.hatenablog.com/entry/2013/06/23/071344
" I took many preferences from the source above.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Move cursor by display lines. Use <C-n>, <C-p> to move by logical lines.
" added xnoremap: http://www.slideshare.net/cohama/vim-script-vimrc-nagoyavim-1
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
xnoremap j gj
xnoremap k gk
xnoremap <Down> gj
xnoremap <Up>   gk

" Press v twice to select to the end of the line.
vnoremap v $h
" Press Y to yank to the end of the line (see :help Y).
map Y y$

" Shift + arrow to change window size.
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>


" Escape backslash and question marks in search mode.
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" Use * register in normal yank. See :help clipboard-unnamed
set clipboard+=unnamed
" 2013-09-05: could not use unnamed register inside tmux.
" See :help clipboard-autoselect
" set clipboard+=autoselect

" Use visualbell instead of beep sound. If you don't want visualbell either,
" try :set vb t_vb=  (however this hides errors completely).
set visualbell

" Fileencoding detection.
if !(has('gui_macvim') && has('kaoriya'))
    " MacVim-KaoriYa uses gauche_guess to determine fileencoding,
    "  so fileencodings(fencs) is not necessary to be set.
    " Why no euc-jp? Because when I set euc-jp last time, something was wrong.
    set fileencodings=utf-8,cp932
endif
set encoding=utf-8  " Character encoding used inside Vim.
set fileformats=unix,dos,mac  " Default newline char: unix <NL>


" Use marks, registers, buffers, Explore, tab easily.
" Site http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap <Space>m  :<C-u>marks<CR>
nnoremap <Space>r  :<C-u>registers<CR>
nnoremap <Space>b  :<C-u>buffers<CR>:buffer<Space>
nnoremap <Space>w  :<C-u>bw<CR>
nnoremap <Space>e  :<C-u>Explore<CR>
nnoremap <Space>n  :vs<CR><C-W><C-W>:Explore<CR>
nnoremap <Space>t  :<C-u>tabnew<CR>
nnoremap gr        :<C-u>tabprevious<CR>
nnoremap <C-tab>   :<C-u>tabnext<CR>
nnoremap <C-S-tab> :<C-u>tabprevious<CR>


" Search 'tags' file recursively.
" See :help file-searching  for information of ;
" http://vim-users.jp/2010/06/hack154/ http://ctags.sourceforge.net/
" To create tags file, use dirtags_mac.sh. Usage: dirtags_mac.sh dir
if has('path_extra')
    set tags+=tags;
endif

" calendar.vim configuratons.
let g:calendar_diary="$HOME/Dropbox/Notes"
let g:calendar_monday = 1  " Week starts from monday.
" let g:calendar_weeknm = 1  " Show weeknumbers like 'WK01'
command -nargs=1 Calgrep execute "vimgrep ".<q-args>." ".g:calendar_diary."/**"

" Recognize numbers as decimals. Increment: C-a / decrement: C-x
set nrformats = ""

" Use ; as :, : as ;.
noremap ; :
noremap : ;

" indent-guides plugin
" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" showmarks.vim : show marks [a-zA-Z]
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" neocomplcache
" Snippets keymap
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = '~/vimfiles/after/snippets'
nnoremap gne :NeoComplCacheEnable<CR>
nnoremap gnd :NeoComplCacheDisable<CR>
" let g:neocomplcache_enable_auto_select = 1 "select the first item by default.


" Keep selecting after indentation
vnoremap < <gv
vnoremap > >gv

" Fast scroll by letters not by words.
" Maps to normal and visual mode.
" Originally, in normal mode, C-h & C-j are mapped to h & j, respectively,
" C-k is mapped to nop, and C-l to redraw the screen. (see :h normal-index)
" It is obvious that we can map these to 'quick-move' function.
" Use :redr[aw]!<CR> to redraw the screen (see :help :redraw).
map <silent> <C-h> 8h
map <silent> <C-l> 8l
map <silent> <C-j> 8j
map <silent> <C-k> 8k

" Fix scroll size to 8 lines (see :help scroll).
noremap <C-d> 8<C-d>
noremap <C-u> 8<C-u>

" open-browser.vim
nmap <Leader>w <Plug>(openbrowser-open)
vmap <Leader>w <Plug>(openbrowser-open)

" Rename editing file by :Rename filename.ext
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))|w

" autodate.vim: change format to ISO 8601 style.
let autodate_format = "%F"

" Play sound on typing (Mac only: change 'afplay' to a cmd your OS supports)
" Also, change '`' to <CR> (easier to type numbers)
" Used voice file from: http://www14.big.or.jp/~amiami/happy/
command NumSound call NumSoundToggle()
let g:numsound_on = 0
function! NumSoundToggle()
    if g:numsound_on
        for e in range(0, 9)
            execute "iunmap ".e
        endfor
        iunmap `
        let g:numsound_on = 0
        echo "NumSound is off."
    else
        for e in range(0, 9)
            execute "inoremap ".e." <C-o>:silent !afplay ~/Dropbox/dotfiles/vimfiles/numsound/num00".e."_01.wav &<CR>".e
        endfor
        inoremap ` <CR>
        let g:numsound_on = 1
        echo "NumSound is on."
    endif
endfunction

" CTRL-C and Esc are different! use this to match the function.
" I know I should use CTRL-[ instead, but [ is far in JIS keyboard...
inoremap <C-c> <Esc>

" In Windows, default dir is where the .exe file is. So change it.
" NOTE: 'win32' means 'MS-Win 95 & later, 32 or 64 bits'. See: :h feature-list
if has('win32')
    cd $HOME
endif

" Counting letters: match everything, clear highlight. See: :h count-items
" Why not use JpFormat? Because the map <S-j> conflicts with it's mapping.
" -range=% sets default range to the whole document (not current line).
command -range=% Count <line1>,<line2>s/./&/gn | noh

" Set *.pde filetype to arduino. Use with arduino.vim (for syntax highlight).
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

if has('mac')
    command Term silent !open -a Terminal.app .
endif

" statusline: from http://d.hatena.ne.jp/kaniyon/20110219/1298112450
set laststatus=2  " use statusline
set statusline=%y%{GetStatusEx()}%<%F%m%r%=[%l/%L(%p%%)]
function! GetStatusEx()
    let str = ''
    let str = str . '' . &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = '[' . &fileencoding . ':' . str
    else
        let str = '[?fenc:' . str
    endif
    return str
endfunction

" Ctrl-W Ctrl-= to expand window ('+' is difficult to press)
nnoremap <C-w><C-=> <C-w><S-=>

" ISO 8601 date format, and time. See: http://www.w3.org/TR/NOTE-datetime
" Also see: http://vim.wikia.com/wiki/Insert_current_date_or_time
" %F: YYYY-MM-DD, %R: hh:mm, %T: hh:mm:ss, %z: TZD
imap <silent> <C-D><C-D> <C-R>=strftime("%F")<CR>
imap <silent> <C-T><C-T> <C-R>=strftime("%R")<CR>
imap <silent> <C-D><C-T> <C-R>=strftime("%FT%T%z")<CR>

" Set *.md filetype to markdown. Original: modula2
autocmd! BufNewFile,BufRead *.md setlocal ft=markdown

" Make temporary file.
" Original: http://tekkoc.tumblr.com/post/41943190314/vim
command! -nargs=? -complete=filetype Tmp call OpenTmpFile(<q-args>)
function! OpenTmpFile(...)
    if a:1 != ""
        execute 'edit ~/vimfiles/tmp/tmp.'.a:1
    else
        execute 'edit ~/vimfiles/tmp/tmp.txt'
    endif
endfunction

" Lower priority suffixes (when using wildcards)
" http://mba-hack.blogspot.jp/2013/02/vim.html
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Auto fill parenthesis http://mba-hack.blogspot.jp/2013/02/vim.html
inoremap {{ {}<LEFT>
inoremap [[ []<LEFT>
inoremap (( ()<LEFT>
" inoremap "" ""<LEFT>
" inoremap '' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" Move in insert mode
inoremap <C-L> <RIGHT>
inoremap <C-H> <LEFT>

" DiffOrig: See :help DiffOrig, http://d.hatena.ne.jp/thinca/20130426/1366910837
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis


" Mark Config. m: new mark, mn, mp: move between, ml: list {{{
" http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908

" Basic Mapping
nnoremap [Mark] <Nop>
nmap m [Mark]

" Mark current position
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif
nnoremap <silent>[Mark]m :<C-u>call <SID>AutoMarkrement()<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction

" Next/Previous mark
nnoremap [Mark]n ]`
nnoremap [Mark]p [`

" List marks
nnoremap [Mark]l :<C-u>marks<CR>

" " Move to the last position.
" autocmd MyAutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal g`"' | endif
"
" " Initialize marks when buffer is read.
" autocmd MyAutoCmd BufReadPost * delmarks!

" }}}


" {{{ Abbreviations
abbr hgpy hoge piyoa
" }}}

" Python test. Usage: :call PythonTest()
function! PythonTest()
python << EOF
import vim
print 'testing python'
for line in vim.current.range:
    print line
    # vim.command('echo "{0}"'.format(line))
EOF
endfunction

" Use CJK letters in Align.vim. This may be slow. See :help align-xstrlen .
let g:Align_xstrlen=3

" Smart autocomplete in command mode (use UP & DOWN).
cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>

" sudowrite (from "Practical Vim") TIP45
" Improved: http://www.commandlinefu.com/commands/view/1204/save-a-file-you-edited-in-vim-without-the-needed-permissions
" Improved: http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
" Problem: If write somehow fails, changes might be lost because of edit!.
"     This problem will solved by undoing an edit (don't panic and press u).
" TODO: Find a way to show prompt 'Password:' but do not prompt 'hit-enter'.
"       (Now I'm using a quite awkward workaround.)
cmap w!! echo 'Password: ' \| silent execute 'write !sudo tee % > /dev/null' \| :edit!

" Use %% to expand %:h (the directory of the file) (from "Practical Vim" TIP41)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Toggle options
" http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap <Space>ow
\  :<C-u>setlocal wrap!
\ \|     setlocal wrap?<CR>

" Conversational quit: http://blog.supermomonga.com/articles/vim/taiwa.html
function! SelectInteractive(question, candidates) " {{{
  try
    let a:candidates[0] = toupper(a:candidates[0])
    let l:select = 0
    while index(a:candidates, l:select, 0, 1) == -1
      let l:select = input(a:question . ' [' . join(a:candidates, '/') . '] ')
      if l:select == ''
        let l:select = a:candidates[0]
      endif
    endwhile
    return tolower(l:select)
  finally
    redraw!
  endtry
endfunction " }}}
function! BufferWipeoutInteractive() " {{{
  if &modified == 1
    let l:selected = SelectInteractive('Buffer is unsaved. What should I do?', ['n', 'w', 'q'])
    if l:selected == 'w'
      write
      bwipeout
    elseif l:selected == 'q'
      bwipeout!
    endif
  else
    bwipeout
  endif
endfunction " }}}
nnoremap <c-x>k  :call BufferWipeoutInteractive()<cr>

" Use matchit
set matchpairs+=<:>
runtime macros/matchit.vim
let b:match_words = "\begin:\end,\left:\right"

" Commands to easily change the encoding and newline chars of a file.
command! ToUnix  setl fileencoding=utf8  fileformat=unix
command! ToDosJa setl fileencoding=cp932 fileformat=dos
command! ToMac   setl fileencoding=utf8  fileformat=mac
command! ToUnixEucjp  setl fileencoding=eucjp  fileformat=unix

" Change :w to :up (do not overwrite when there is no change).
" Using tyru/vim-altercmd
call altercmd#load()  " This line is necessary to use altercmd in _vimrc.
AlterCommand w up

" Automatically decide to split or vsplit from the aspect ratio of a window.
" See: http://qiita.com/Linda_pp/items/392be95a195067d84fd8
command! -nargs=? -complete=command SmartSplit call <SID>smart_split(<q-args>)
function! s:smart_split(cmd)
    if winwidth(0) > winheight(0) * 2
        vsplit
    else
        split
    endif
    if !empty(a:cmd)
        execute a:cmd
    endif
endfunction
nnoremap <silent><C-w><Space> :<C-u>SmartSplit<CR>

" Convert Markdown to TeX (using Pandoc).
autocmd FileType markdown nnoremap gpy :<C-u>! pandoc -i "%:p" -o "%:p:r.tex"<CR>

" Surround URL with Markdown style. Inspired from:
" http://stackoverflow.com/questions/9985360/vim-plugin-for-adding-external-links
nnoremap <Leader>3 "uciw[<C-r>u]()<Esc>
vnoremap <Leader>3 "uc[<C-r>u]()<Esc>
nnoremap <Leader>4 "uciw[<C-r>u](<Esc>"*pa)<Esc>
vnoremap <Leader>4 "uc[<C-r>u](<Esc>"*pa)<Esc>

" netrw settings:
let g:netrw_sort_by="time"
let g:netrw_sort_direction="reverse"
let g:netrw_sort_options="i"  " Ignore case
let g:netrw_list_hide='.DS_Store,^\.git/$'  " Files and directories to hide

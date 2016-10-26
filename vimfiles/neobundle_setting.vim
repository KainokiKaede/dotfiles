" If installing for the first time, execute the following lines in a shell:
" $ mkdir ~/vimfiles/bundle
" $ git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles


if has('vim_starting')
    set nocompatible
    set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle 'Align'
NeoBundle 'junegunn/vim-easy-align'
" NeoBundle 'YankRing.vim'  " :YRShow<CR> to list yanked registers.
NeoBundle 'sheerun/vim-polyglot'  " A collection of language packs for Vim.
" NeoBundle 'Arduino-syntax-file'  -> vim-polyglot
" NeoBundle 'ViewOutput'
NeoBundle 'desert256.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
" NeoBundle 'tpope/vim-markdown'
" NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'rhysd/clever-f.vim'
" NeoBundle 'cocopon/colorswatch.vim'
" NeoBundle 'add20/vim-conque'
" NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'kaneshin/ctrlp-memolist'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'deton/jasegment.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'     " ai, ii, aI, iI
NeoBundle 'kana/vim-textobj-jabraces'   " aj), aj}, aj], aj>, ajA, ajY, ...
NeoBundle 'sgur/vim-textobj-parameter'  " a, i,
NeoBundle 'mattn/vim-textobj-url'       " au, iu
NeoBundle 'osyo-manga/vim-textobj-multiblock'  " nobind
NeoBundle 'osyo-manga/vim-textobj-multitextobj'  " ab, ib to all braces.
NeoBundle 'bitbucket:ludovicchabant/vim-lawrencium'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" Requires: pip install jedi
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ "autoload" : { "filetypes" : [ "python", "python3", "djangohtml" ] } }
NeoBundleLazy 'scrooloose/syntastic', {
    \ "autoload" : { "filetypes" : [ "python", "python3", "djangohtml" ] } }
" Requires: brew install ctags
NeoBundleLazy 'majutsushi/tagbar', {
  \ "autoload": {
  \   "commands": ["TagbarToggle"],
  \ }}
" Make Vim read Django correctly.
NeoBundle "leafgarland/typescript-vim"
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
" Make Vim manage virtualenv correctly.
NeoBundleLazy "jmcantrell/vim-virtualenv", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'taichouchou2/html5.vim'
" NeoBundle 'othree/html5.vim'  -> vim-polyglot
NeoBundle 'tyru/vim-altercmd'  " This is a fork of: 'kana/vim-altercmd'
NeoBundle 'gist:KainokiKaede/235227ba94c0d2401230', {
       \ 'name': 'markdown-cheat.txt',
       \ 'script_type': 'doc'}
" NeoBundle 'gist:hail2u/747628', {
"        \ 'name': 'markdown-cheat-sheet.jax',
"        \ 'script_type': 'doc'}
if has('mac')
    NeoBundle 'mrtazz/simplenote.vim'
endif
NeoBundle 'glidenote/memolist.vim'
" NeoBundle 'bruno-/netrw'
NeoBundle 'chrisbra/Recover.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundleLazy 'osyo-manga/vim-precious', {
      \ "autoload": {
      \   "filetypes": ["markdown"]
      \ }}
NeoBundleLazy 'kannokanno/previm', {
      \ "autoload": {
      \   "filetypes": ["markdown"]
      \ }}
NeoBundle 'xolox/vim-session', {
            \ 'depends' : 'xolox/vim-misc',
          \ }
if v:version >= 703
    NeoBundle 'LeafCage/yankround.vim'
endif
NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box', {
      \ "autoload": {
      \   "filetypes": ["tex", "plaintex", "context", "latex"]
      \ }}
" NeoBundle 'vim-scripts/grep.vim'
if v:version >= 703
    NeoBundle 'vim-scripts/CSApprox'
endif
" NeoBundle 'SirVer/ultisnips'  " Needs has(python). If use, read quick start.
NeoBundleLazy 'amirh/HTML-AutoCloseTag', {
      \ "autoload": {
      \   "filetypes": ["html", "djangohtml"]
      \ }}
NeoBundleLazy 'gorodinskiy/vim-coloresque', {
      \ "autoload": {
      \   "filetypes": ["html", "djangohtml"]
      \ }}
NeoBundle 'kana/vim-smartword'
" NeoBundle 'cohama/lexima.vim'  " Auto close parenthesis
if v:version >= 704
    NeoBundle 'haya14busa/incsearch.vim'
endif
" if has('mac')
"     NeoBundle 'neilagabriel/vim-geeknote'
" endif
" NeoBundleLazy 'rbtnn/rabbit-ui.vim', {
"       \ "autoload": {
"       \   "filetypes": ["csv", "tsv"]
"       \ }}
" NeoBundleLazy 'rbtnn/rabbit-ui-collection.vim', {
"       \ "autoload": {
"       \   "filetypes": ["csv", "tsv"]
"       \ }}
NeoBundle 'vim-jp/autofmt'  " for Japanese hyphenation
" NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'ntpeters/vim-better-whitespace'
" NeoBundle 'terryma/vim-expand-region'
" NeoBundle 'weynhamz/vim-plugin-minibufexpl'
NeoBundleLazy 'itchyny/vim-cursorword', {
      \ "autoload": {
      \   "filetypes": ["python", "vim"]
      \ }}


call neobundle#end()


" Plugin settings:

if neobundle#tap('vim-polyglot')
    let g:csv_no_conceal = 1
    autocmd BufNewFile,BufReadPre *.tsv let g:csv_delim='	'
    " Markdown
    " let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'python', 'diff', 'cpp']
    function! s:setMarkdownColor()
      hi link htmlItalic LineNr
      hi link htmlBold WarningMsg
      hi link htmlBoldItalic ErrorMsg
    endfunction
    call s:setMarkdownColor()

    " Toggle strong/italic <-> hidden text, in order to memorise them.
    " Use autocmd to set color after colorscheme is loaded (otherwise highlight can be cleared by other scripts).
    autocmd ColorScheme * highlight HiddenText ctermfg=15 ctermbg=15 guifg=White guibg=White
    command Anki call s:toggleHide()
    function! s:toggleHide()
      if exists('b:synhideText')==0
        " hide
        hi link htmlItalic HiddenText
        hi link htmlBold HiddenText
        hi link htmlBoldItalic HiddenText
        let b:synhideText=1
      else
        " Unhide
        call s:setMarkdownColor()
        unlet b:synhideText
      endif
    endfunction
endif
if neobundle#tap('clever-f.vim')
    let g:clever_f_ignore_case=1  " Ignore case
    let g:clever_f_smart_case=1   " Do not ignore when Upper case is searched.
    let g:clever_f_use_migemo=1   " Enable migemo (Japanese) search.
    let g:clever_f_fix_key_direction=1  " Always use f to move right, F to left.
    let g:clever_f_chars_match_any_signs=';'  " f; moves to all signs.
endif
if neobundle#tap('lightline.vim')
    let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'component_function': {
        \   'filename': 'MyFilename',
        \ }
    \ }
    function! MyFilename()
        " If I could get the length of other strings, I would replace the
        " magic number with it.
        if strlen(expand('%:p')) > winwidth(0) - 60
            return expand('%:p')[strlen(expand('%:p')) - winwidth(0) + 60:]
        endif
        return ('' != expand('%:p') ? expand('%:p') : '[No Name]')
    endfunction
endif
if neobundle#tap('vim-textobj-multiblock')
    " Textobject of both ASCII and Japanese braces.
    let g:textobj_multitextobj_textobjects_i = [
    \ "\<Plug>(textobj-multiblock-i)",
    \ "\<Plug>(textobj-jabraces-parens-i)",
    \ "\<Plug>(textobj-jabraces-braces-i)",
    \ "\<Plug>(textobj-jabraces-brackets-i)",
    \ "\<Plug>(textobj-jabraces-angles-i)",
    \ "\<Plug>(textobj-jabraces-double-angles-i)",
    \ "\<Plug>(textobj-jabraces-kakko-i)",
    \ "\<Plug>(textobj-jabraces-double-kakko-i)",
    \ "\<Plug>(textobj-jabraces-yama-kakko-i)",
    \ "\<Plug>(textobj-jabraces-double-yama-kakko-i)",
    \ "\<Plug>(textobj-jabraces-kikkou-kakko-i)",
    \ "\<Plug>(textobj-jabraces-sumi-kakko-i)",
    \]
    let g:textobj_multitextobj_textobjects_a = [
    \ "\<Plug>(textobj-multiblock-a)",
    \ "\<Plug>(textobj-jabraces-parens-a)",
    \ "\<Plug>(textobj-jabraces-braces-a)",
    \ "\<Plug>(textobj-jabraces-brackets-a)",
    \ "\<Plug>(textobj-jabraces-angles-a)",
    \ "\<Plug>(textobj-jabraces-double-angles-a)",
    \ "\<Plug>(textobj-jabraces-kakko-a)",
    \ "\<Plug>(textobj-jabraces-double-kakko-a)",
    \ "\<Plug>(textobj-jabraces-yama-kakko-a)",
    \ "\<Plug>(textobj-jabraces-double-yama-kakko-a)",
    \ "\<Plug>(textobj-jabraces-kikkou-kakko-a)",
    \ "\<Plug>(textobj-jabraces-sumi-kakko-a)",
    \]
    omap ab <Plug>(textobj-multitextobj-a)
    omap ib <Plug>(textobj-multitextobj-i)
    vmap ab <Plug>(textobj-multitextobj-a)
    vmap ib <Plug>(textobj-multitextobj-i)
endif
if neobundle#tap('ctrlp.vim')
    " let g:ctrlp_use_migemo = 1  " cmigemo is required.
    let g:ctrlp_clear_cache_on_exit = 0   " Do not clear cache on exit.
    let g:ctrlp_cmd = 'CtrlPMRU'
    " let g:ctrlp_extensions = ['tag', 'buffertag', 'bookmarkdir']
    let g:ctrlp_mruf_exclude = 'プ'  " Exclude annoying duplications due to handakuten.
    command BufferCtrlP :CtrlPBuffer
endif
if neobundle#tap('ctrlp-memolist')
    let g:ctrlp_extensions = [
      \'memolist',
      \]
    nnoremap <Space>cm :<c-u>CtrlPMemolist<cr>
endif
if neobundle#tap('jedi-vim')
    " Do not use auto-configuration. Do it by myself.
    " let g:jedi#auto_vim_configuration = 0
    " The reason to deactivate jedi#auto_vim_configuration
    " au FileType python setlocal completeopt-=preview
    " Do not select the first candidate when using autocompletion.
    let g:jedi#popup_select_first = 0
    let g:jedi#completions_command = "<C-n>"
    " let g:jedi#show_call_signatures = 0  " avoid placeholder ≡jedi≡ to be left.
    " Following settings are to use jedi.vim with neocomplete.
    " Original: http://dackdive.hateblo.jp/entry/2014/08/13/130000
    autocmd FileType python setlocal omnifunc=jedi#completions
    " let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0

    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif

    let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
endif
if neobundle#tap('tagbar')
    let g:tagbar_type_typescript = {'ctagstype': 'typescript',
        \ 'kinds': ['c:classes', 'n:modules', 'f:functions', 'v:variables', 'm:members',
        \ 'i:interfaces', 'e:enums'] }
    nnoremap <leader>ta :TagbarToggle<CR>
endif
if neobundle#tap('simplenote.vim')
    " SimpleNote Settings
    source ~/vimfiles/simplenote_setting.vim  " Username and password.
    command Simp Simplenote -l
    let g:SimplenoteFiletype = "markdown"
endif
if neobundle#tap('memolist.vim')
    " memolist.vim Settings
    let g:memolist_path = "~/Dropbox/Notes/memolistvim"
    " tags prompt (default 0)
    " let g:memolist_prompt_tags = 1
    " categories prompt (default 0)
    " let g:memolist_prompt_categories = 1
    " open directory
    command MemoOpen silent !open ~/Dropbox/Notes/memolistvim
    " command MemList execute "CtrlP" g:memolist_path
    command MemList CtrlPMemolist
endif
if neobundle#tap('vim-quickhl')
    nmap <Space>h <Plug>(quickhl-manual-this)
    xmap <Space>h <Plug>(quickhl-manual-this)
    nmap <Space>H <Plug>(quickhl-manual-reset)
    xmap <Space>H <Plug>(quickhl-manual-reset)
endif
if neobundle#tap('vim-session')
    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
endif
if neobundle#tap('vim-conque')
    " Require: Conque   "gpi" to use IPython, "gpo" to use ipdb and debug.
    let g:ConqueTerm_CWInsert = 1
    autocmd FileType python nnoremap gpi :<C-u>execute 'ConqueTermSplit ipython '.expand('%:p')<CR>
    autocmd FileType python nnoremap gpo :<C-u>execute 'ConqueTermSplit ipdb '.expand('%:p')<CR>
endif
if neobundle#tap('calendar-vim')
    let g:calendar_diary="$HOME/Dropbox/Notes"
    let g:calendar_monday = 1  " Week starts from monday.
    " let g:calendar_weeknm = 1  " Show weeknumbers like 'WK01'
    command -nargs=1 Calgrep execute "vimgrep /".<q-args>."/j ".g:calendar_diary."/**" | call setqflist(reverse(getqflist())) | crewind
    command -nargs=1 Calgreptag execute "vimgrep /@@@.*".<q-args>."/j ".g:calendar_diary."/**" | call setqflist(reverse(getqflist())) | crewind
endif
if neobundle#tap('vim-indent-guides')
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_color_change_percent = 30
    let g:indent_guides_guide_size = 1
endif
if neobundle#tap('vim-altercmd')
    " Change :w to :up (do not overwrite when there is no change).
    call altercmd#load()  " This line is necessary to use altercmd in _vimrc.
    AlterCommand w up
endif
if neobundle#tap('Align')
    " Use CJK letters in Align.vim. This may be slow. See :help align-xstrlen .
    let g:Align_xstrlen=3
endif
if neobundle#tap('open-browser.vim')
    " open-browser.vim
    nmap <Leader>w <Plug>(openbrowser-open)
    vmap <Leader>w <Plug>(openbrowser-open)
endif
if neobundle#tap('neocomplcache.vim')
    nnoremap gne :NeoComplCacheEnable<CR>
    nnoremap gnd :NeoComplCacheDisable<CR>
    " let g:neocomplcache_enable_auto_select = 1 "select the first item by default.
endif
if neobundle#tap('neosnippet.vim')
    " Snippets keymap
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    let g:neosnippet#snippets_directory = '~/vimfiles/after/snippets'
endif
if neobundle#tap('YankRing.vim')
    function! YRRunAfterMaps()
        " Change Y to y$. See: :h yankring-custom-maps
        nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
    endfunction
endif
if neobundle#tap('yankround.vim')
    let g:yankround_dir = '~/vimfiles/yank'
    nmap p <Plug>(yankround-p)
    xmap p <Plug>(yankround-p)
    nmap P <Plug>(yankround-P)
    nmap gp <Plug>(yankround-gp)
    xmap gp <Plug>(yankround-gp)
    nmap gP <Plug>(yankround-gP)
    nmap <C-n> <Plug>(yankround-next)
    " To use with CtrlP:
    " from: http://leafcage.hateblo.jp/entry/2013/10/31/yankroundvim
    let g:ctrlp_map = ''
    nnoremap <silent><SID>(ctrlp) :<C-u>CtrlPMRU<CR>
    nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"
    " Use CtrlP to show YankRound list:
    nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
endif
if neobundle#tap('LaTeX-Box')
    " Use compl-omni by <C-n>
    inoremap <C-n> <C-x><C-o>
    " Close current environment by ]] (see :h latex-box-mappings-insertion)
    imap ]] <Plug>LatexCloseCurEnv
endif
if neobundle#tap('vim-smartword')
    nmap w   <Plug>(smartword-w)
    nmap b   <Plug>(smartword-b)
    nmap e   <Plug>(smartword-e)
endif
if neobundle#tap('vim-easy-align')
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
    nmap <Leader>a <Plug>(EasyAlign)
endif
if neobundle#tap('vim-commentary')
    " Setting markdown commentstring here will be overwritten by polyglot,
    " so set it in .vimrc .
    " autocmd FileType markdown setl commentstring=<!--%s-->
endif
if neobundle#tap('incsearch.vim')
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
endif
if neobundle#tap('vim-geeknote')
    let g:GeeknoteMaxExplorerWidth=60
    autocmd FileType geeknote setlocal nonumber
endif
if neobundle#tap('previm')
    " Do not use default css (default css is similar to GitHub style):
    " let g:previm_disable_default_css = 1
    " Use user original css:
    " let g:previm_custom_css_path = '/Users/kanno/tmp/some.css'
endif
if neobundle#tap('vim-trailing-whitespace')
  let g:extra_whitespace_ignored_filetypes = ['calendar', 'unite']
endif
if neobundle#tap('vim-better-whitespace')
  " If the buffer is not modifiable, disable highlighting trailing spaces.
  autocmd BufWinEnter * call s:disableWhiteSpaceHighlight()
  function! s:disableWhiteSpaceHighlight()
    if !&modifiable
      DisableWhitespace
    endif
  endfunction
endif
if neobundle#tap('vim-expand-region')
    " Tap v several times to expand selection, and <C-v> to shrink it.
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)
endif
if neobundle#tap('vim-surround')
    autocmd FileType markdown let b:surround_{char2nr("&")} = " *\r* "
    autocmd FileType markdown let b:surround_{char2nr("*")} = " **\r** "
endif



filetype plugin indent on  " Required!

" Installation check.
NeoBundleCheck

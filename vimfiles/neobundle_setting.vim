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

call neobundle#rc(expand('~/vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Align'
NeoBundle 'YankRing.vim'  " :YRShow<CR> to list yanked registers.
NeoBundle 'Arduino-syntax-file'
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
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'deton/jasegment.vim'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-jabraces'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'mattn/vim-textobj-url'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'bitbucket:ludovicchabant/vim-lawrencium'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" Requires: pip install jedi
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ "autoload" : { "filetypes" : [ "python", "python3", "djangohtml" ] } }
NeoBundleLazy 'kevinw/pyflakes-vim', {
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
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'tyru/vim-altercmd'  " This is a fork of: 'kana/vim-altercmd'
NeoBundle 'gist:KainokiKaede/235227ba94c0d2401230', {
       \ 'name': 'markdown-cheat.txt',
       \ 'script_type': 'doc'}
" NeoBundle 'gist:hail2u/747628', {
"        \ 'name': 'markdown-cheat-sheet.jax',
"        \ 'script_type': 'doc'}
NeoBundle 'mrtazz/simplenote.vim'
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

filetype plugin indent on  " Required!

" Plugin settings:

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
    omap ab <Plug>(textobj-multiblock-a)
    omap ib <Plug>(textobj-multiblock-i)
    vmap ab <Plug>(textobj-multiblock-a)
    vmap ib <Plug>(textobj-multiblock-i)
endif
if neobundle#tap('ctrlp.vim')
    " let g:ctrlp_use_migemo = 1  " cmigemo is required.
    let g:ctrlp_clear_cache_on_exit = 0   " Do not clear cache on exit.
    let g:ctrlp_cmd = 'CtrlPMRU'
    let g:ctrlp_extensions = ['tag', 'buffertag', 'bookmarkdir']
endif
if neobundle#tap('jedi-vim')
    " Configure manually
    " let g:jedi#auto_vim_configuration = 0
    " Do not select the first candidate.
    let g:jedi#popup_select_first = 0
    let g:jedi#completions_command = "<C-n>"
    " let g:jedi#show_call_signatures = 0  " avoid placeholder ≡jedi≡ to be left.
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

" Installation check.
NeoBundleCheck

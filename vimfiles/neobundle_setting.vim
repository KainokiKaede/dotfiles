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
NeoBundle 'YankRing.vim'
NeoBundle 'Arduino-syntax-file'
NeoBundle 'ViewOutput'
NeoBundle 'desert256.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'rhysd/clever-f.vim'
" NeoBundle 'cocopon/colorswatch.vim'
" NeoBundle 'add20/vim-conque'
" NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'kien/ctrlp.vim'
let s:hooks = neobundle#get_hooks("ctrlp.vim")
function! s:hooks.on_source(bundle)
    " let g:ctrlp_use_migemo = 1  " cmigemo is required.
    let g:ctrlp_clear_cache_on_exit = 0   " Do not clear cache on exit.
endfunction
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'deton/jasegment.vim'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-jabraces'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'bitbucket:ludovicchabant/vim-lawrencium'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet.vim'
" Requires: pip install jedi
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ "autoload" : { "filetypes" : [ "python", "python3", "djangohtml" ] } }
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " Configure manually
  let g:jedi#auto_vim_configuration = 0
  " Do not select the first candidate.
  let g:jedi#popup_select_first = 0
endfunction
NeoBundleLazy 'kevinw/pyflakes-vim', {
    \ "autoload" : { "filetypes" : [ "python", "python3", "djangohtml" ] } }
" Requires: brew install ctags
NeoBundleLazy 'majutsushi/tagbar', {
  \ "autoload": {
  \   "commands": ["TagbarToggle"],
  \ }}
nnoremap <leader>ta :TagbarToggle<CR>
" Make Vim read Django correctly.
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
" Make Vim manage virtualenv correctly.
NeoBundleLazy "jmcantrell/vim-virtualenv", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}


filetype plugin indent on  " Required!

" Installation check.
NeoBundleCheck

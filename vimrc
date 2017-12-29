" Powerline support
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
:so ~/.vim/plugins.vim
call vundle#end()

filetype plugin on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

" make tab completion for files/buffers act like bash
set wildmenu 

let mapleader=","

" Use copied data putside of vim
set clipboard=unnamed

" faster redrawing
set ttyfast

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" switch syntax highlighting on
syntax on

set encoding=utf8
colorscheme  Tomorrow-night

set number
set number relativenumber
set autoindent " automatically set indent of new line
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2 " show the satus line all the time

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap P "0p
map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc
map <leader>wc :wincmd q<cr>
" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" shortcut to save
nmap <leader>, :w<cr>
" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" map fuzzyfinder (CtrlP) plugin
nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntactic plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Syntastic configuration for PHP
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_exec = 'phpcs'
let g:syntastic_php_phpcs_args = '--standard=psr2 '
let g:syntastic_php_phpcs_args = '---config-set show_warnings 0'
let g:syntastic_php_phpmd_exec = 'phpmd'
let g:syntastic_php_phpmd_post_args = 'codesize,controversial,design'
" Syntastic configuration for JavaScript
let g:syntastic_javascript_checkers = ['jshint']

" Vim-php-cs-fixer settings
let g:php_cs_fixer_rules = "@PSR2"

" phpfmt plugin settings
" A standard type: PEAR, PHPCS, PSR1, PSR2, Squiz and Zend
" https://github.com/beanworks/vim-phpfmt
let g:phpfmt_standard = 'PSR2'

" Line limit settings
highlight ColorColumn ctermbg=magenta "set to whatever you like
call matchadd('ColorColumn', '\%121v', 100) "set column nr


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
inoremap <up> <nop>
vnoremap <up> <nop>
inoremap <down> <nop>
vnoremap <down> <nop>
inoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <left> <nop>
inoremap <right> <nop>


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_php = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" PHP Support
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
set completeopt=longest,menuone
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" php namespace autocomplate
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

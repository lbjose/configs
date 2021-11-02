execute pathogen#infect()

" Starts the indent for code
filetype plugin indent on

" Sets the path to current directory
set path+=**
" Displays all matching files when we do find and tab
set wildmenu

" Sets the fold method to manual, use z-f for fold
" use z-o for opening the fold
" use z-d to delete the fold
set foldmethod=manual

" Opens the c-tag opening to new tab, use ctrl+\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <C-[> :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>

" NERDTree shorcuts
" Ctrl + o -> Opens NERDTree
" Ctrl + c -> Closes NERDTree
" Ctrl + f -> Opens NERDTree to find files
nnoremap <C-o> :NERDTree<CR>
nnoremap <C-c> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Exit Vim if NERDTree is the only window left in a tab.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
" exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif

"colorscheme
"colorscheme vim-monokai-tasty
colorscheme desert

"Column width indicator and color
set colorcolumn=120
hi ColorColumn ctermbg=lightcyan guibg=blue

"Tabnew toggle shortcut
nnoremap <C-j> gT
nnoremap <C-k> gt

"Highlight Search
set hlsearch

":set t_Co=256
"set background=dark
"set termguicolors

autocmd FileType python setlocal completeopt-=preview
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'monokai_tasty',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" autocmd BufWritePre * %s/\s\+$//e
nnoremap <F3> :set nopaste<CR>
nnoremap <F4> :set paste<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=119
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" Put these lines at the very end of your vimrc file.
"
" " Load all plugins now.
" " Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" " Load all of the helptags now, after plugins have been loaded.
" " All messages and errors will be ignored.
silent! helptags ALL

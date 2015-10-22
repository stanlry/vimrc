set nocompatible 
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Bundles {

    Plugin 'gmarik/Vundle.vim'

    Plugin 'scrooloose/nerdtree' 
    Plugin 'tpope/vim-surround' 
    Plugin 'scrooloose/syntastic'

    Plugin 'altercation/vim-colors-solarized'
    Plugin 'sickill/vim-monokai'
    Plugin 'digitaltoad/vim-jade'

    Plugin 'groenewege/vim-less'
    Plugin 'bling/vim-airline'

    Plugin 'mattn/emmet-vim'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    Plugin 'Shougo/neocomplete.vim'
    Plugin 'Raimondi/delimitMate'

" }

call vundle#end()
filetype plugin indent on

" General {
    
    set encoding=utf-8
    set number         " Show line number
    set relativenumber " Show relative number line
    set ruler          " Show curser position
    set hlsearch       " Highlight the search content
    set backspace=2    " Allow using backspace in insert mode
    set noswapfile nobackup   " No swap and backup file
    set nowrap         " Don't wrap lines
    set mouse=a
    set confirm        " Prompt when existing from an unsaved file
    
    " Search
    set ignorecase     " Case insensitive
    set incsearch      " Show matches while typing
    set smartcase
    

    " highlight current line
    au WinLeave * set nocursorline nocursorcolumn
    au WinEnter * set cursorline cursorcolumn
    set cursorline


    syntax on          " Show syntax highlighting

    set laststatus=2   " Always show status line
    set showcmd        " Show command line in the status line
    set title          " Show file in title bar

" }


" Indent Config {

    set autoindent
    set smartindent

" }

" Tab Config {

    set tabstop=4      " Tab equal to 4 white space
    set shiftwidth=4   " Indent width
    set expandtab      " Convert tab into white space
    set smarttab

" }

" GUI Setting {
    
    if has('gui_running')
        set guioptions=notools
        set lines=40
    else
        set t_Co=256
    endif
" }

" Theme config {

    let g:solarized_termcolors=256
    set background=dark
    colo monokai

" }


" ShortCut {

    " NERDTree
    nnoremap<F2> :NERDTreeToggle<CR>

" }
" Ultisnip {

    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }

" NeoComplete {

    " Disable AutoComplPop
    let g:acp_enableAtStartup=0
    " User neocomplete
    let g:neocomplete#enable_at_startup=1
    " User smartcase
    let g:neocomplete#enable_smart_case=1
    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif

" }

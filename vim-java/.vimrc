execute pathogen#infect()

""THESE ARE GENERAL USABILITY SETTINGS""
""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=500

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""""""""""""

"Settings for vim-markdown-preview
"use C-p in a markdown file to preview
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_github=1

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let maplocalleader = ","

"Define commands to copy buffer local path and full path
command! CopyBufferPath let @+ = expand('%')
command! CopyBufferFullpath let @+ = expand('%:p')

"Eclim Specific Settings
filetype plugin indent on

"Java Eclim commands
autocmd FileType java      nnoremap <buffer> <leader>d :JavaDocSearch -x declarations<cr>
autocmd FileType java      nnoremap <buffer> <leader>h :JavaHierarchy<cr>
autocmd FileType java      nnoremap <buffer> <cr> :JavaSearchContext<cr>
autocmd FileType java      nnoremap <buffer> <leader>f :JavaSearch 
autocmd FileType java      nnoremap <buffer> <leader>c :JavaCorrect<cr>
autocmd FileType java      nnoremap <buffer> <leader>v :Validate<cr>

"C/CPP Eclim Commands
autocmd FileType cpp       nnoremap <buffer> <cr> :CSearchContext<cr>
autocmd FileType cpp       nnoremap <buffer> <leader>f :CSearch 
autocmd FileType c         nnoremap <buffer> <cr> :CSearchContext<cr>
autocmd FileType c         nnoremap <buffer> <leader>f :CSearch 

"Java Eclim commands
autocmd FileType py        nnoremap <buffer> <cr> :PythonSearchContext<cr>
autocmd FileType py        nnoremap <buffer> <leader>f :PythonSearch 
autocmd FileType py        nnoremap <buffer> <leader>u :PythonSearch -x references 


"For Comcast Codebase
:set tabstop=4 shiftwidth=4 expandtab

"Eclim + Supertab
let g:SuperTabDefaultCompletionType = 'context'

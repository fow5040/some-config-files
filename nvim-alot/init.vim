call plug#begin('~/.vim/plugged')

" < Other Plugins, if they exist >
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'branch': 'release'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"" Don't forget to run this:
" :CocInstall coc-omnisharp
"Plug 'coc-extensions/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'marlonfan/coc-phpls', { 'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Vanilla vim plugins
Plug 'easymotion/vim-easymotion'
Plug 'solarnz/thrift.vim'
Plug 'jparise/vim-graphql'
Plug 'preservim/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'dhruvasagar/vim-table-mode'  "access with <Leader>tm
" Better highlighting for react
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
" Copilot :o
Plug 'github/copilot.vim'
" :Copilot setup
" :Copilot enable

" FZF stuff
" Default is: <C-p> for files, <C-g or l> for grep
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
" optional for icon support
Plug 'nvim-tree/nvim-web-devicons'

"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
call plug#end()

" --------------------------------------------------------------------------------------------------
" dependencies for non Plug plugins
" -------------------------------------------------------------------------------------------------
" graphql lsp
" yarn global add graphql-language-service-cli

" --------------------------------------------------------------------------------------------------
" fwalsh settings
" -------------------------------------------------------------------------------------------------

let mapleader = "="
syntax on
filetype plugin indent on
" number of characters to indent by
set shiftwidth=4
" No. of characters for Tab key
set tabstop=4
" Set Tab character to expand as spaces
set expandtab
" Change the 'go back' command
nnoremap gb <C-o>

" Make it easy to switch out of terminal mode
" see :help terminal-emulator
tnoremap <Esc> <C-\><C-n>

" Custom map for coc fix
" nmap <leader>cf :<C-u>CocFix<CR>
nmap <leader>cf  <Plug>(coc-fix-current)


" High tech go error handling function
:command InsertComplexGoMonad :normal o if err != nil {<CR>return nil, err<CR>}<CR><ESC>
nmap <leader>ge :<C-u>InsertComplexGoMonad<CR>

command! JSONFormatFile :execute "set filetype=json | %!jq ."

" TSX and JSX highlighting
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" -------------------------------------------------------------------------------------------------
" nerdtree settings
" -------------------------------------------------------------------------------------------------

" Easy (?) nerdtree mapping
nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap <C-i> :NERDTreeFind<CR>

" -------------------------------------------------------------------------------------------------
" syntastic settings
" -------------------------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ml'],'passive_filetypes': [] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=~/Thumbtack/website/config/phpcs/ruleset.xml"
let g:syntastic_php_phpmd_post_args = "~/Thumbtack/website/config/phpmd/ruleset.xml"
let g:syntastic_aggregate_errors = 1


" -------------------------------------------------------------------------------------------------
" easymotion settings
" -------------------------------------------------------------------------------------------------

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" Simpler jump?
nmap <Leader><Leader> <Plug>(easymotion-s)

" -------------------------------------------------------------------------------------------------
" fzf settings
" -------------------------------------------------------------------------------------------------
nnoremap <C-f> <cmd>lua require('fzf-lua').live_grep()<CR>
nnoremap <C-l> <cmd>lua require('fzf-lua').files()<CR>

" -------------------------------------------------------------------------------------------------
" vim-go settings
" -------------------------------------------------------------------------------------------------

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"
" -------------------------------------------------------------------------------------------------
" ocaml stuff
" -------------------------------------------------------------------------------------------------
"

set rtp^="/Users/fwalsh/.opam/default/share/ocp-indent/vim"
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

let g:syntastic_ocaml_checkers = ['merlin']

"  " ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
"  let s:opam_share_dir = system("opam config var share")
"  let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')
"  
"  let s:opam_configuration = {}
"  
"  function! OpamConfOcpIndent()
"    execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
"  endfunction
"  let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')
"  
"  function! OpamConfOcpIndex()
"    execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
"  endfunction
"  let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
"  
"  function! OpamConfMerlin()
"    let l:dir = s:opam_share_dir . "/merlin/vim"
"    execute "set rtp+=" . l:dir
"  endfunction
"  let s:opam_configuration['merlin'] = function('OpamConfMerlin')
"  
"  let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
"  let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
"  let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
"  for tool in s:opam_packages
"    " Respect package order (merlin should be after ocp-index)
"    if count(s:opam_available_tools, tool) > 0
"      call s:opam_configuration[tool]()
"    endif
"  endfor
"  " ## end of OPAM user-setup addition for vim / base ## keep this line
"  " ## added by OPAM user-setup for vim / ocp-indent ## c8e79b0c6318ad398baf1975ad7a9252 ## you can edit, but keep this line
"  if count(s:opam_available_tools,"ocp-indent") == 0
"    source "/Users/fwalsh/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
"  endif
"  " ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

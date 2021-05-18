" TODO 
" This is a list of functionality that is in use in other IDEs that could be
" added to NeoVim config (possibly)
" - (Webstorm/jetbrains) - OSX - cmd+shift+T - Open associated test file
" - (Webstorm/jetbrains) - OSX - Run Prettier or code format on save (write)


call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
" Plug 'vim-syntastic/syntastic'	" ** This causes .scala files to take ages to load **
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'jremmen/vim-ripgrep'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-grepper'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'felippepuhle/coc-graphql', {'do': 'yarn install --frozen-lockfile'}
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'voldikss/vim-floaterm'
" Plug 'jceb/vim-orgmode'
Plug 'jgdavey/tslime.vim'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'wincent/corpus'
Plug 'liuchengxu/space-vim-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'danilo-augusto/vim-afterglow'
call plug#end()

let g:polyglot_disabled = ['scala']

" Formatting
set shiftwidth=2
"set tabstop=1 
" setlocal spell spelllang=en_au

" Misc config
set relativenumber
set number
set encoding=utf-8
filetype plugin on
set cursorline
set colorcolumn=100
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
" set nowrap

" Colors/themes
syntax enable
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme PaperColor
set background=dark
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'allow_bold': 1,
  \       'allow_italic': 1
  \     }
  \   }
  \ }

" Custom syntax settings
autocmd BufNewFile,BufRead *.mjml set syntax=html " MJML

" Key Remappings
inoremap jj <esc>
map <C-n> :NERDTreeToggle<CR>
let mapleader=" "
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <Leader>j <C-w><down> 
nnoremap <Leader>k <C-w><up>
nnoremap <Leader>h <C-w><left>
nnoremap <Leader>l <C-w><right>
nnoremap <Leader>d :bd<cr>
nnoremap <Leader>w :w<cr>
" vim-test (removed)
" nmap <silent> t<C-n> :TestNearest<CR>
" nmap <silent> t<C-f> :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>
" tslime (removed)
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
" coc
nmap gd <Plug>(coc-definition)
nmap gt <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap rs <Plug>(coc-rename)
nmap pp <Plug>(coc-prettier)
map pp :Prettier<CR>
" System clipboard integration
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Plugin configuration
" let g:lightline = {
"       \ 'colorscheme': 'embark',
"       \ }
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
let g:airline_theme='afterglow'
let g:GitGutterEnable = 1
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ctrlp_extensions = ['line']
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_custom_ignore = '.git\|node_modules'
let g:ctrlp_show_hidden = 1
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:NERDTreeWinSize = 50
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" vim-test (removed)
" let test#strategy = 'neovim'
" tslime (removed)
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
" gitgutter
set updatetime=100
" Codi (removed)
" let g:codi#width = 50.0
packloadall
silent! helptags ALL

" Neomake config
" call neomake#configure#automake('w')         " When writing a buffer (no delay).
" call neomake#configure#automake('nw', 100)   " When writing a buffer (no delay), and on normal mode changes (after 750ms).
" call neomake#configure#automake('rw', 100)  " When reading a buffer (after 1s), and when writing (no delay).
" call neomake#configure#automake('nrwi', 100) " Full config: when writing or reading a buffer, and on changes in insert and normal mode (after 1s; no delay when writing).
" let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" let g:ruby_host_prog = '$HOME/.rbenv/versions/2.5.1/bin/neovim-ruby-host'	" Path to Ruby, to avoid rbenv shimming in

" Filetype specific configuration
" Typescript/Javascript
autocmd Filetype typescriptreact setlocal tabstop=2
autocmd Filetype typescriptreact setlocal expandtab

" Coc and extension configuration
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'ngmy/vim-rubocop'
Plug 'chriskempson/base16-vim'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'chr4/nginx.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'jremmen/vim-ripgrep'
Plug 'editorconfig/editorconfig-vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-fireplace'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-grepper'
Plug 'NLKNguyen/papercolor-theme'
Plug 'janko/vim-test'
Plug 'jgdavey/tslime.vim'
Plug 'sheerun/vim-polyglot'
Plug 'srcery-colors/srcery-vim'
call plug#end()

" Formatting
set shiftwidth=2
"set tabstop=1 

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

" Colors/themes
syntax enable
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Disable this so we can have different VIM theme to terminal
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
" colorscheme PaperColor
set background=dark


" **** KEY REMAPPINGS ****
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
" vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" tslime
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Plugin configuration
let g:airline#extensions#tabline#enabled = 1
let g:GitGutterEnable = 1
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDir="$HOME/.ultisnips"
let g:deoplete#enable_at_startup = 1
let g:ctrlp_extensions = ['line']
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_custom_ignore = '.git\|node_modules'
let g:ctrlp_show_hidden = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:NERDTreeWinSize = 50
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" vim-test
let test#strategy = 'neovim'
" tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
" gitgutter
set updatetime=100

" Neomake config
call neomake#configure#automake('w')         " When writing a buffer (no delay).
call neomake#configure#automake('nw', 100)   " When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('rw', 100)  " When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('nrwi', 100) " Full config: when writing or reading a buffer, and on changes in insert and normal mode (after 1s; no delay when writing).
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" let g:ruby_host_prog = '$HOME/.rbenv/versions/2.5.1/bin/neovim-ruby-host'	" Path to Ruby, to avoid rbenv shimming in


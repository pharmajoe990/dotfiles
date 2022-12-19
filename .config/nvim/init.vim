" TODO 
" This is a list of functionality that is in use in other IDEs that could be
" added to NeoVim config (possibly)
" - (Webstorm/jetbrains) -  cmd+shift+T - Open associated test file
" -                      -  Replace CoC with native LSP
" -                      -  Spell checking
" -                      -  Better ripgrep integration and search
" -                      -  vim-sneak
" -                      -  run tests from editor?
" -                      -  Look at some different auto-complete engines
" -                      -  Make config modular, split into files

call plug#begin('~/.vim/plugged')
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'TimUntersberger/neogit'
Plug 'SirVer/ultisnips'
Plug 'jremmen/vim-ripgrep'
Plug 'jgdavey/tslime.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug  'ctrlpvim/ctrlp.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ggandor/lightspeed.nvim'
Plug 'jceb/vim-orgmode'
Plug 'f-person/git-blame.nvim'
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'felippepuhle/coc-graphql', {'do': 'yarn install --frozen-lockfile'}
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
" Colour scheme(s)
Plug 'tjdevries/colorbuddy.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'pappasam/papercolor-theme-slim'
Plug 'sainnhe/sonokai'
Plug 'savq/melange'
Plug 'lalitmee/cobalt2.nvim'
Plug 'tjdevries/gruvbuddy.nvim'
call plug#end()

" Formatting
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
"set tabstop=1 
" setlocal spell spelllang=en_au

" Misc config
" set relativenumber
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

" Colours/themes
syntax enable
" Enable true color
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme duskfox
" lua require('colorbuddy').colorscheme('cobalt2')
" endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
" Custom syntax settings
autocmd BufNewFile,BufRead *.mjml set syntax=html " MJML
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Key Remappings
inoremap jj <esc>
let mapleader=" "
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <Leader>j <C-w><down> 
nnoremap <Leader>k <C-w><up>
nnoremap <Leader>h <C-w><left>
nnoremap <Leader>l <C-w><right>
nnoremap <Leader>d :bd<cr>
nnoremap <Leader>w :w<cr>
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
autocmd FileType json syntax match Comment +\/\/.\+$+
" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" coc - Scala
" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)
" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

" System clipboard integration
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Plugin configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
let g:airline_theme='afterglow'
let g:GitGutterEnable = 1
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
set statusline+=%#warningmsg#
set statusline+=%*
" tslime (removed)
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
" gitgutter
set updatetime=100
packloadall
silent! helptags ALL
" ctrl-p
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_cmd = 'CtrlPMRU'


" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Lualine
lua << END
require'lualine'.setup {
  options = {
    theme = 'auto'
  }
}
END

" Neogit
lua << END
local neogit = require('neogit')

neogit.setup {}
END

" let g:ruby_host_prog = '$HOME/.rbenv/versions/2.5.1/bin/neovim-ruby-host'	" Path to Ruby, to avoid rbenv shimming in

" Filetype specific configuration
" Typescript/Javascript
autocmd Filetype typescriptreact setlocal tabstop=2
autocmd Filetype typescriptreact setlocal expandtab

" Coc and extension configuration
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Don't use system install on MacOS - use local python from ASDF version
" manager
" let g:python_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/usr/bin/python3'
"

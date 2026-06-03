" Plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex', { 'for' : 'tex' }
Plug 'norcalli/nvim-colorizer.lua'

Plug 'neovim/nvim-lspconfig'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'stevearc/conform.nvim'
call plug#end()

" lightline
set laststatus=2
let g:lightline = {
  \ 'colorscheme' : 'customscheme',
  \ }
augroup LightlineColorscheme
  autocmd!
  autocmd ColorScheme * if exists('*lightline#colorscheme') |
      \ call lightline#colorscheme() |
      \ endif
augroup END

" Keybindings
nnoremap <F1> :<c-u>update<cr>
nnoremap <F4> :<c-u>wq!<cr> 
nnoremap <C-\> :<c-u>nohl<CR>

set termguicolors
filetype plugin on
set nocompatible
syntax on
set foldenable
set foldmethod=manual
set list
set listchars=space:·

colorscheme colourscheme

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


set number
set relativenumber
autocmd InsertEnter * :set norelativenumber 
autocmd InsertLeave * :set relativenumber
set tabstop=4 shiftwidth=4 expandtab
set hlsearch

"augroup VimtexConfig
"    autocmd!
""    autocmd FileType tex source "$HOME/.config/nvim/vimtex_config.vim"
"    autocmd FileType tex execute 'source ' .. expand('~/.config/nvim/vimtex_config.vim')
"augroup END
" vimtex
let g:tex_flavor='latex'
"let g:vimtex_view_method = 'open -a /Applications/Skim.app -g'
let g:vimtex_view_method = 'skim'
let g:vimtex_ui_method = {
    \ 'confirm': 'vim',
    \ 'input': 'vim',
    \ 'select': 'vim',
    \ }
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
        \ '-verbose',
        \ '-file-line-error',
        \ '-synctex=1',
        \ '-interaction=nonstopmode',
        \ '-shell-escape',
        \ ]
    \ }
let g:vimtex_quickfix_autoclose_after_keystrokes=1

lua require('setup')
lua require'colorizer'.setup()

" Plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex', { 'for' : 'tex' }
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
autocmd InsertEnter * :set norelativenumber 
autocmd InsertLeave * :set relativenumber
set tabstop=4 shiftwidth=4 expandtab
set hlsearch

augroup VimtexConfig
    autocmd!
    autocmd FileType tex source '$HOME/.comfig/nvim/vimtex_config.vim'
augroup END

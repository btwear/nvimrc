call plug#begin()
" Color theme
Plug 'junegunn/seoul256.vim'
" Floaterm
Plug 'voldikss/vim-floaterm'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Buffer line and footer
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git integration
Plug 'tpope/vim-fugitive'
" CMake integration
Plug 'cdelledonne/vim-cmake'
" Syntax highlight
Plug 'nvim-treesitter/nvim-treesitter'
" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Color
set termguicolors
" seoul256 colorscheme
let g:seoul256_background = 236
color seoul256

" General
" set hidden "Drop buffer without save when buffer close
set nu
set rnu
set cursorline
noremap ; :

" Lerder map
map <Space> <Leader>
noremap <silent><ESC> :nohl<CR>
noremap <Leader>R :source $HOME/.config/nvim/init.vim<CR>
noremap <Leader>bd :bd!<CR>
noremap <Leader>x :bd<CR>
noremap <Leader>w <C-W>
noremap <Leader><Tab> <C-^>

source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/floaterm.vim
lua require('treesitter')

" Disable auto format from vim-go (leave it to codefmt)
let g:go_fmt_autosave = 0

call glaive#Install()
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

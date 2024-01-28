" starts the plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/w0rp/ale'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/itchyny/lightline.vim'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'glepnir/oceanic-material'
Plug 'https://github.com/frabjous/knap'
Plug 'preservim/nerdtree'
call plug#end()

" Line numbering
set relativenumber
set number

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4

" filetype and syntax
set wildmenu
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on

" Colorscheme
set termguicolors
set t_Co=256
set background=dark
let g:oceanic_material_background = 'deep'
"let g:oceanic_material_transparent_background = 1
colorscheme oceanic_material

" linters and lightline
set laststatus=2
set noshowmode
let g:ale_linters = {"py": "flake8"}
let g:lightline = {
			\	'colorscheme':'wombat',
			\	'active':{
			\		'left':[['mode','paste'],['readonly','filename','modified']],
			\		'right':[['lineinfo'],['percent'],['fileformat','fileencoding']]
			\	}
			\}

" Enables persistent undo
if has('persistent_undo') "check if you vim version supports it
	set undofile
	set undodir=$HOME/.vim/undo
	set undolevels=1000
	set undoreload=10000
endif

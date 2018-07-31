""" Ashton Hellwig's Vimrc """
""" Github: ashellwig      """
""" Revised: 09/02/2017    """
"""   Configured to use    """
"""   Base16-Shell (Zsh)   """
"""   + My Essential       """
"""     Plugs            """
""""""""""""""""""""""""""""""

""" --- Required ---
set nocompatible
filetype off

""" --- My Plugs ---
call plug#begin('~/.vim/plugged')
""" Prerequisites """
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
""" Language Specific """
" CPP
Plug 'jalcine/cmake.vim'
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'jason0x43/vim-js-indent', { 'for': ['typescript', 'javascript'] }
" Shell
Plug 'WolfgangMehner/bash-support', { 'for': ['zsh', 'bash', 'sh'] }
Plug 'z0mbix/vim-shfmt', { 'for': ['sh','zsh','bash'] }
Plug 'vim-scripts/awk-support.vim', { 'for': 'awk' }
" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"" General Essentials """
Plug 'tpope/vim-fireplace'
"Plug '/vim-clojure-static'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --system-libclang --all'}
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
""" Look & Feel """
Plug 'scrooloose/NERDTree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
autocmd! User vim-devicons.vim echom 'Devicons loaded!'
Plug 'chriskempson/base16-vim', { 'frozen': 'yes' }
call plug#end()

""" --- Preferences ---
""" Variables """
set autowrite
set encoding=utf-8
set number
set cursorline
set modeline
set omnifunc=omnifunc#syntaxcomplete
""" Colorscheme """
let base16colorspace=256
colorscheme base16-twilight
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

""" --- Plug Settings ---
""" Syntastic """
map <Leader>s :SyntasticToggleMode<CR>
let g:syntastic_always_popuilate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
""" YouCompleteMe Settings """
let g:ycm_autoclose_preview_window_after_completion= 1
let g:ycm_always_populate_location_list = 0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
""" Bash-Support.vim """
let g:BASH_AuthorName = 'Ashton Scott Hellwig'
let g:BASH_Email = 'hellwigashton@gmail.com'
let g:BASH_Company = 'IBM *Contractor*'
""" Vim-Shfmt  """
let g:shfmt_switches = ['-i 0']
""" NERD Commenter """
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
""" Airline """
let g:airline_powerline_fonts = 1
set laststatus=2
set showtabline=2
set ttimeoutlen=10
""" NERD Tree """
let NERDTreeShowHidden = 1


""" --- Functions ----
""" Remaps """
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>
let mapleader="`"
""" 80 Characters/ln Limit """
set colorcolumn=81
highlight ColorColumn ctermbg=Black ctermfg=DarkRed
"""" Highlight Trailing Whitespace """
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

""" Debugging (When Needed) """
"set verbose=9
"set verbosefile=~/vimverbose.txt

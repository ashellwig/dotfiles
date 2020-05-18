""" Ashton Hellwig's Vimrc """
""" Github: ashellwig      """
""" Revised: 26/03/2020    """
"""   Configured to use    """
"""   Base16-Shell (Zsh)   """
"""   + My Essential       """
"""     Plugs            """
""""""""""""""""""""""""""""""

""" --- Required ---
set nocompatible
filetype off


""" --- Install vim-plug --- """
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.vom/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" --- My Plugs ---
call plug#begin('~/.vim/plugged')
"" Prerequisites """
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
""" Language Specific """
" CPP
Plug 'jalcine/cmake.vim'
Plug 'cjuniet/clang-format.vim', { 'for': ['c++', 'cpp', 'c', 'header'] }
Plug 'octol/vim-cpp-enhanced-highlight'
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Typescript
"Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
"Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
" Javascript
Plug 'jason0x43/vim-js-indent', { 'for': ['typescript', 'javascript'] }
" Shell
Plug 'WolfgangMehner/bash-support', { 'for': ['zsh', 'bash', 'sh'] }
Plug 'z0mbix/vim-shfmt', { 'for': ['sh','zsh','bash'] }
Plug 'vim-scripts/awk-support.vim', { 'for': 'awk' }
" Go
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" LaTeX
Plug 'lervag/vimtex'
""" General Essentials """
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ~/.vim/plugged/YouCompleteMe/install.py --all --system-libclang --system-boost' }
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
set clipboard=unnamed
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
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
""" YouCompleteMe Settings """
let g:ycm_autoclose_preview_window_after_completion= 1
let g:ycm_always_populate_location_list = 0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
""" Bash-Support.vim """
let g:BASH_AuthorName = 'Ashton Hellwig'
let g:BASH_Email = 'ashton@ashwigltd.com'
let g:BASH_Company = 'AshWig, Ltd.'
""" Vim-Shfmt  """
let g:shfmt_switches = ['-i2', '-bn', '-ci', '-sr', '-ln', 'bash']
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
" Left
" nnoremap <C-J> <C-W><C-J>
" Right
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
" Arrow Left
nnoremap <ESC>[1;5D <C-W><C-H>
" Arrow Right
nnoremap <ESC>[1;5C <C-W><C-L>
" Arrow Up
nnoremap <ESC>[1;5A <C-W><C-K>
" Arrow Down
nnoremap <ESC>[1;5B <C-W><C-J>
" Toggle TagBar
nmap <F8> :TagbarToggle<CR>
" Toggle NERDTree
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

""" Use Project-Local .vimrc if Available """
if !exists("*LoadProjectVimrc")
  function! LoadProjectVimrc()
    let vimrcFile = findfile(".vimrc, ".;")

    if !empty(vimrcFile)
      execute ":so" l:vimrcFile
      echom l:vimrcFile
    endif
  endfunction
endif
autocmd DirChanged * :call LoadProjectVimrc()

""" Debugging (When Needed) """
"set verbose=9
"set verbosefile=~/vimverbose.txt

" vim: set et ts=2 sw=2 ft=vim:


""" Ashton Hellwig's Vimrc """
""" Github: ashellwig      """
""" Revised: 09/02/2017    """
"""   Configured to use    """
"""   Base16-Shell (Zsh)   """
"""   + My Essential       """
"""     Plugins            """
""""""""""""""""""""""""""""""

""" --- Required ---
set nocompatible
filetype off

""" --- Install Vundle if not Found ---
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  !vim +PluginInstall +PluginUpdate +PluginClean +qall
endif

""" --- My Plugins ---
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""" Disabled (Still Installed) """
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'vim-latex/vim-latex'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'jdonaldson/vaxe'
"Plugin 'kovisoft/slimv'
"Plugin 'guns/vim-clojure-static'
"Plugin 'Shougo/neocomplete'
""" Prerequisites """
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/vimproc.vim'
""" Language Specific """
Plugin 'bitc/vim-hdevtools'
Plugin 'alx741/vim-hindent'
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-fireplace.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'jason0x43/vim-js-indent'
Plugin 'WolfgangMehner/bash-support'
Plugin 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plugin 'vim-scripts/awk-support.vim'
""" General Essentials """
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
""" Look & Feel """
Plugin 'scrooloose/NERDTree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'chriskempson/base16-vim'
call vundle#end()

""" --- Preferences ---
filetype plugin indent on
""" Variables """
set autowrite
set encoding=utf-8
set number
set cursorline
""" Colorscheme """
syntax enable
let base16colorspace=256
colorscheme base16-twilight

""" --- Plugin Settings ---
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
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
""" Bash-Support.vim """
let g:BASH_AuthorName = 'Ashton Scott Hellwig'
let g:BASH_Email = 'hellwigashton@gmail.com'
let g:BASH_Company = 'IBM *Contractor*'
""" Vim-Shfmt  """
let g:shfmt_switches = ['-i 2']
""" NERD Commenter """
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
""" Airline """
let g:airline_powerline_fonts = 1
set laststatus=2
set showtabline=2
set noshowmode
set ttimeoutlen=10

""" --- Misc. Preferences ----
""" Remaps """
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <F8> :TagbarToggle<CR>
let mapleader='`'
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

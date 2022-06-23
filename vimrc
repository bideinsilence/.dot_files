" My personal .vimrc - trying to keep things simple and generally
" available across different systems.

" Vi(Improved)
set nocompatible

" Use filetype detection and file-based automatic indenting
filetype plugin indent on

" Mouse support
set mouse=a

" Encoding
set encoding=utf-8

" Maps system keyboard to Vim's paste buffer
set clipboard=unnamedplus

" Aid in pasting text unmodified from other applications, can be set manually
" as :set paste, :set nopaste
set pastetoggle=<F2>

" Enable sytax processing
syntax on

" I've been learning to use Esc and C-[ (Ctrl-[) to exit normal mode because
" those options are available by default
" I was originally hesitant of Esc because of the need to leave the home row,
" but I'm now getting used to the quick reach up and over
" Also, using ii and jj causes a small pause in the cursor when pressing either
" key as it checks for the double character
" Use 'ii' to leave insert mode - normal mode
"inoremap ii <Esc>

" Use 'jj' to leave insert mode - normal mode
"inoremap jj <Esc>

" Use <Space> for the 'leader' (shortcut) key
let mapleader = " "

" Number of visual spaces per TAB
set tabstop=4

" Number of spaces in TAB when editing
set softtabstop=4

" TABs are spaces
set expandtab

" Number of spaces for reindent operations (<<,>>) and autoindent
set shiftwidth=4

" Number of characters displayed in one line
set textwidth=80

" Disable automactic line wrapping
set nowrap

" Show line number
set number

" Show line number relative to cursor
"set relativenumber

" Display the status bar
set laststatus=2

" Show input mode at botoom
set showmode

" Show the last command entered in bottom right
set showcmd

" Show file stats
set ruler

" Highlight current line
set cursorline

" Highlight current column - visual clue for indentation
set cursorcolumn

" Keep indentation consistent with previous line
set autoindent

" Visual autocomplete for command menu
set wildmenu

" Highlight corresponding brackets
set showmatch

" Highlight match when searching
set hlsearch

" Jump to the result of the first match
set incsearch

" New window splits open below and to the right of current
set splitbelow
set splitright

" Resize split by 5 and 10 rather than default 1
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>< :vertical:resize -10<CR>
noremap <C-w>> :vertical:resize +10<CR>

" --- Window Navigation ---
"
" Map window commands to leader
nnoremap <leader>w <C-w>
" Quicker/easier window movement
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l


" Map visual block mode to leader
nnoremap <leader>v <C-v>


"" --- netrw ---
""
"" Native File explorer settings
"" Nerdtree like setup:
"" - For a similar experience use :Lex, :vertical resize 28
""
"" No banner
"let g:netrw_banner = 0
"" Tree view
"let g:netrw_liststyle = 3
"" Open file with <cr> in previous window
"let g:netrw_browse_split = 4
"" Open vertical splits to the right
"let g:netrw_altv = 1
"" Set view/split size to a portion of the left screen
"let g:netrw_winsize = 28
"" Run on starting vim
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END


" --- Plugins ----
"
" Vim-Plug - A minimalist plugin manager
"
" Automatic installation - Vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Automatic installation - Neovim
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
" Plugins will be downloaded under the specified directory.
" - For Neovim: stdpath('data') . '/plugged'
"   * I'm curently using the same plugin directory for both Vim/Nvim. 
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
"
" -- Declare the list of plugins --
"
" - Make sure you use single quotes
" - Shorthand notation; fetches https://github.com/junegunn/vim-easy-align:
" Plug 'junegunn/vim-easy-align'
" - Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" - Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" -- Tools --
"
" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
" The NERDTree is a file system explorer for the Vim editor.
Plug 'scrooloose/nerdtree'
" Adds icons to your plugins
Plug 'ryanoasis/vim-devicons'
" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'
" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'
" Jinja bundle for vim.
Plug 'lepture/vim-jinja'
"
" -- Themes --
"
" Vim-airline-themes.
Plug 'vim-airline/vim-airline-themes'
" Molokai is a Vim port of the monokai theme for TextMate
Plug 'tomasr/molokai'
" Monokai color scheme for Vim converted with coloration from Textmate theme with the same name.
Plug 'sickill/vim-monokai'
" A dark color scheme for Vim heavily inspired by the look of the Dark+ scheme of Visual Studio Code.
Plug 'tomasiser/vim-code-dark'
" Bad Wolf - A Vim colorscheme pieced together by Steve Losh.
Plug 'sjl/badwolf'
" gruvbox is heavily inspired by badwolf, jellybeans and solarized.
Plug 'morhetz/gruvbox'
" An arctic, north-bluish clean and elegant Vim color theme.
Plug 'arcticicestudio/nord-vim'
" Dark theme for Vim and 160+ apps
Plug 'dracula/vim', { 'as': 'dracula' }
"
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"
" -- Commands --
"
" :PlugInstall will install plugins
" :PlugUpdate will update or install plugins
" :PlugClean will remove unlisted plugins 
" :PlugUgrade will Upgrade vim-plug itself


" --- Colors ---
"
" Load my preferred syntax color scheme at startup.
colorscheme molokai

" Load my preferred vim-airline theme at startup.
let g:airline_theme='codedark'


" --- Plugin Settings ---
"
" Have NERDTree show hidden files by default.
let NERDTreeShowHidden=1
" Toggle NERDTree w/ <leader>N
nnoremap <leader>n :NERDTreeToggle<CR>
"
"

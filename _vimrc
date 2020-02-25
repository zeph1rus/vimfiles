" Don't let polygot do python as there are specific plugins i'm using.
let g:polyglot_disabled = ['python']


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Massive set of syntax highlights etc.
Plug 'sheerun/vim-polyglot'

" Multiple Plug commands can be written in a single line using | separators
Plug 'vim-python/python-syntax'

" Most Recently Used Files
Plug 'vim-scripts/mru.vim'

" On-demand loading
Plug 'scrooloose/nerdtree'

" Python Stuff
Plug 'vim-python/python-syntax'
Plug 'jmcantrell/vim-virtualenv'
Plug 'Vimjas/vim-python-pep8-indent'


" Syntastic Checker
Plug 'scrooloose/syntastic'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git Commit View
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Rainbow Paranthese, obviously
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'tmhedberg/SimpylFold'
Plug 'dracula/vim'
Plug 'baines/vim-colorscheme-thaumaturge'
Plug 'ntpeters/vim-better-whitespace'

Plug 'bling/vim-bufferline'




" Initialize plugin system
call plug#end()


" Screen Bits
"
if !has("gui_running")
	set term=screen-256color
endif

let s:uname = system("uname")
if has('gui_running')
	set background=dark
	colorscheme dracula 	
	if has("win32")
		set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cDEFAULT
	endif
	if s:uname == "Darwin\n"
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
	endif
else
	colorscheme dracula 
endif
set fillchars+=stl:\ ,stlnc:\ 
let g:airline_theme='badwolf'
let g:SimpylFold_docstring_preview=1
let g:python_highlight_all = 1
" Turn on Syntax Highlighting
syntax on
" Set Line Numbers On 
set nu
   
let g:airline_powerline_fonts = 1 
set encoding=utf-8

highlight ExtraWhitespace ctermbg=red
let g:better_whitespace_enabled=1




" Set Default Window Behaviour
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
let g:python_highlight_space_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_aggregate_errors = 1
" Statusline Stuff

"set statusline+=%{FugitiveStatusline()}
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Stop saving files in stupid places
set backupdir=.vimtmp/,~/.vimtmp/,/tmp//
set directory=.vimtmp/,~/.vimtmp/,/tmp//
set undodir=.vimtmp/,~/.vimtmp/,/tmp//

" Key Maps

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Remap Window Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map Ctrl-N to NerdTree
map <C-n> :NERDTreeToggle<CR>

" Toggle Fold with Space
nnoremap <space> za

" AutoCmds
" Rainbow Parantheses
augroup rainbow_files
  autocmd!
  autocmd FileType python,javascript,java RainbowParentheses
augroup END

" Nerdtree Behaviour Stuff
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Rename TMUX Windows
if &term == "screen-256color"
     autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
     autocmd VimLeave * call system("tmux rename-window bash")
endif


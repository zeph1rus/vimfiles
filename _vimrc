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

Plug 'tmhedberg/SimpylFold'
Plug 'baines/vim-colorscheme-thaumaturge'
Plug 'ntpeters/vim-better-whitespace'

Plug 'bling/vim-bufferline'
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-fireplace'

Plug 'hashivim/vim-terraform'
Plug 'pearofducks/ansible-vim'

" My Colorscheme
"
Plug 'zeph1rus/zephstyle-vim'
" Initialize plugin system
call plug#end()


" Screen Bits
"
if !has("gui_running")
	set term=screen-256color
endif

" set default windows behaviour
behave mswin


let s:uname = system("uname")
if has('gui_running')
	set background=dark
	colorscheme zephstyle
	if has("win32")
		set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cDEFAULT
	endif
	if s:uname == "Darwin\n"
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
	endif
else
	colorscheme zephstyle
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

" remove toolbar in gvim
set guioptions-=T

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
" clear search on Double Escp
nnoremap <silent> <Esc><Esc> :noh<CR> :call clearmatches()<CR>

" Remap Window Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map Ctrl-N to NerdTree
map <C-n> :NERDTreeToggle<CR>

" Toggle Fold with Space
nnoremap <space> za

" Windows alike behaviour

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

if has("clipboard")
    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V>		"+gP
    map <S-Insert>		"+gP

    cmap <C-V>		<C-R>+
    cmap <S-Insert>		<C-R>+
endif

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Use CTRL-S for saving, also in Insert mode (<C-O> doesn't work well when
" using completions).
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<Esc>:update<CR>gi

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

if has("gui")
  " CTRL-F is the search dialog
  noremap  <expr> <C-F> has("gui_running") ? ":promptfind\<CR>" : "/"
  inoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-O>:promptfind\<CR>" : "\<C-\>\<C-O>/"
  cnoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-C>:promptfind\<CR>" : "\<C-\>\<C-O>/"

  " CTRL-H is the replace dialog,
  " but in console, it might be backspace, so don't map it there
  nnoremap <expr> <C-H> has("gui_running") ? ":promptrepl\<CR>" : "\<C-H>"
  inoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-O>:promptrepl\<CR>" : "\<C-H>"
  cnoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-C>:promptrepl\<CR>" : "\<C-H>"
endif

" Python 'style' Parameters
au BufNewFile,BufRead *.py,*.cpp,*.c,*.cs,*.h,*.rb,*.ps1,*.psm1,*.tf
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=130 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" smaller tabstops
"
au BufNewFile,BufRead *.js,*.html,*.css,*.yaml,*.json,*.csproj,*.sln,*.xml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Nerdtree Behaviour Stuff
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Rename TMUX Windows
if &term == "screen-256color"
     autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
     autocmd VimLeave * call system("tmux rename-window bash")
endif


nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
		echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
" fix wierd fills on status line. trailing space is deliberate
set fillchars=stl:\ ,vert:\ 

" add command to see diff between saved and buffer
command Diff execute 'w !git diff --no-index % -'


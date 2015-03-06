" Use the Solarized Dark theme
set background=dark

set expandtab

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:··,trail:·,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Launch NERDTree on startup
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror

autocmd VimEnter * wincmd w

" ctrl+p to open file
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/delimitMate
set runtimepath^=~/.vim/bundle/vim-indent-guides
set runtimepath^=~/.vim/bundle/emmet-vim

execute pathogen#infect()


" exclude node_modules and other folders from <Ctrl-P> searches
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|bower_components\db\|git'


imap hh <Plug>snipMateNextOrTrigger

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="hh"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


let g:auto_save_in_insert_mode = 0

" Highlight column 80 and 100
"if exists('+colorcolumn')
"  highlight ColorColumn term=reverse cterm=NONE ctermfg=NONE ctermbg=4 gui=NONE guifg=NONE guibg=DarkBlue
"  set colorcolumn=80,100
"else
""  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

" easier esc in insert mode
inoremap jj <Esc>

" Use the Solarized Dark theme
set background=dark
colorscheme cobalt
" Use 10pt Monaco
set guifont=Monaco:h10
" Better line-height
set linespace=4

" size of a hard tabstop
set tabstop=2

" size of an "indent"
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
set expandtab
set autoindent
let g:js_indent_log = 1
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Shortcuts for Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" use yy for emmet
imap yy <C-y>,

" use kk to add function content
imap kk <ENTER><ENTER><Up><tab>

" Indent guides launched on startup
augroup IndentGuides
    autocmd!
    autocmd VimEnter * IndentGuidesEnable
augroup END

" Css autocomplete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" enable filetype
filetype plugin on
nnoremap <leader>/ <leader>c<space>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>; :nohl<CR><C-l>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" sort lines
nnoremap == vip<Enter>=

" Indent guides size
let g:indent_guides_guide_size = 1
let g:indentLine_color_gui = '#0A4265'
let g:indentLine_color_dark = '#002844'
let g:indentLine_char = '︙'

" Fix indentline bug
if &filetype != 'vimwiki'
    let g:indentLine_noConcealCursor=1
endif

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-;> :nohl<CR><C-l>

" exclude node_modules and other folders from <Ctrl-P> searches
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_working_path_mode = 0

" Toggle NerdeTree
nnoremap <C-e> :NERDTreeToggle<CR>


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/Users/arnauddrizard/.vimundo/


" close buffer without removing splits
nmap <silent> <leader>d :bp\|bd #<CR>

" Powerline Config
" let g:Powerline_symbols = 'fancy'
set guifont=Inconsolata\ for\ Powerline:h13
let g:Powerline_symbols = 'fancy'

source /Users/arnauddrizard/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

" Fix display bug with powerline
:set linespace=0

" move lines with alt-j
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

imap ∆ <Esc>:m .+1<CR>==gi
imap ˚ <Esc>:m .-2<CR>==gi

" remove ~ for empty lines
hi NonText guifg=bg

" auto save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save_no_updatetime = 1
" au BufWrite * :Autoformat

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  exe 'AutoSaveToggle'
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  exe 'AutoSaveToggle'
endfunction


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Remap pasting after deleting elements
nnoremap <leader>p "0p

" Start a macro with space
nnoremap <Space> @q

" Auto swap magic
set title titlestring=

" NerdTree Tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" CQL color highlight
autocmd BufRead *.cql set syntax=cql

" temporarily maximize the current split
nnoremap <C-a> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
    hi NonText guifg=bg
  else
    hi NonText guifg=bg
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Resizes splits
nnoremap <silent> + :exe "res +5"<CR>
nnoremap <silent> _ :exe "res -5"<CR>
nnoremap <silent> } :exe "vertical res +5"<CR>
nnoremap <silent> { :exe "vertical res -5"<CR>

" Create/delete splits
nnoremap \\ :exe "vsp"<CR>
nnoremap ]] :exe "sp"<CR>
nnoremap `` :exe ":q"<CR>

" Go Settings
" format with goimports instead of gofmt

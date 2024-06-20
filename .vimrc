
" Disable compatibility with vi
set nocompatible

" auto changedir when opening file
set autochdir

" Enable filetype detection
filetype on

" Enable plugins for filetypes
filetype plugin on

" enable indents for filetypes
filetype indent on

" auto indent, smart indent, wrap lines in that order:
set ai
set si
set wrap 

" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
"vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" enable syntax highlighting
syntax on

" enable line numbers
set number
set relativenumber
"enable cursor line and column highlight
set cursorline
"set cursorcolumn

" first is newlines, second is self explanitory
set shiftwidth=2
set tabstop=2
"use space instead of tab
set expandtab
"increment search highlight
set incsearch
"case search, like upper case lower case shit
set smartcase
" show search matching during search and highlight
set showmatch
set hlsearch

"command history 1k
set history=1000

" show the mode
set showmode

"auto read updates of file
"set autoread
"au FocusGained,BufEnter * silent! checktime

" mapping a leader allows for more keycombos
"let mapleader = ","

" auto completion menu after tab
set wildmenu

"wildcard completion for files? see :help wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" show current pos info
set ruler

"set laststatus=2

"ignore case when searching
set ignorecase

"don't redraw during macro's etc.
set lazyredraw

" enable regex enginej
"set regexpengine=0

"Configure backspace so it acts as it should act 
"set backspace=eol,start,indent 
"set whichwrap+=<,>,h,l

"plugins config



call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
"  Plug 'prabirshrestha/vim-lsp'
  Plug 'SirVer/ultisnips'
  "Plug 'sheerun/vim-polyglot'
  Plug 'petrbroz/vim-glsl'
  "Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'jayli/vim-easycomplete'
  Plug 'kien/rainbow_parenthesis'
  "Plug 'kien/rainbow_parenth
  Plug 'ap/vim-css-color'
call plug#end()



"nerdtree mappings
"nnoremap <leader>n :NerdTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"nerdtree git settings
"let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

"ultisnip config
"let g:UltiSnipsExpandTrigger="<C-s>"
"let g:UltiSnipsJumpForwardTrigger="<C-b>"
"let g:UltiSnipsJumpBackwardTrigger="<C-z>"
"
"let g:UltiSnipsEditSplit="vertical"

colorscheme gruvbox
set background=dark

"example remaps from primeagen. zz centers screen making these things 'feel'
"better to use
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap zc zczz
nnoremap zo zozz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

"build command, relies on set variable in ftdetect's file folder
nnoremap <C-b> :w <bar> exec g:buildCommand.shellescape('%') <CR>


" for some reason vim polyglot didnt recognize empty files on macos, so
" enabling this line made it so that glsl was recognized
autocmd! BufNewFile,BufRead *.frag set ft=glsl
autocmd! BufNewFile,BufRead *.fsh set ft=glsl


set updatetime=3000
" easy complete settings:
" highlight the symbol when holding the cursor if you need it 
"let g:easycomplete_cursor_word_hl = 1
" using nerdfont is highly recommened
"let g:easycomplete_nerd_font = 1
"goto code nav

"noremap gr :EasyCompleteReference<CR>
"noremap gd :EasyCompleteGotoDefinition<CR> 
"noremap rn :EasyCompleteRename<CR> 
"noremap gb :BackToOrignialBuffer<CR> 


" source the overrides
"
so ~/.vim/overrides

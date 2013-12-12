" Enable filetype pluging
filetype plugin on
filetype plugin indent on


execute pathogen#infect()


" Sets tabstop and shiftwidth
set tabstop=2
set shiftwidth=2
set expandtab
set t_Co=256
colorscheme blacklight

" Turns on syntax highlighting
syntax on

set sw=2 sts=2

" Remember 200 lines
set history=200

" Always show current position
set ruler

" Height of command bar
set cmdheight=2

" Highlight search results
set hlsearch

" Don't redraw while executing macros
set lazyredraw

" Regex
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Tenths of a second to blink when matching brackets
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable


if has("gui_running")
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

set encoding=utf8

" Return to last edit position when opening files
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	exe "normal! g`\"" |
	\ endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

autocmd FileType make setlocal noexpandtab

au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

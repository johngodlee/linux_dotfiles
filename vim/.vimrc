" A full .vimrc for use within normal vim on macos

" Set folding to markers for .vimrc only 
" vim: foldmethod=marker

" vi compatibility
set nocompatible		

" map `A` (append at end of line) to `a` (append in place)
nnoremap a A

" Move by visual lines rather than actual lines with `k` `j`
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Resize splits more conveniently using the leader key
nnoremap <Leader>h <C-W>>
nnoremap <Leader>j <C-W>+
nnoremap <Leader>k <C-W>-
nnoremap <Leader>l <C-W><

" Easier save and quit with `;`
noremap ;w :w<CR>
noremap ;q :q<CR>

" Remap word and space (dw) to delete word (de)
nnoremap dw de
nnoremap de dw

" Fix clipboard to use system clipboard, requires +clipboard support in vim
set clipboard=unnamed
vnoremap y "+y
vnoremap p "+p
nnoremap p "+p
vnoremap d "+d
nnoremap dd "+dd

" General Settings {{{

" Movement and resizing {{{

" Set mouse mode 
set mouse=n

" Don’t reset cursor to start of line when moving around
set nostartofline

" Preserve indentation on wrapped lines
set breakindent

" Normal backspace behaviour on OSX
set backspace=2

" }}}

" Appearance {{{

" enable syntax highlighting
syntax on

" Remove ugly vertlines in split bar (Note space after `\ `)
set fillchars+=vert:\ 

" Make end of file `~` the same colour as background
highlight EndOfBuffer ctermfg=black ctermbg=black

" enable line numbers
set number

" statusline always showing, even when NERDTree is hidden
set laststatus=2

" Add cursorline
set cursorline

" }}}

" Folding {{{

" Make folds with indent
set foldmethod=indent

" Open files with folds open
autocmd BufRead * normal zR

" Show folds in gutter
set foldcolumn=1

" Disable folding in certain filetypes
autocmd Filetype tex setlocal nofoldenable
autocmd Filetype markdown setlocal nofoldenable

" }}}

" Stop creating swp and ~ files
set nobackup
set noswapfile


" Open vim in root
cd ~

" Ignore case of `/` searches unless an upper case letter is used
set ignorecase
set smartcase

" }}}

" Set folding to markers for .vimrc only 
" vim: foldmethod=marker

" vi compatibility
set nocompatible		

" map `A` (append at end of line) to `a` (append in place)
nnoremap a A

" Move by visual lines rather than actual lines with `k` `j`, but preserve
" moving by actual lines with bigger jumps like `6j`
noremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
noremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Resize splits more conveniently using the leader key
nnoremap <Leader>h <C-W>>
nnoremap <Leader>j <C-W>+
nnoremap <Leader>k <C-W>-
nnoremap <Leader>l <C-W><

" Change layout of splits
nnoremap <Leader>] <C-w>H
nnoremap <Leader>[ <C-w>J

" Easier save and quit with `;`
noremap ;w :w<CR>
noremap ;q :q<CR>

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
set autoindent

set tabstop=4
set noexpandtab
set shiftwidth=4

set copyindent
set preserveindent
set softtabstop=0

set textwidth=0

" Normal backspace behaviour
set backspace=2

" Split to right by default
set splitright 

" }}}

" Appearance {{{

" enable syntax highlighting
syntax on

" Remove ugly vertlines in split bar (Note space after `\ `)
set fillchars+=vert:\ 

" Make end of file `~` the same colour as background
highlight EndOfBuffer ctermfg=none ctermbg=none

" enable line numbers, relative except current line
set number relativenumber

" Add cursorline
set cursorline

" Remove background
hi Normal ctermbg=none"

" statusline always showing, even when NERDTree is hidden
set laststatus=2

" Add cursorline
set cursorline

" Ragged right line break
set linebreak
set wrap

" Show most of last line 
set display+=lastline

" Statusline {{{

" statusline always showing
set laststatus=2

" Map of modes and their codes for statusline
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'R',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

" Change statusline colour based on mode 

function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block'))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

function! ChangeStatuslineColor()
  if (mode() ==# 'i')
    exe 'hi StatusLine ctermbg=black ctermfg=032'
  elseif (mode() =~# '\v(v|V)' ||  ModeCurrent() == 'V·Block')
    exe 'hi StatusLine ctermbg=black ctermfg=172'
  else    
    exe 'hi Statusline ctermbg=white ctermfg=black'
  endif
  return ''
endfunction

" Get git branch in statusline
function CurrentGitBranch()
    let gitoutput = system('git status -b '.shellescape(expand('%')).' | head -1 | grep -oE "[^ ]+$" | tr -d "[:cntrl:]"') 
    if gitoutput =~ "fatal"
        let b:gitstatus = ''
    else
        let b:gitstatus = gitoutput 
    endif
endfunc

autocmd BufEnter,BufWritePost * call CurrentGitBranch()

" Statusline
" left side
set statusline=%{ChangeStatuslineColor()}	" Change colour
set statusline+=\ %-8.{ModeCurrent()} 	" Current mode
set statusline+=\ \|\  	" Vert-line and space   
set statusline+=%t	" File name
set statusline+=\ \|\  	" Vert-line and space   
set statusline+=%{b:gitstatus}		" git branch
set statusline+=%=	" Switch to right side

" right side
set statusline+=%m%r " Modified and read only flags
set statusline+=\ 		"Space
set statusline+=%y	" File type
set statusline+=\ \|\ 	" Space, Vert-line and space
set statusline+=%3.p%%	" Percentage through file - min size 3
set statusline+=\ \|\ 	" Vert-line and Space
set statusline+=%8.(%4.l:%-3.c%)	" Line and column number in group
set statusline+=\ 		" Space
" }}}

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

" Set folding for markdown headers
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2" 
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr   

" Set folding function for bibtex entries
function! BibTeXFold()
	if getline(v:lnum) =~ '^@.*$'
		return ">1"
	endif
	return "="
endfunction
au BufEnter *.bib setlocal foldexpr=BibTeXFold()
au BufEnter *.bib setlocal foldmethod=expr

" }}}

" Stop creating swp and ~ files
set nobackup
set noswapfile


" Open vim in root
cd ~

" Automatically cd to directory of current file
set autochdir

" Ignore case of `/` searches unless an upper case letter is used
set ignorecase
set smartcase

" }}}

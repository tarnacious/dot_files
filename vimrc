call pathogen#infect() 

filetype plugin on
syntax on
filetype indent on
colorscheme molokai

set wildmenu 
set hid
set showmatch

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set tabstop=4
set shiftwidth=4
set expandtab
set nu

let mapleader = ","

nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>av ggVG
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap jk <esc>

"Move line by paragraph
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"Tab-style buffer switching
map <C-S-tab> :bprev<CR>
map <C-tab> :bnext<CR>

" setlocal spell spelllang=en_au

let g:slime_target = "screen"


let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

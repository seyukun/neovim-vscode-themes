#!/bin/bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/
cat << EOF > ~/.config/nvim/init.vim
set number
set guifont=DroidSansMono\ Nerd\ Font\ 13
set guifontwide=DroidSansMono\ Nerd\ Font\ 13
set hlsearch
set smartindent
set laststatus=2
set wildmenu
set ruler
set history=1000
set encoding=utf8
syntax enable
" PLUGIN SETTINGS
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
call plug#end()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" NERDTree SETTINGS
nmap <C-f> :NERDTreeToggle<CR>
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap \` \`\`<LEFT>
inoremap <C-s> <ESC>:w<CR>i
nnoremap q :q<CR>
nnoremap w :w<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-RIGHT> <C-w>v<Plug>AirlineSelectPrevTab
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" :coc#refresh()
inoremap <expr> <ENTER> pumvisible() ? coc#_select_confirm() : "\<ENTER>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Airline SETTINGS
let g:airline_powerline_fonts = 1
let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#default#layout = [[ 'a', 'b', 'c' ], ['z']]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
colorscheme codedark

" Esc SETTINGS
inoremap jk <Esc>
" /// Enable Netrw (default file browser)
" filetype plugin on
" /// Netrw SETTINGS
" let g:netwr_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_winsize = 30
" let g:netrw_sizestyle = "H"
" let g:netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
" let g:netrw_preview = 1
"/// SPLIT BORDER SETTINGS
hi VertSplit cterm=none
EOF

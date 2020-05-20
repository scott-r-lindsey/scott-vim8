" ----- cool hacks at the top -------------------------------------------------

" turn off swap file hand-holding
set noswapfile

" disable swap file warnings
:augroup SwapClobber
:au!
:au SwapExists * let v:swapchoice='d'
:augroup END

" Show trailing whitespace; http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:match ExtraWhitespace /\s\+$/

" no startup message
set shortmess+=I

" Json formatting on F3
map <F3> :%!python -m json.tool<CR>

" JS formatting on f4
map <F4> :Prettier<CR>

" Colors 
if (has("termguicolors"))
    set termguicolors
endif

" devicons
set encoding=UTF-8

" allow uppercase w/q
:command W w
:command Q q
:command Wq wq
:command WQ wq

" modern tabs
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2

" always show status line
set laststatus=2

" 256 colors party like 1990
let &t_Co=256

" ----- configure our cool plugins here ---------------------------------------

" enable The NERD Tree
map <F2> :NERDTreeToggle<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onehalfdark'

" vim-jsx-pretty
"let g:vim_jsx_pretty_colorful_config = 1
"let g:vim_jsx_pretty_highlight_close_tag = 1

" colors !
colorscheme atom-dark-256
autocmd BufNewFile,BufRead *.json colorscheme onehalfdark

" json
let g:vim_json_syntax_conceal = 0

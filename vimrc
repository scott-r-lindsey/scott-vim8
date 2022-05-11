" ----- cool hacks at the top -------------------------------------------------

command! ALEIgnoreEslint call AleIgnoreEslint()
function! AleIgnoreEslint()
  " https://stackoverflow.com/questions/54961318/vim-ale-shortcut-to-add-eslint-ignore-hint
  let l:codes = []
  if (!exists('b:ale_highlight_items'))
    echo 'cannot ignore eslint rule without b:ale_highlight_items'
    return
  endif
  for l:item in b:ale_highlight_items
    if (l:item['lnum']==line('.') && l:item['linter_name']=='eslint')
      let l:code = l:item['code']
      call add(l:codes, l:code)
    endif
  endfor
  if len(l:codes)
    exec 'normal O/* eslint-disable-next-line ' . join(l:codes, ', ') . ' */'
  endif
endfunction

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

" insert eslint-ignore automatically
nnoremap <F4> :call AleIgnoreEslint()<CR>

" Toggle ALE SignColumn on F5
nnoremap <F5> :call ToggleSignColumn()<CR>

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
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
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

" no history file plz
let g:netrw_dirhistmax=0

" ale config
let g:ale_linters = {'javascript': ['eslint']}
let b:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1

" Toggle signcolumn.
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=number
        let b:signcolumn_on=1
    endif
endfunction

" supress W11 warning
autocmd FileChangedShell * :

" doge config
filetype plugin on
let g:doge_comment_interactive = 0


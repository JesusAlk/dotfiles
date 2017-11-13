" ============================================
" ============================================
" =======   VIM CONFIGURATION FILE    ========
" ============================================
" =============     jjalk     ================
" ============================================

" Automatic reload of  .vimrc
autocmd! bufwritepost .vimrc source %

" =============================================
" =========== Color scheme   ==================
" =============================================

set encoding=utf-8
set background=light
let g:solarized_termcolors=256
colorscheme solarized
set term=xterm-256color
set modifiable
set noswapfile
"
" ============================================
" ============================================
" =====                                =======
" =====          jedi-vim              =======
" =====                                =======
" ============================================
" ============================================
" let g:jedi#auto_initialization = 0

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on
autocmd FileType python set tabstop=4|set shiftwidth=4|set  softtabstop=4 expandtab
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType coffee set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType c set tabstop=4|set shiftwidth=4|set expandtab
autocmd BufNewFile,BufRead *.ejs set filetype=html

autocmd FileType html set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType htmldjango set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType elm set tabstop=2|set shiftwidth=2|set expandtab

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
autocmd FileType python map <F5> :!tmux send-keys -t git_output "git --no-pager log -n 20 --oneline --graph --decorate" Enter<CR> && tmux send-keys -t git_output "q" Enter<CR> rautocmd FileType python map <F6> :!tmux send-keys -t testing "py.test " % Enter<CR>
autocmd FileType python map <F6> :!tmux send-keys -t testing "py.test " % Enter<CR>
autocmd FileType python map <F8> :!tmux send-keys -t testing "py.test" Enter<CR>
autocmd FileType python map <Leader>1 :call testing#SendFunction()<CR>
autocmd FileType python map <Leader>2 :call testing#SendClass()<CR>
autocmd FileType python map <Leader>3 :call testing#SendMethod()<CR>
autocmd FileType python map <Leader>0 :Coveragepy show<CR>
autocmd FileType python map <Leader>9 :call testing#CoverageCurrentFiles()<CR>
autocmd FileType python map <Leader>e :!tmux send-keys -t testing "next" Enter<CR>
autocmd FileType python map <Leader>w :!tmux send-keys -t testing "continue" Enter<CR>
autocmd FileType python map <Leader>q :!tmux send-keys -t testing "quit" Enter<CR>
autocmd FileType python map <Leader>c :!tmux send-keys -t testing  C-l<CR>

" =============================================
" =========== General config   ================
" =============================================
set number
set nowrap
set fo-=t
set colorcolumn=120
set history=700
set undolevels=700
set tags=tags,tags2
" ============================================
" =======          Paste Mode        =========
" ============================================
" Push f2 key in INSERT mode to activate Paste
" blocks -- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" ============================================
" =========    Mouse and Backspace    ========
" ============================================

set mouse=a " on OSX press ALT and click

" =============================================
" ==========    Remap LEADER KEY    ===========
" ============================================= 
let mapleader = ","

" =============================================
" ==========  Remove Last HIGHLIGHT  ==========
" =============================================
" ( CTRL + n )
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" =============================================
" =============       CtrlP        ============
" =============================================
noremap <Leader>ñ :CtrlP
map <Leader>ñ <esc>:CtrlP<CR>

" =============================================
" =========== Move between windows ============
" =============================================
" ( CTRL + {h,j,k,l} )
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" =============================================
" =========   Move between tabs   =============
" =============================================
map <Leader>m <esc>:bnext<CR>
map <Leader>n <esc>:bprevious<CR>

" =============================================
" =========== correct indention blocks ========
" =============================================
" in V mode (<) or (>) for moving bloc indent
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" =============================================
" =========== Pathogen       ==================
" =============================================
call pathogen#infect()

" =============================================
" =========== vim-Airline      ================
" =============================================
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_solarized_bg='light'
let g:airline_theme = 'solarized'
"let g:airline_detect_whitespace=0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" vim indent html
:let g:html_indent_script1 = "inc"
:let g:html_indent_style1 = "inc"

" =============================================
" ===========   emet vim       ================
" =============================================
let g:user_emmet_leader_key='<C-P>'

" =============================================
" ===========   Syntastic      ================
" =============================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_python_pylint_args="--function-rgx='[a-z_][a-z0-9_]{2,80}$' --method-rgx='[a-z_][a-z0-9_]{2,80}$'"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_warning_symbol="⚠"
let g:syntastic_error_symbol="✗"
let g:syntastic_enable_signs=1


" let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ["python"],'passive_filetypes': [""] }
nnoremap <C-w>e  :SyntasticToggleMode<CR>
noremap <C-w>f :SyntasticCheck<CR>

nnoremap <C-c> :NERDTreeToggle<CR>←
nnoremap <C-t> :TagbarToggle<CR>←
map <leader>r :NERDTreeFind<cr>

" ============================================
" =============== vim-javascript  ============
" ============================================
"
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=0
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" ============================================
" ===============   NMAPS     ================
" ============================================
nmap <silent> <Leader>ef :vsplit<bar>wincmd l<bar>exe "norm!Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr>:set scb<cr>
nmap <silent> <C-_> <Plug>(pydocstring)


"
" ============================================
" =============== FUNCTIONS ================
" ============================================
"
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction

nnoremap <c-]> :call FollowTag()<CR>

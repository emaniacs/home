call plug#begin('~/.vim/plugged')
" gui
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'

"" tools
" Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kurkale6ka/vim-pairs'
Plug 'rhysd/clever-f.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-sensible'
"" this plugin replace c-i
" Plug 'terryma/vim-multiple-cursors'
" Plug 'preservim/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
" Plug 'emaniacs/vim-rest-console'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'vim-test/vim-test'
Plug 'elixir-editors/vim-elixir'
" Plug 'dbeniamine/cheat.sh-vim'
" Plug 'vimwiki/vimwiki'




""" theme
Plug 'haishanh/night-owl.vim'
Plug 'folke/tokyonight.nvim'
Plug 'savq/melange'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['xml']}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'puremourning/vimspector'
" Plug 'neoclide/coc.nvim'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'dbeniamine/cheat.sh-vim'
" Plug 'vim-vdebug/vdebug'
" Plug 'jceb/vim-orgmode'


call plug#end()


" Tab indentions {{{
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" }}}

" Misc SET{{{

set nocompatible
filetype off
set matchpairs+=<:>
set relativenumber

set tags+=.tags

" Auto change dir
set noautochdir

set history=700

set hidden

" Enable line numbers
set number

" Auto indention
set autoindent
set cindent

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildignorecase

" Format multi-line comments, Fold
set comments=sr:/*,mb:*,ex:*/
set formatoptions+=r
set foldmethod=marker
set foldmarker={,}
set nofoldenable
" set foldlevelstart=10
" fix error on backspace
set backspace=eol,indent,start
set list
set listchars=tab:»·,trail:·,extends:>

" show match tag
set showmatch

" show completion with tab on command mode
set wildmenu

set shortmess+=c


" Use hard tabs for make files
autocmd FileType make setlocal noexpandtab
" autocmd FileType netrw noremap c :!cp <C-R><C-F> <C-R><C-F>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
au BufRead,BufNewFile *.md setlocal textwidth=80

" Remember info about open buffers on close
set viminfo^=%

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript source ~/.vim/coc-init.vim
autocmd FileType *.jade setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType php.html nmap <buffer> <Leader>D odie('DIE AT . '. __FILE__ . ':' . __LINE__);<esc>
autocmd FileType php.html nmap <buffer> <Leader>V ovar_dump();<left><left>

command W w !sudo tee % > /dev/null

au BufRead,BufNewFile *.php set ft=php.html
au BufRead,BufNewFile *.tpl set ft=php.html
au BufRead,BufNewFile *.tag set ft=html
au BufRead,BufNewFile *.pug set ft=jade
au BufRead,BufNewFile *.jade set ft=jade

au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

au BufRead,BufNewFile *.jade,*.js,*.jsx setl tabstop=2
au BufRead,BufNewFile *.jade,*.js,*.jsx setl shiftwidth=2
au BufRead,BufNewFile *.jade,*.js,*.jsx setl softtabstop=2
au BufRead,BufNewFile *.jade,*.js,*.jsx setl expandtab

au BufNewFile,BufRead todo.txt,*.task,*.tasks setfiletype task
au BufRead,BufNewFile todo.txt,*.task,*.tasks setl tabstop=2
au BufRead,BufNewFile todo.txt,*.task,*.tasks setl shiftwidth=2
au BufRead,BufNewFile todo.txt,*.task,*.tasks setl softtabstop=2
au BufRead,BufNewFile todo.txt,*.task,*.tasks setl expandtab

" backup and swap file
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/backup//
set undodir=~/.vim/tmp/undo//
set noswapfile

au FileType python,jade,html,lua,vim,elm setl foldmethod=indent

" }}}


" Gui, color {{{
" Syntax highlighting
syntax on

" set guifont=Ubuntu\ Mono\ 11
set guifont=Monoid
set encoding=utf8
set ffs=unix,dos,mac

set lazyredraw

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set t_Co=256

" set cursorline
" hi CursorLine guibg=Grey40
set laststatus=2
" }}}

" YankRing {{{
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim/tmp/yank'
endif
" }}}
"
"Ale {{{
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_warning = 'ǃ'
let g:ale_sign_error = '×'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"}}}

" clever-f {{{
let g:clever_f_across_no_line = 0
" }}}

" Another shortcut {{{
" Remap VIM 0 to first non-blank character
map 0 ^

nnoremap j gj
nnoremap k gk


" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

imap <S-Up> <ESC>:winc +<cr><esc>i
map <S-Up> :winc +<cr>
imap <S-Down> <ESC>:winc -<cr><esc>i
map <S-Down> :winc -<cr>
imap <S-Right> <ESC>:winc ><cr><esc>i
map <S-Right> :winc ><cr>
imap <S-Left> <ESC>:winc <<cr><esc>i
map <S-Left> :winc <<cr>

map <T-Left> <C-w><Left>
map <T-Right> <C-w><Right>
map <T-Up> <C-w><Up>
map <T-Down> <C-w><Down>
map <T-q> <C-w>q

" copy to clipboard
map <A-x> "+x
imap <A-x> <ESC>"+xi
map <A-v> "+gP
imap <A-v> <ESC>"+gPi
map <A-c> "+y
imap <A-c> <ESC>"+yi

nnoremap ; :
" nnoremap : ;
nnoremap \ ,

" search and centering the page
" from mastering vim
nnoremap n nzz
nnoremap N Nzz

"}}}

" Leader shorcut {{{
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

nmap <leader>w :up<cr>
map <leader>d :bdelete<cr>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>m :b#<cr>
map <leader>l :ls<cr>
map <leader>q :wq!<cr>
map <leader>, <c-w>w
map <leader>G :tab G<cr>
map <leader>ga :Git add %<cr>
map <leader>gc :Git commit -m ''<left>
map <leader>gb :Git checkout 
map <leader>gd :Git checkout develop<cr>
map <leader>gl :Gclog %<cr>
map <leader>gl :Gclog %<cr>
map <leader>gp :!git pull origin $(git branch --show-current)<cr>
map <leader>gP :!git push origin $(git branch --show-current)<cr>


nmap <silent> <leader><cr> :set hlsearch!<cr>
nmap <leader>cd :lcd %:h<cr>
nmap <leader>cg :lcd <c-r>=system('git rev-parse --show-toplevel')<cr><cr>
nmap <leader>cc :!mkdir -p %:p:h<cr>

" http://www.reddit.com/r/vim/comments/2p6jqr/quick_replace_useful_refactoring_and_editing_tool/cmttvv2
nnoremap <leader>r :.,$s/\<<C-r>=expand('<cword>')<CR>\>//gc<Left><Left><Left>
nnoremap <leader>F :echo expand('%:p')<cr>

noremap <leader>jj :FZF<cr>
noremap <leader>jf :Files<cr>
noremap <leader>jb :Buffers<cr>
noremap <leader>jt :Tags 
noremap <leader>jg :GitFiles<cr>
noremap <leader>jh :History<cr>

noremap <leader>C :!cp -v <C-r><C-f> <C-r><C-f>

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

noremap gn :GitGutterNextHunk<cr>
noremap gN :GitGutterPrevHunk<cr>
noremap gp :GitGutterPreviewHunk<cr>

" edit file in the current line event their dont exists
" https://youtu.be/434tljD-5C8?t=704
noremap gf :edit <cfile><cr>

" }}}

"
" Interestingword {{{
" disabled default mapping
" Because i just need to show interesting word
let g:interestingWordsDefaultMappings = 1
nnoremap <Insert> <Plug>InterestingWords
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
vnoremap <silent> <leader>k :call InterestingWords('v')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
"}}}

" force backup
set backup
set writebackup

let g:go_autodetect_gopath = 0

let g:jsx_ext_required = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'jade' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

" {{{ Easy align
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
"
" {{{ vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}

let g:interestingWordsRandomiseColors = 1
set grepprg=rg\ --vimgrep

let g:ale_fixers = {
            \ 'python': ['autopep8'],
            \ 'javascript': ['eslint'],
            \ 'go': ['gofmt'],
            \ 'elm': ['elm-format'],
            \ 'json': ['prettier'],
            \ 'php': ['phpcbf'],
            \ 'sh': ['shfmt'],
            \}
let g:ale_linters = {
            \ 'python': ['flake8'],
            \ 'go': ['gofmt', 'golint', 'go build'],
            \ 'javascript': ['eslint'],
            \ 'elm': ['elm-make'],
            \ 'erlang': ['erlc'],
            \ 'rust': ['rustc'],
            \}

" let g:ale_php_phpcbf_executable = $HOME.'/.support/phpcbf-helper.sh'
" let g:ale_php_phpcbf_use_global = 1
let g:ale_php_phpcbf_options = '--standard=PSR2 -n'

let g:ale_php_phpmd_executable = 'vendor/bin/phpmd'
let g:ale_php_phpmd_ruleset = "phpmd.xml"
let g:ale_php_phpcs_executable = 'vendor/bin/phpcs'
let g:ale_php_phpcs_options = ''
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_php_phpcs_use_global = 0
let g:ale_php_phpstan_configuration = 'phpstan.neon'
let g:ale_php_phpstan_executable = 'vendor/bin/phpstan'
let g:ale_php_phpstan_level = 1
let g:ale_virtualenv_dir_names = ['.virtualenv', '.virtualenvosx', 'virtualenv']
let g:ale_lint_on_text_changed = 'normal'
" disable loclist and quickfix
" sometimes we need to check manually result of vim-test
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
" let g:ale_fix_on_save = 1
"
nmap <silent> <leader>E <Plug>(ale_previous_wrap)
nmap <silent> <leader>e <Plug>(ale_next_wrap)
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> gr <Plug>(ale_find_references)
nmap <silent> gh <Plug>(ale_hover)

" set omnifunc=ale#completion#OmniFunc
" set omnifunc=ale#completion#OmniFunc
" let g:ale_hover_to_floating_preview = 1
" let g:ale_floating_preview = 1
" let g:ale_set_balloons = 1
" let g:ale_completion_enabled = 1

noremap <leader>F :ALEFix<cr>
nnoremap <leader>S :vert term<cr>
" tnoremap <silent> <A-d> <C-\><C-n>:bdel!<CR>
tnoremap <silent> <A-d> <C-w>:bdel!<CR>

command! -complete=file -nargs=* GLens :echo system('gitlens '. <q-args>)
function! GitLens()
    let linenumber = line(".")
    " echo @% . ":" . linenumber
    execute ":GLens % " . linenumber
endfunction
nmap <F7> :call GitLens()<CR>


command! -nargs=* VT :vsplit | terminal <args>

nmap <F8> :TagbarToggle<CR>

" tree view by default
let g:netrw_liststyle = 3
let g:netrw_keepdir=0

vnoremap <C-C> :w !xsel -i -b<CR><CR>
" noremap <C-V> :r !xsel -o -b<CR><CR>
" copy file

" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <silent> <leader>R :Rg <C-R><C-W><CR>
" nnoremap <silent> <Leader>ag :Rg <C-R><C-W><CR>

let g:git_messenger_close_on_cursor_moved = v:false

let test#strategy = "dispatch"
let test#php#phpunit#options = {
            \ 'file':    '--testdox',
\}
" let test#strategy = "vimproc"
" let test#strategy = "vimterminal"
" vimterminal
noremap <leader>T :TestNearest --verbose<cr>
noremap <leader>tf :TestFile --verbose<cr>
noremap <leader>tl :TestLast --verbose<cr>
noremap <leader>tv :TestVisit --verbose<cr>
noremap <leader>tS :TestSuite --verbose<cr>
noremap <leader>tq :cclose<cr>
noremap <leader><space>c :cclose<cr>
noremap <leader>Q :qa!<cr>

set termguicolors     " enable true colors support
colorscheme night-owl

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" function! GitStatus()
    " let branch = fugitive#statusline()
    " return printf('%s', branch)
    " let branch = ''
    " let branch = substitute(system("git branch --show-current"), "\n", " ", "g")
    " if strlen(branch) == 0 then
    "     return ""
    " endif
    " Show gitgutter at statusline instead of column
    " let [a,m,r] = GitGutterGetHunkSummary()
    " return printf('[%s | +%d ~%d -%d]', branch, a, m, r)
" endfunction

" set statusline=%<%n\ %f\ %h%m%r%=%-14.(%l,%c%V%)
" set statusline+=%{fugitive#statusline()}
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
" set statusline=%<%n\ %f\ %h%m%r%=%-14.(%l,%c%V%)%{LinterStatus()}\ %{fugitive#statusline()}
set statusline=%<%n\ %f\ %h%m%r%=%-14.(%l,%c%V%)%{LinterStatus()}\ %{GitBranch()}
" set statusline+=%{LinterStatus()}
" default the statusline when entering Vim
hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15
hi statuslinenc guibg=#474747 ctermfg=8 guifg=black ctermbg=15
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

let g:CheatSheetFrameworks = {
            \ 'python' : ['python', 'django', 'flask'],
            \ 'javascript' : ['javascript', 'node', 'react'],
            \ 'php' : ['php', 'laravel'],
            \ 'php.html' : ['php'],
            \}

" rebuild ctags
noremap <leader>c :Dispatch ctags -R .<cr>
noremap <leader>v :Dispatch ./vendor/bin/phpmd % text phpmd.xml<cr>

" vim:foldmethod=marker

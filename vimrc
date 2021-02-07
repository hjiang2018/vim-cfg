set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle CONFIGS: {{{1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'

	" TagBar plugin
	Plugin 'majutsushi/tagbar' " Tag Bar"

	" NerdTree plugin
	Plugin 'scrooloose/nerdtree'

	" Asynchronous Lint Engine
	Plugin 'w0rp/ale'

	" YouCompleteMe
	"Plugin 'https://gitee.com/whbe/YouCompleteMe.git'
	Plugin 'Valloric/YouCompleteMe.git'

	" Un-Impaired
	Plugin 'tpope/vim-unimpaired'

	" ack-grep
	Plugin 'mileszs/ack.vim'

	" gutentags
	Plugin 'ludovicchabant/vim-gutentags'

	" Easy Motion
	Plugin 'easymotion/vim-easymotion'

	" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" GENERAL SETTINGS: {{{1
syntax enable
syntax on
" color ron
color mycolor

	set   autoindent
	set   autoread
	set   autowrite
	set   background=dark
	set   backspace=indent,eol,start
	set nobackup
	set   cindent
	set   cinoptions=:0
	"set   clipboard=unnamed,unnamedplus
	set   clipboard=unnamed
	set   cursorline
	set   completeopt=longest,menuone
	set noexpandtab
	set   fileencodings=utf-8,gb2312,gbk,gb18030
	set   fileformat=unix
	set   foldcolumn=1
	set   foldenable
	"set   foldmethod=marker
	set   foldmethod=indent
	set   guioptions-=T
	set   guioptions-=m
	set   guioptions-=r
	set   guioptions-=l
	set   helpheight=10
	set   helplang=cn
	set   hidden
	set   history=100
	set   hlsearch
	set   ignorecase
	set   incsearch
	set   laststatus=2
	set   mouse=a
	set   number
	set   pumheight=10
	set   ruler
	set   scrolloff=5
	set   shiftwidth=4
	set   showcmd
	"set   smartindent "we already have cindent
	set   smartcase
	set noswapfile
	set   tabstop=4
	"let   &termencoding = &encoding
	set   encoding=utf-8
	"set   termencoding=utf-8
	set   termencoding=utf-8
	set   textwidth=80
	set   whichwrap=h,l
	set   wildignore=*.bak,*.o,*.e,*~
	set   wildmenu
	set   wildmode=list:longest,full
	set nowrap

" AUTO COMMANDS: {{{1
	"autocmd FileType c,cpp set expandtab
	autocmd FileType py set expandtab
	autocmd BufRead * normal zR

" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

" SHORTCUT SETTINGS: {{{1
" Set mapleader
let mapleader=","
" Space to command mode.
	nnoremap <space> :
	vnoremap <space> :
" Switching between buffers
	nnoremap <C-h> <C-W>h
	nnoremap <C-j> <C-W>j
	nnoremap <C-k> <C-W>k
	nnoremap <C-l> <C-W>l
	inoremap <C-h> <ESC><C-W>h
	inoremap <C-j> <ESC><C-W>j
	inoremap <C-k> <ESC><C-W>k
	inoremap <C-l> <ESC><C-W>l
" "cd" to change to open directory.
	let OpenDir=system("pwd")
	nmap <silent> <leader>cd :exe 'cd ' . OpenDir<cr>:pwd<cr>

" PLUGIN SETTINGS: {{{1
" tagbar.vim
	let g:tagbar_width=25
	let g:tagbar_position='left'
	"autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()
" NERDTree.vim
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	let g:NERDTreeWinPos="right"
	let g:NERDTreeWinSize=25
	let g:NERDTreeAutoCenter=1
	let g:NERDTreeShowBookmarks=1
	let g:NERDTreeShowLineNumber=1
	let g:NERDTreeQuitOnOpen=1
" ale
	let g:ale_sign_column_always = 1
	let g:ale_sign_error = '✗'
	let g:ale_sign_warning = 'w'
	let g:ale_set_highlights = 0
	let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
	let g:ale_echo_msg_format = '[%linter%] %code: %%s'
	let g:ale_lint_on_text_changed = 'normal'
	let g:ale_lint_on_insert_leave = 1
	let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
	let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
	let g:ale_c_cppcheck_options = ''
	let g:ale_cpp_cppcheck_options = ''
"show alert only on save
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_lint_on_enter = 0
"specify linters
	let g:ale_linters = {
	\   'c++': ['clang'],
	\   'c': ['gcc'],
	\   'python': ['pylint'],
	\}
" cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
":set cscopequickfix=s-,c-,d-,i-,t-,e-
" ycm
	let g:ycm_server_python_interpreter='/usr/bin/python3'
	let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
	let g:ycm_collect_identifiers_from_tag_files=1
" gutentags: auto update tags
	let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
	let g:gutentags_ctags_extra_args  = ['--fields=+niazS', '--extra=+q']
	let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" plugin shortcuts
	function! RunShell(Msg, Shell)
		echo a:Msg . '...'
		call system(a:Shell)
		echon 'done'
	endfunction
	nmap  <F2> :TagbarToggle<CR>
	nmap  <F3> :NERDTreeToggle<CR>
	"nmap  <F4> :MRU<cr>
	"nmap  <F5> <Plug>LookupFile<cr>
	nmap  <F6> :ALEToggle<CR>
	nmap  <F9> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
	nmap <F10> :call HLUDSync()<cr>
	"nmap <F11> :call RunShell("Generate filename tags", "~/.vim/shell/genfiletags.sh")<cr>
	nmap <F12> :call RunShell("Generate cscope", "cscope -Rbq")<cr>:cs add cscope.out<cr>
	nmap <leader>sa :cs add cscope.out<cr>
	nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
	nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
	nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
	nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
	nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
	nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
	nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
	nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
	nmap <leader>zz <C-w>o
	nmap <leader>gs :GetScripts<cr>

set tags+=/usr/include/tags
set tags+=./tags

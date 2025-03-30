imap jj <esc>
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'itchyny/vim-cursorword'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'skywind3000/asyncrun.vim'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'
Plug 'rosenfeld/conque-term'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/matchit.zip'
Plug 'sirver/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'skywind3000/vim-terminal-help'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
Plug 'skywind3000/vim-preview'
Plug 'skywind3000/vim-gutentags' 
Plug 'skywind3000/gutentags_plus'
" Leaderf-snippet
Plug 'Yggdroot/LeaderF'
Plug 'skywind3000/Leaderf-snippet'

call plug#end()


let mapleader=" "
map <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>L <Plug>(easymotion-overwin-line)
map <Leader>w <Plug>(easymotion-overwin-w)
map <Leader>e <Plug>(easymotion-bd-e)
map <leader>n :NERDTreeToggle<CR>  " 按 <Leader>t 切换 NERDTree 窗口
let NERDTreeShowHidden=1  " 显示隐藏文件
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
nmap <silent> <Leader>t :TagbarToggle<CR>  
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0  " 设置标签不排序，默认排序
let g:ctrlp_map = '<C-p>'
let g:ag_working_path_mode="r"
nnoremap <C-f> :Ag<space>
set mouse=a
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>h <C-w>h
map <Leader>l <C-w>l


autocmd FileType nerdtree nnoremap <buffer> <Leader>j <C-w>j
autocmd FileType nerdtree nnoremap <buffer> <Leader>k <C-w>k
autocmd FileType nerdtree nnoremap <buffer> <Leader>h <C-w>h
autocmd FileType nerdtree nnoremap <buffer> <Leader>l <C-w>l

autocmd FileType tagbar map <buffer> <Leader>j <C-w>j
autocmd FileType tagbar map <buffer> <Leader>k <C-w>k
autocmd FileType tagbar map <buffer> <Leader>h <C-w>h
autocmd FileType tagbar map <buffer> <Leader>l <C-w>l

syntax on
filetype on

set number
set autoread
set noeb

" tab, search,indent settings
set tabstop=2
set softtabstop=2
set shiftwidth=2

set expandtab
set smarttab
autocmd BufRead,BufNewFile make,makefile,Makefile set noexpandtab

set showmatch
set hlsearch
set incsearch

set autoindent
set smartindent
set cindent
" auto completement
autocmd BufRead,BufNewFile *.v iabbrev alw always @(posedge clk or negedge rstn) begin<Enter>  if(!rstn) begin<Enter>end<Enter>else begin<Enter>end<Enter>end<Esc>:call search('!cursor!','b')<CR>cf!  

"autopop
set cpt=.,k,w,b
set completeopt=menu,menuone,noselect
set shortmess+=c
let g:apc_enable_ft = {'*':1}

"PreviewTag
nnoremap <Leader>p :PreviewTag<CR>

"rt_format
" By default, it will be triggered by `ENTER` in insert mode.
" " set this to 1 to use `CTRL+ENTER` instead, and keep the  
" " default `ENTER` behavior unchanged.
let g:rtf_ctrl_enter = 0
" " Enable formatting when leaving insert mode
let g:rtf_on_insert_leave = 1

"format
nnoremap <Leader>F :RTFormatEnable<CR>


let g:terminal_key = '<c-j>'
"g_cscope
"" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" " change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1



" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
"  
"  " 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
"   
"   " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
"   " 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
   endif
"       
"       " 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:Lf_RootMarkers = ['.git', '.svn', '.project', '.root']
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_GtagsAutoUpdate = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" } 
let g:Lf_WindowHeight = 0.3
let g:Lf_HideHelp = 1
let g:Lf_ShowRelativePath = 1

nnoremap <Leader>o <C-o>
nnoremap <Leader>i <C-i>

" 按 <Leader>q 切换 Quickfix（打开/关闭）
nnoremap <silent> <Leader>Q :call ToggleQuickfix()<CR>

function! ToggleQuickfix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen  " 如果 Quickfix 未打开，则打开
    else
        cclose " 如果已打开，则关闭
    endif
endfunction

nnoremap <Leader>q :wq<CR>

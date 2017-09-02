" Environment {

" Identify platform {
silent function! OSX()
return has('macunix')
        endfunction
        silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction
" }

" Basics {
set nocompatible        " Must be first line
if !WINDOWS()
    set shell=/bin/sh
endif
" }

" Windows Compatible {
" On Windows, also use '.nvim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if WINDOWS()
    set runtimepath=$HOME/.nvim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.nvim/after
endif
" }

" Arrow Key Fix {
" https://github.com/spf13/spf13-vim/issues/780
"if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
"inoremap <silent> <C-[>OC <RIGHT>
"endif
" }

" }


if LINUX()
    set backspace=2
    set mouse=a
    runtime! debian.nvim
    if filereadable("/etc/vim/vimrc")
        source /etc/vim/vimrc
    endif
endif


set nocompatible              " be iMproved, required
filetype off                  " required
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.nvim/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
"Plug 'frankier/neovim-colors-solarized-truecolor-only'
"Plug 'spf13/vim-colors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rhysd/conflict-marker.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
Plug 'myhere/vim-nodejs-complete'
"Plug 'scrooloose/syntastic',{'for': ['php']}
Plug 'w0rp/ale',{'for': ['php', 'go']}
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'honza/vim-snippets'
Plug 'beyondwords/vim-twig'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'
Plug 'kchmck/vim-coffee-script'
Plug 'hail2u/vim-css3-syntax'
"Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'digitaltoad/vim-pug'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'

Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'

Plug 'osyo-manga/vim-over'

Plug 'mhinz/vim-signify'

Plug 'jelera/vim-javascript-syntax'

Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'roxma/nvim-completion-manager'
"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
"Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/echodoc.vim'

Plug 'vim-scripts/php_localvarcheck.vim'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'arnaud-lb/vim-php-namespace'

Plug 'mxw/vim-jsx'

Plug 'tpope/vim-abolish'

Plug 'jlanzarotta/bufexplorer'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

Plug 'mileszs/ack.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'SirVer/ultisnips'

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'posva/vim-vue'

Plug 'tpope/vim-dispatch'

Plug 'KabbAmine/zeavim.vim'

Plug 'Shougo/vimshell.vim'

Plug 'StanAngeloff/php.vim'

Plug '2072/PHP-Indenting-for-VIm'

Plug 'itchyny/vim-cursorword'

" { Typescript Plugin

Plug 'steelsojka/deoplete-flow', {'for': ['javascript', 'jsx']}

Plug 'flowtype/vim-flow',{'for': ['javascript', 'jsx']}

Plug 'mhartington/nvim-typescript'

Plug 'Quramy/tsuquyomi'

"Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'jason0x43/vim-js-indent'
"" }
Plug 'Shougo/deol.nvim'

Plug 'tpope/vim-endwise'

Plug 'ianva/vim-youdao-translater'

Plug 'a5867460/vim-correction'


"Plug 'OrangeT/vim-csharp'

"Plug 'OmniSharp/omnisharp-vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
filetype on                  " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line






"general============================================================================

set gcr=a:block-blinkon0                              "禁止光标闪烁
set wrap
set number
set linebreak
set t_Co=256
"set termguicolors
colorscheme gruvbox
set background=dark
set cursorline                  " Highlight current line
set cursorcolumn                  " Highlight current line
set shiftwidth=4
set softtabstop=4
set expandtab
set showmatch
set hlsearch
set incsearch
set cmdheight=2
set laststatus=2
syntax enable
set tags=tags
set ai
set si
set langmenu=zh_CN.UTF-8
set helplang=cn
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,latin-1
set fileencoding=utf-8
set autoread
set vb t_vb=                                          "关闭提示音
set showcmd
let mapleader = ","
set ttyfast
set lazyredraw
nnoremap j jzz
nnoremap k kzz

nnoremap <F9> :TagbarToggle<CR>
nnoremap <leader>; <esc>$a;<esc>
nnoremap <C-h> :OverCommandLine<CR>

vnoremap < <gv
vnoremap > >gv


set history=500
set undolevels=10000
if has("persistent_undo")
    set undodir=~/.nvim/undodir/
    set undofile
endif



let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" Use the default set of separators with a few customizations
"let g:airline_left_sep = '»'
"let g:airline_right_sep = '«'
let g:airline_left_sep='›'  " Slightly fancier than '>'
let g:airline_right_sep='‹' " Slightly fancier than '<'
let g:airline_left_alt_sep = '»'
let g:airline_right_alt_sep = '«'

" UI=======================================================================

if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\Powerline\ 12
    let g:airline_left_alt_sep = ''
    let g:airline_right_alt_sep = ''
    colorscheme molokai
    let g:airline_theme = 'molokai'
    set go=
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif


"缩进线设置
let g:indentLine_enabled = 1
let g:indentLine_char = "┊"
let g:indentLine_color_gui = '#66d9ef'


let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
color solarized             " Load a colorscheme
let g:airline_theme = 'solarized'



"  < 插件配置 >
"----------------------------------------------------------------------------------------

" OmniComplete {
" To disable omni complete, add the following to your .nvimrc.before.local file:
"   let g:spf13_no_omni_complete = 1
"if !exists('g:spf13_no_omni_complete')
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Some convenient mappings
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
if exists('g:spf13_map_cr_omni_complete')
    inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menu
"endif
" }

" Ctags {
set tags=./tags;/,~/.nvimtags
"set tags+=/usr/include/tags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif
" }

"{

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_emit_conflict_warnings = 0
let g:ale_linters = {
            \  'go': ['golint', 'gosimple', 'go build', 'gofmt -e', 'errcheck', 'staticcheck', 'govet'],
            \  'php': ['phpstan', 'php -l', 'phpcs'],
            \}

"\  'javascript': ['flow'],
"\  'jsx': ['flow'],
"\  'php': ['phpstan --level=5 ', 'php -l', 'phpcs --standard=Custom', 'phpmd /home/yz/tools/phpmd-rulesets/phpmd_ruleset.xml'],
let g:ale_php_phpcs_standard = 'Custom'
let g:ale_php_phpstan_level = '5'
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
" }
"}

" NerdTree {
nnoremap <leader>e :NERDTreeToggle<CR>
map <C-e> :NERDTreeToggle<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" }


" AutoCloseTag {
" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html/autoclosetag.nvim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }



" JSON {
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal = 0
" }


nnoremap <silent> <leader>s :Files<cr>
" ctrlp {
if isdirectory(expand("~/.nvim/plugged/ctrlp.nvim/"))
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    if executable('ag')
        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
    elseif executable('ack-grep')
        let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
    elseif executable('ack')
        let s:ctrlp_fallback = 'ack %s --nocolor -f'
        " On Windows use "dir" as fallback command.
    elseif WINDOWS()
        let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
    else
        let s:ctrlp_fallback = 'find %s -type f'
    endif
    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
                \ }

    if isdirectory(expand("~/.nvim/plugged/ctrlp-funky/"))
        " CtrlP extensions
        let g:ctrlp_extensions = ['funky']

        "funky
        nnoremap <Leader>fu :CtrlPFunky<Cr>
    endif
endif
"}


" TagBar {
if isdirectory(expand("~/.nvim/plugged/tagbar/"))
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
    let g:tagbar_ctags_bin = 'ctags'
    let g:tagbar_width = 35
endif
"}

" Fugitive {
if isdirectory(expand("~/.nvim/plugged/vim-fugitive/"))
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif
"}


" youcompleteme{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:deoplete#ignore_sources.go = ['around']

"let g:nvim_typescript#max_completion_detail = 100

let g:deoplete#sources#flow#flow_bin = 'flow'
let g:deoplete#sources#tss#javascript_support = 1
"let g:tsuquyomi_javascript_support = 1
"let g:tsuquyomi_auto_open = 1


let g:echodoc_enable_at_startup = 1

autocmd FileType go :call deoplete#custom#set('deoplete_go', 'rank', 9999)
autocmd FileType typescript :call deoplete#custom#set('omni', 'rank', 9999)
"autocmd FileType php :call deoplete#custom#set('phpcd', 'rank', 10010)
"autocmd FileType javascript,jsx :call deoplete#custom#set('flow_bin', 'rank', 10010)
call deoplete#custom#set('_', 'sorters', ['sorter_rank'])

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:UltiSnipsExpandTrigger        = "<c-k>"
let g:UltiSnipsJumpForwardTrigger       = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger      = "<c-j>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.nvim/.snippets/']

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType javascript,jsx,coffee,vue setlocal omnifunc=tern#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete


" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt+=preview
set completeopt+=longest
set completeopt+=noinsert,noselect
"}


" UndoTree {
if isdirectory(expand("~/.nvim/plugged/undotree/"))
    nnoremap <Leader>u :UndotreeToggle<CR>
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1
endif
" }





"  < cscope 工具配置 >
" -----------------------------------------------------------------------------
" 用Cscope自己的话说 - "你可以把它当做是超过频的ctags"
if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
    "在当前目录中添加任何数据库
    if filereadable("cscope.out")
        cs add cscope.out
        "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'yellow', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \       'javascript' : {'parentheses' : [['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold',  'start=/{/ end=/}/'], ['(', ')'], ['{', '}']],}
            \   }
            \}

" Tabularize {
"if isdirectory(expand("~/.nvim/plugged/tabular"))
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
"endif
" }

" vim-go{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <leader>rs <Plug>(go-run-split)
au FileType go nmap <leader>rv <Plug>(go-run-vertical)
au FileType go nnoremap <leader>im :GoImport<Space>
au FileType go nnoremap <leader>ima :GoImportAs<Space>
au FileType go inoremap <leader>im :GoImport<Space>
au FileType go inoremap <leader>ima :GoImportAs<Space>
au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nnoremap <leader>b <Plug>(go-build)
"au FileType go nnoremap <leader>t <Plug>(go-test)
"au FileType go nnoremap <leader>c <Plug>(go-coverage)
" }

" { Ack-vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>
" }

" C compile{

nnoremap <F5> :make<CR>
"nnoremap <F8> :call Debug()<CR>
"定义CompileRun函数，用来对不用外接库的小程序进行编译和运行,自己可以根据文件名扩展或实际情况修改参数
func CompileRun()
    exec "w"
    "C程序
    if &filetype == 'c'
        exec "!gcc % -g -o %<"
        exec "!.//%<"
    endif
endfunc
"结束定义CompileRun

"定义Debug函数，用来调试小程序
func Debug()
    exec "w"
    "C程序
    if &filetype == 'c'
        exec "!rm %<"
        exec "!gcc % -g -o %<"
        exec "!gdb %<"
    elseif &filetype == 'cpp'
        exec "!rm %<"
        exec "!g++ % -g -o %<"
        exec "!gdb %<"
        exec "!rm %<.class"
        "Java程序
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!jdb %<"
    endif
endfunc
"定义dubug结束
" }

" vim-javascript{
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 1
autocmd FileType vue setlocal filetype=javascript
" }
" { padawan key map
autocmd FileType php setlocal completeopt+=menu,preview
" }
" { php namespace config
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
let g:php_namespace_sort_after_insert = 1
" }
" { php syntastic config

let g:syntastic_php_checkers = ['phpstan','php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = "--standard=Custom"
let g:syntastic_php_phpstan_args = "-l 5"
let g:syntastic_php_phpmd_args = "/home/yz/tools/phpmd-rulesets/phpmd_ruleset.xml"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" }

" { PHP syntax file config
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
" }

"{ reload conf
noremap <F6> :call ReloadToDev()<cr>
noremap <F3> :Autoformat<cr>
"}

" { Typescript config
"let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
"let g:nvim_typescript#javascript_support = 100
"let g:nvim_typescript#type_info_on_hold = 1
"let g:nvim_typescript#signature_complete = 1
" }

" { auto-indent
let g:formatdef_phpcbf = '"phpcbf --standard=Custom"'
let g:formatters_php = ['phpcbf']
autocmd FileType php let b:autoformat_autoindent=1
autocmd FileType php let b:autoformat_retab=1
autocmd FileType php let b:autoformat_remove_trailing_spaces=1
let g:p_auto_indent_filetype = ['vim', 'typescript']
autocmd BufWrite *
            \ if index(g:p_auto_indent_filetype, &filetype) >= 0 |
            \ :Autoformat |
            \ endif
" }

"{
nnoremap <silent> <leader>t :<C-u>Ydc<CR>
"}

let g:OmniSharp_server_type = 'roslyn'


" {

func ReloadToDev()
    let l:res = vimproc#system("./reload.sh")
    let l:reslist = split(l:res, '\n\|\r\n')
    let l:qflist = []
    for str in l:reslist
        let l:tmpDict = {}
        let l:tmpDict["text"] = str
        call insert(l:qflist, l:tmpDict)
    endfor
    call setqflist(l:qflist)
    copen
    call timer_start(5000, "CloseQF")
endfunc

func CloseQF(...)
    cclose
endfunc

func Gentags()
    call vimproc#system("ctags -R --fields=+aimlS --languages=php", "", 10000)
endfunc

func UpdateGitSubModule()
    exec "!git submodule update --init --recursive"
endfunc

func InitPHPProj()
    call UpdateGitSubModule()
    call Gentags()
    exec "!curl -sS https://raw.githubusercontent.com/a5867460/vimset/master/composer.json > ./composer.json"
    exec "!composer install"
endfunc

" }


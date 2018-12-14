" youcompleteme{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
"let g:deoplete#enable_refresh_always = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#max_list = 50
"let deoplete-options-max_list = 100

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:deoplete#ignore_sources.go = ['around']

"let g:nvim_typescript#max_completion_detail = 100

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.jsx = '[^. *\t]\.\w*'
let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*'

"let g:deoplete#sources#flow#flow_bin = 'flow'
let g:deoplete#sources#tss#javascript_support = 1
"let g:tsuquyomi_javascript_support = 1
"let g:tsuquyomi_auto_open = 1

" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-4.0/lib'
" or path directly to the library file
let g:clang_library_path='/usr/lib/llvm-4.0/lib/libclang.so.1'

"autocmd FileType go :call deoplete#custom#source('deoplete_go', 'rank', 9999)
"autocmd FileType typescript :call deoplete#custom#source('omni', 'rank', 9999)
autocmd FileType php :call deoplete#custom#source('phpcd', 'rank', 10010)
"autocmd FileType javascript,jsx :call deoplete#custom#source('flow_bin', 'rank', 10010)
call deoplete#custom#source('_', 'sorters', ['sorter_rank'])
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

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
"autocmd FileType javascript,jsx,coffee setlocal omnifunc=tern#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete


" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt-=preview
set completeopt+=longest
set completeopt+=noinsert,noselect

call deoplete#custom#option({
            \ 'ignore_case': v:true,
            \ 'smart_case': v:true,
            \ 'camel_case': v:true,
            \ 'refresh_always': v:true,
            \ })
"\ 'refresh_always': v:true,
"}
" { deoplete-go
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" }

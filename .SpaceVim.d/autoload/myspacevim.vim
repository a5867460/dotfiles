function! myspacevim#before() abort
  "let g:phan_executable_path = '~/.config/composer/vendor/bin/phan'
  let g:ale_linters = {
              \  'php': ['langserver', 'phpstan', 'php -l', 'phpcs'],
              \  'javascript': ["flow"],
  \}
endfunction

function! myspacevim#after() abort
    "let g:deoplete#sources#go#unimported_packages = 1
    "使用语法高亮定义代码折叠
    set foldmethod=syntax
    "打开文件是默认不折叠代码
    set foldlevelstart=99
    set nofoldenable 
    "let g:deoplete#auto_complete_start_length = 1
    "call deoplete#custom#option({
    "            \ 'ignore_case': v:true,
    "            \ 'smart_case': v:true,
    "            \ 'camel_case': v:true,
    "            \ 'refresh_always': v:true,
    "            \ })
    "call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
	"call deoplete#custom#source('_', 'sorters', [])
    "if filereadable('./.phan/.AutoRemoteSync.json')
    "    call AutoRemoteSync#SetConfigFilename('./.phan/.AutoRemoteSync.json')
    "    call AutoRemoteSync#Enable()
    "endif
    call coc#config('coc.preferences', {
                \ "autoTrigger": "always",
                \ "maxCompleteItemCount": 10,
                \ "codeLens.enable": 1,
                \ "diagnostic.virtualText": 1,
                \})

endfunction

if isdirectory('./.phan')
    let g:phan_analyzed_directory = getcwd()
    let g:phan_quick = 0
    "let g:phan_additional_cli_flags = ['--language-server-analyze-only-on-save']
endif
let mapleader = ","
"autocmd FileType php LanguageClientStart
set gcr=a:block-blinkon0   
let g:spacevim_terminal_cursor_shape = 0
let g:ale_php_phpcs_standard = 'Custom'
let g:ale_php_phpstan_level = '7'
let g:ale_php_langserver_use_global = 1
"let g:ale_completion_enabled = 1
let g:ale_php_langserver_executable = $HOME . '/.config/composer/vendor/bin/php-language-server.php'
let g:sync_exe_filenames = '.sync;,reload.sh;'

"autocmd FileType javascript let g:ale_completion_enabled = 1

autocmd FileType php inoremap <leader>4 $
autocmd FileType php nnoremap gd :ALEGoToDefinition<CR>
nnoremap <leader>ca :q<CR>
nnoremap <f10> :call LanguageClient_contextMenu()<CR>
nnoremap <leader>; <esc>$a;<esc>
nnoremap <C-i> $a;<esc>
nnoremap <space>gl :Gina pull --rebase<CR>
let g:php_namespace_sort_after_insert = 1
nmap <silent> gr <Plug>(coc-references)

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
let g:gutentags_ctags_extra_args= [
            \ '-R',
            \ '--fields=+aimlS',
            \ '--languages=php',
            \ '--PHP-kinds=cfit',
            \ ]

let g:neoformat_enabled_php = ['phpcbf']
let g:neoformat_php_phpcbf = {
            \ 'exe': 'phpcbf',
            \ 'args': ['--standard=Custom'],
            \ 'stdin': 1,
            \ 'stderr': 1,
            \ 'valid_exit_codes': [0,1],
            \ }

"autocmd FileType php :call deoplete#custom#source('phpcd', 'rank', 9999)

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

let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

autocmd BufWritePre *.purs :sign unplace *
autocmd BufWritePre *.php :sign unplace *

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

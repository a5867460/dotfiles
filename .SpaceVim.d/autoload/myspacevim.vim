function! myspacevim#before() abort
  let g:ale_linters = {
              \  'php': ['langserver', 'phpstan', 'php -l', 'phpcs'],
  \}
endfunction

function! myspacevim#after() abort
    "使用语法高亮定义代码折叠
    set foldmethod=syntax
    "打开文件是默认不折叠代码
    set foldlevelstart=99
    set nofoldenable 
    if isdirectory('./.phan')
        let g:phan_analyzed_directory = getcwd()
        echo g:phan_analyzed_directory
    endif
endfunction

let mapleader = ","
autocmd FileType php LanguageClientStart
set gcr=a:block-blinkon0   
let g:spacevim_terminal_cursor_shape = 0
let g:ale_php_phpcs_standard = 'Custom'
let g:ale_php_phpstan_level = '7'
"let g:ale_use_global_executables = 1
let g:ale_php_langserver_use_global = 1
let g:ale_completion_enabled = 1
let g:ale_php_langserver_executable = $HOME . '/.config/composer/vendor/bin/php-language-server.php'

function! myspacevim#before() abort
  let g:ale_linters = {
              \  'php': ['phpstan', 'php -l', 'phpcs'],
  \}
endfunction

function! myspacevim#after() abort
endfunction

let mapleader = ","
autocmd FileType php LanguageClientStart
"let g:phan_analyzed_directory = '/home/yz/workdir/winterfell'
let g:phan_analyzed_directory = '/home/yz/workdir/xlm'
set gcr=a:block-blinkon0   
let g:spacevim_terminal_cursor_shape = 0
let g:ale_php_phpcs_standard = 'Custom'
let g:ale_php_phpstan_level = '7'

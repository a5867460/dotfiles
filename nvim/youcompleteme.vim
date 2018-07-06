let g:acp_enableAtStartup = 0

" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_add_preview_to_completeopt = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = $HOME . '/.nvim/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=2
let g:ycm_key_invoke_completion = '<c-z>'
"let g:ycm_autoclose_preview_window_after_insertion = 1
let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-6.0.so.1'

" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>'
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.nvim/.snippets/']

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType javascript,jsx,coffee,vue setlocal omnifunc=tern#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Haskell post write lint and check with ghcmod
" $ `cabal install ghcmod` if missing and ensure
" ~/.cabal/bin is in your $PATH.
if !executable("ghcmod")
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
endif

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php =
            \ ['->', '::', 'use ', 'namespace ']

" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt-=preview
set completeopt+=longest
set completeopt+=noinsert
set completeopt+=noselect

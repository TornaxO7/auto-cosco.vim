" =========================================================
" Filename: autocommands.vim
" Author: TornaxO7
" Last changes: 25.04.21
" Version: 1.0
" Usage: 
"     This file sets all autocommands for cosco.
" =========================================================
augroup CoscoAutocommands
    autocmd!
    autocmd BufEnter * call cosco_helpers#ActivateCosco()
    autocmd VimEnter * call s:enableCosco()
augroup END

function! s:enableCosco()
    " Enable cosco if the user didn't set on his own that 
    " cosco should be disabled
    if !exists("g:cosco_enable") && index(g:cosco_whitelist, &ft) != -1
        let g:cosco_enable = 1
    endif

endfunction

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
augroup END

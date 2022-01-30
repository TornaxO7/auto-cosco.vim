" =========================================================
" Filename: plug.vim
" Author: TornaxO7
" Last changes: 25.04.21
" Version: 1.0
" Usage: 
"     This file includes all <Plug> commands for the user.
" =========================================================
" Let the user call the semicolon setter manually
nnoremap <silent> <nowait> <Plug>(cosco-AdaptCode)
    \ :<C-u>silent! call cosco#AdaptCode()<Bar>
    \ silent! call repeat#set("\<Plug>(cosco-AdaptCode)")<CR>

" =========================================================
" Filename: cosco.vim
" Usage: 
"     Here are all variables loaded of the cosco plugin.
"     Open ':h cosco-configuration' to understand the
"     usages of these variables.
" =========================================================

" don't reload the plugin too often
if exists("b:cosco_initialised") || &readonly
    finish
endif
let b:cosco_initialised = 1

call cosco_init#init()

" all autocommands for auto-cosco
augroup AutoCoscoAutoCommands
    autocmd!
    autocmd BufEnter * call cosco_helpers#ActivateCosco()
augroup END

" all user commands
command! CoscoAdaptCode :call cosco_eval#Manual()<CR>
command! CoscoToggleAutoSetter :call cosco_helpers#AutoSetterToggle()

nnoremap <silent> <nowait> <Plug>(cosco-AdaptCode)
    \ :<C-u>silent! call cosco#AdaptCode()<Bar>
    \ silent! call repeat#set("\<Plug>(cosco-AdaptCode)")<CR>

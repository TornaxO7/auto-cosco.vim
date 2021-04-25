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

" =================
" 1. Variables 
" =================
" ---------------------------
" 1.1 Configurable variables 
" ---------------------------
call cosco_helpers#set_setting("g:cosco_auto_setter",        1)
call cosco_helpers#set_setting("g:cosco_auto_setter_events", ["TextChangedI"])
call cosco_helpers#set_setting("g:cosco_ignore_comments",    1)
call cosco_helpers#set_setting("g:cosco_whitelist",          ['c', 'cpp', 'css', 'javascript', 'rust' ])
call cosco_helpers#set_setting("g:cosco_enable",             1)

if index(g:cosco_whitelist, &ft) == -1
    let g:cosco_enable = 0
    echom 'filetype: ' . &ft
endif

call cosco_helpers#set_setting("g:cosco_map_cr",  1)

" -------------------
" Debug variables
" -------------------
call cosco_helpers#set_setting("g:cosco_debug",  0)

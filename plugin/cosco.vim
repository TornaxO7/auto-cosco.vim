" =========================================================
" Filename: cosco.vim
" Usage: 
"     Here are all values which are loaded first for the
"     cosco plugin. It has the following structure:
"       1. Variables
"         1.1 Configurable Variables
"         1.2 Core variables (shouldn't be configured directly
"           from the user).
"       2. Autocommands.
"       3. Available commands for the user.
"         3.1 Commandline commands
"         3.2 <Plug> commands
" =========================================================

" don't reload the plugin too often
if exists("b:cosco_initialised")
    finish
endif
let b:cosco_initialised = 1

" =================
" 1. Variables 
" =================
" ---------------------------
" 1.1 Configurable variables 
" ---------------------------
" Open :h cosco-configuration to get the description of each variable.
call cosco_helpers#set_setting("g:cosco_auto_setter", 1)
call cosco_helpers#set_setting("g:cosco_auto_setter_events",  ["TextChangedI"])
call cosco_helpers#set("g:cosco_ignore_comments",  1)
call cosco_helpers#set("g:cosco_whitelist",  ['c', 'cpp', 'css', 'javascript', 'rust' ])
call cosco_helpers#set("g:cosco_enable",  1)

if &readonly || (index(g:cosco_whitelist, &ft) == -1)
    let g:cosco_enable = 0
endif

call cosco_helpers#set("g:cosco_map_cr",  1)

" -------------------
" Debug variables
" -------------------
call cosco_helpers#set("g:cosco_debug",  0)

" =========================================================
" Filename: cosco_init.vim
" Author: TornaxO7
" Version: 1.0
" Usage: 
"     This file includes all functions which are called
"     if cosco is loaded.
" =========================================================

" What does it do?
"   Loads the default setting of the given setting for cosco if the user didn't
"   provide a value to it.
"   Credits goes to vimtex: 
"     https://github.com/lervag/vimtex/blob/master/autoload/vimtex/options.vim#L7
"  
" Parameters:
"	name: The name of the setting (string)
"	default: The default value for the setting.
"
function cosco_init#set_setting(name, default)
    if !exists(a:name)
        let {a:name} = a:default

        "if g:cosco_debug
        "    echom "Using default value of " . a:name
        "endif
    endif
endfunction

function cosco_init#init()
    call cosco_init#set_setting("g:cosco_debug",  0)
    call cosco_init#set_setting("g:cosco_auto_setter",        1)
    call cosco_init#set_setting("g:cosco_auto_setter_events", ["TextChangedI"])
    call cosco_init#set_setting("g:cosco_ignore_comments",    1)
    call cosco_init#set_setting("g:cosco_whitelist",          ['c', 'cpp', 'css', 'javascript', 'rust' ])
    call cosco_init#set_setting("g:cosco_map_cr",             0)
    call cosco_init#set_setting("g:cosco_enable",             1)

    " Disable cosco, if:
    "   - the current filetype isn't in the whitelist
    if index(g:cosco_whitelist, &ft) == -1
        let g:cosco_enable = 0
    endif
endfunction

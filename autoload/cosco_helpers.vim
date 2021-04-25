" =========================================================
" Filename: cosco_helpers.vim
" Usage: 
"     Here are all intern functions which are used in
"     the cosco plugin.
"     All functions are sorted after their name (for each section).
" =========================================================

" toggle the state between when setting the commas/semicolons
" automatically or not.
function! cosco_helpers#AutoSetterToggle()
    if g:cosco_auto_setter >= 1
        let g:cosco_auto_setter = 0
        echo "[Cosco] AutoAdapatCode is OFF"

        " disable the autocommands
        call cosco_autocmds#StopAutocmds()
    else
        let g:cosco_auto_setter = 1
        echo "[Cosco] AutoAdaptCode is ON"

        " enable the autocomds
        call cosco_autocmds#RefreshAutocmds()
    endif
endfunction

" Look if cosco should be enabled for the current filetype
" Return values:
"   0 => Current filetype is not in the whitelist
"   1 => Current filetype is in the whitelist
function cosco_helpers#FiletypeInWhitelist()

    " look if the current filetype is in the whitelist
    for b:enabled_ft in g:cosco_whitelist
        if b:enabled_ft == &ft
            return 1
        endif
    endfor

    return 0
endfunction

" This function tries to map the cosco#AdaptCode() function to the <CR>
" key (if the user set the setting), otherwise it will call the function
" for each event in the list.
function cosco_helpers#ActivateCosco() 

    if cosco_helpers#FiletypeInWhitelist() 

        " if the user wants to map cosco to CR
        if g:cosco_map_cr
            echom "imap"
            imap <CR> <CR><CMD>call cosco#AdaptCode()<CR>

        " otherwise use the given events in the list to enable cosco
        else

            call cosco_autocmds#ActivateCoscoEvents()
        endif
    endif
endfunction

" This function loads the given information around the current position
" to interact with it. After calling this function, you can access these
" variables anywhere.
function cosco_helpers#get_information()
    " current line
    let b:cln = line('.')                         " cln = *C*urrent *L*ine *N*um
    let b:cl  = getline(b:cln)                    " cl  = *C*urrent *L*ine
    let b:cls = trim(b:cl)         " cls = *C*urrent *L*ine *S*tripped
    echo b:cls

    " next line
    let b:nln = nextnonblank(b:cln + 1)           " nln = *N*ext *L*ine *N*umber
    let b:nl  = getline(nextnonblank(b:cln + 1))  " nl  = *N*ext *L*ine
    let b:nls = trim(b:nl)         " nls = *N*ext *L*ine *S*tripped
    
    " previous line
    let b:pln = prevnonblank(b:cln - 1)           " pln = *P*revious *L*ine *N*umber
    let b:pl  = getline(prevnonblank(b:cln - 1))  " pl  = *P*revious *L*ine
    let b:pls = trim(b:pl)         " pl  = *P*revious *L*ine
endfunction

"
" What does it do?
"   Loads the default setting of the given setting for cosco if the user didn't
"   provide a value to it.
"  
" Parameters:
"	name: The name of the setting (string)
"	default: The default value for the setting.
"
function cosco_helpers#set_setting(name, default)
    if !exists(a:name)
        execute 'let ' . a:name . '=' . default
    endif
endfunction

" =========================================================
" Filename: cosco.vim
" Usage: 
"     This is the main file of the cosco plugin.
"     Here is the core function and some preparations
"     of the plugin.
" =========================================================

" How it general works:
"   1. Get some information of the:
"       - previous line
"       - current line
"       - next line
"     in order to evaluate the situation.
"   2. Look if we need to add a semicolon/comma or not. If not => Stop the function
"   3. Otherwise look if there are some special "rules" for the given filetype.
"     If yes, load them. (They are in the autoload/cosco_eval.vim)
"   4. Now do the general looking, like is in the *previous line* an assignment or a declaration and so on.
"     It *won't* set the semicolon/comma in the currentline! Only in the previous line!
"
" Return values:
"   0 => Added comma/semicolon; Everything worked fine
"   1 => Didn't add a comma/semicolon; (Probably) Something went wrong
function cosco#AdaptCode()

    " stop immediately if cosco is not enabled
    if !g:cosco_enable
        return 1
    endif

    call cosco_helpers#get_information()

    " =============================
    " Evaluating the situation 
    " =============================
    " this variable is set after an extra file set its conditions.
    let b:cosco_ret_value = cosco_eval#Specials()

    " if the special cases couldn't find anything
    " => Go through the general conditions
    if b:cosco_ret_value == -1

        if cosco_eval#ShouldNotSkip()

            " b:cosco_ret_value has to be set from this function
            " since we don't now yet, what we have to add
            let b:cosco_ret_value = cosco_eval#ShouldAdd()
                
        elseif cosco_eval#ShouldRemove()
            let b:cosco_ret_value = 4
        endif
    endif

    " ------------------------------
    " Add the symbol (if given) 
    " ------------------------------
    if b:cosco_ret_value == 1
        call cosco_setter#AddDoublePoints(b:pln)

    elseif b:cosco_ret_value == 2 || b:cosco_ret_value == 3

        if b:cosco_ret_value == 2
            call cosco_setter#AddComma(b:pln)

        elseif b:cosco_ret_value == 3
            call cosco_setter#AddSemicolon(b:pln)
        endif

        " now make sure that we have the same indentation as the previous line
        " since vim will move the cursor not back to its identation (as in step
        " 2), if the user uses the enter key to get to the next line
        " (the vertical line should represent the cursor)
        " Here's an example in C:
        "
        "   Step 1:
        "     short a|
        "
        "   Step 2 (create new line):
        "     short a
        "       |
        "
        "   Step 3 (cosco: add semicolon):
        "     short a;
        "       |
        "
        "   Step 4: (cosco: fix indentation of cursor)
        "     short a;
        "     |
        "
        " Step 4 does this setline here.
        " This "b:cls == ''" condition is there to avoid deleting the line, if
        " the line has already some contents.
        
        if b:cls == '' && indent(b:pln) > 0
	    let l:new_indent = py3eval("' ' * ". indent(b:pln))
	    if l:new_indent != v:null
		call setline(b:cln, l:new_indent)
	    else
		call setline(b:cln, '    ')
	    endif
        endif

    elseif b:cosco_ret_value == 4
        call cosco_setter#RemoveEndCharacter(b:pln)

    endif

    return 0
endfunction

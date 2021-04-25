" =========================================================
" Filename: commands.vim
" Author: TornaxO7
" Last changes: 25.04.21
" Version: 1.0
" Usage: 
"     This file has all user-commands to interact with
"     cosco.
" =========================================================
command! CoscoAdaptCode :call cosco_eval#Manual()<CR>
command! CoscoToggleAutoSetter :call cosco_helpers#AutoSetterToggle()

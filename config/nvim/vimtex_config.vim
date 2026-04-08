" vimtex
let g:tex_flavor='latex'
"let g:vimtex_view_method = 'open -a /Applications/Skim.app -g'
let g:vimtex_view_method = 'skim'
let g:vimtex_ui_method = {
    \ 'confirm': 'vim',
    \ 'input': 'vim',
    \ 'select': 'vim',
    \ }
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
        \ '-verbose',
        \ '-file-line-error',
        \ '-synctex=1',
        \ '-interaction=nonstopmode',
        \ '-shell-escape',
        \ ]
    \ }
let g:vimtex_quickfix_autoclose_after_keystrokes=1

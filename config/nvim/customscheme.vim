
" =============================================================================
" Filename: autoload/lightline/colorscheme/customscheme.vim
" Author: EthanN-200321
" License: There is no license. Take off your clothes
" =============================================================================

let s:black = '#0a0b0c'
let s:bg = '#13161B'
let s:fg = '#fafafa'
let s:grey = '#2a3442'
let s:altgrey = '#1d232e'

let s:green = '#b1ed82'
let s:pink = '#e584f0'
let s:purple = '#ae75eb'
let s:red = '#ff66a3' 

" OLD COLORS
"let s:green = '#a9ed76'
"let s:pink = '#d864e5'
"let s:purple = '#a769ea'
"let s:red = '#fb3b6b' 

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:bg, s:green ], [ s:fg, s:grey ] ]
let s:p.normal.right = [ [ s:fg, s:grey ], [ s:fg, s:grey ] ]
let s:p.inactive.left =  [ [ s:fg, s:grey ], [ s:fg, s:grey ] ]
let s:p.inactive.right = [ [ s:fg, s:grey ], [ s:fg, s:grey ] ]
let s:p.insert.left = [ [ s:bg, s:pink ], [ s:fg, s:grey ] ]
let s:p.replace.left = [ [ s:bg, s:red ], [ s:fg, s:grey ] ]
let s:p.visual.left = [ [ s:bg, s:purple ], [ s:fg, s:grey ] ]
let s:p.normal.middle = [ [ s:fg, s:bg ] ]
let s:p.inactive.middle = [ [ s:fg, s:bg ] ]
let s:p.tabline.left = [ [ s:fg, s:altgrey ] ]
let s:p.tabline.tabsel = [ [ s:fg, s:altgrey ] ]
let s:p.tabline.middle = [ [ s:fg, s:black ] ]
let s:p.tabline.right = [ [ s:fg, s:altgrey] ]
" copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:grey ] ]
let s:p.normal.warning = [ [ s:pink, s:grey ] ]

let g:lightline#colorscheme#customscheme#palette = lightline#colorscheme#fill(s:p)

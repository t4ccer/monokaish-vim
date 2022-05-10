" File:       monokaish.vim
" Maintainer: t4ccer
" URL:        https://github.com/t4ccer/vim-monokaish
" License:    MIT
"
" The colour palette is adapted from https://github.com/crusoexia/vim-monokai

" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

if ! exists("g:monokai_gui_italic")
    let g:monokai_gui_italic = 0
endif

if ! exists("g:monokai_term_italic")
    let g:monokai_term_italic = 0
endif

let g:monokai_termcolors = 256 " does not support 16 color term right now.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "monokai"

function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:monokai_term_italic == 0
    let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
  endif
  if g:monokai_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ",italic", "", "")
    let s:guiformat = substitute(s:guiformat, "italic,", "", "")
    let s:guiformat = substitute(s:guiformat, "italic", "", "")
  endif
  if g:monokai_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

" Palettes
" --------

let s:black       = { "gui": "#222222", "cterm": "234" }
let s:dark_gray   = { "gui": "#333333", "cterm": "235" }
let s:gray        = { "gui": "#666666", "cterm": "243" }
let s:light_gray  = { "gui": "#aaaaaa", "cterm": "59" }
let s:white       = { "gui": "#dddddd", "cterm": "252" }

let s:orange      = { "gui": "#fd971f", "cterm": "208" }
let s:yellow      = { "gui": "#E6DB74", "cterm": "186" }
let s:purple      = { "gui": "#9d65ff", "cterm": "141" }
let s:blue        = { "gui": "#4eb4fa", "cterm": "81" }
let s:red         = { "gui": "#F92672", "cterm": "197" }
let s:red_dull    = { "gui": "#c15d81", "cterm": "52" }
let s:green       = { "gui": "#A7E22E", "cterm": "148" }
let s:green_dull  = { "gui": "#98b758", "cterm": "148" }

" Highlighting 
" ------------

" editor
call s:h("Normal",        { "fg": s:white,      "bg": s:black })
call s:h("ColorColumn",   {                     "bg": s:dark_gray })
call s:h("Cursor",        { "fg": s:black,      "bg": s:blue })
call s:h("CursorColumn",  {                     "bg": s:dark_gray })
call s:h("CursorLine",    {                     "bg": s:dark_gray })
call s:h("NonText",       { "fg": s:gray })
call s:h("Visual",        {                     "bg": s:gray })
call s:h("Search",        { "fg": s:gray,  "bg": s:blue })
call s:h("MatchParen",    { "fg": s:purple,                           "format": "underline,bold" })
call s:h("Question",      { "fg": s:yellow })
call s:h("ModeMsg",       { "fg": s:yellow })
call s:h("MoreMsg",       { "fg": s:yellow })
call s:h("ErrorMsg",      { "fg": s:black,      "bg": s:red,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:red })
call s:h("VertSplit",     { "fg": s:gray,   "bg": s:black })
call s:h("LineNr",        { "fg": s:gray,       "bg": s:black })
call s:h("CursorLineNr",  { "fg": s:purple,     "bg": s:black })
call s:h("SignColumn",    {                     "bg": s:black })

" statusline
call s:h("StatusLine",    { "fg": s:white,      "bg": s:gray })
call s:h("StatusLineNC",  { "fg": s:gray,  "bg": s:black })
call s:h("TabLine",       { "fg": s:gray,  "bg": s:dark_gray })
call s:h("TabLineSel",    { "fg": s:black,  "bg": s:blue,     "format": "bold" })
call s:h("TabLineFill",   { "bg": s:dark_gray })
call s:h("User1",         { "fg": s:yellow,     "bg": s:gray,    "format": "bold" })
call s:h("User2",         { "fg": s:orange,     "bg": s:gray,    "format": "bold" })
call s:h("User3",         { "fg": s:purple,     "bg": s:gray,    "format": "bold" })
call s:h("User4",         { "fg": s:blue,       "bg": s:gray,    "format": "bold" })

" spell
call s:h("SpellBad",      { "fg": s:red,                              "format": "underline" })
call s:h("SpellCap",      { "fg": s:purple,                           "format": "underline" })
call s:h("SpellRare",     { "fg": s:blue,                             "format": "underline" })
call s:h("SpellLocal",    { "fg": s:red,                             "format": "underline" })

" misc
call s:h("SpecialKey",    { "fg": s:red })
call s:h("Title",         { "fg": s:yellow })
call s:h("Directory",     { "fg": s:blue })

" diff
call s:h("DiffAdd",       { "fg": s:green,      "bg": s:green_dull })
call s:h("DiffDelete",    { "fg": s:red,      "bg": s:red_dull })
call s:h("DiffChange",    { "fg": s:white,   "bg": s:purple })
call s:h("DiffText",      { "fg": s:black,      "bg": s:blue })

" fold
call s:h("Folded",        { "fg": s:light_gray,   "bg": s:black })
call s:h("FoldColumn",    {                     "bg": s:black })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:white,     "bg": s:dark_gray })
call s:h("PmenuSel",      { "fg": s:blue,       "bg": s:dark_gray,        "format": "reverse,bold" })
call s:h("PmenuThumb",    { "fg": s:dark_gray, "bg": s:gray })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:purple })
call s:h("Number",        { "fg": s:purple })
call s:h("Float",         { "fg": s:purple })
call s:h("Boolean",       { "fg": s:purple })
call s:h("Character",     { "fg": s:yellow })
call s:h("String",        { "fg": s:yellow })

call s:h("Type",          { "fg": s:blue })
call s:h("Structure",     { "fg": s:red })
call s:h("StorageClass",  { "fg": s:red })
call s:h("Typedef",       { "fg": s:red })
    
call s:h("Identifier",    { "fg": s:green })
call s:h("Function",      { "fg": s:green })
                         
call s:h("Statement",     { "fg": s:red })
call s:h("Operator",      { "fg": s:red })
call s:h("Label",         { "fg": s:red })
call s:h("Keyword",       { "fg": s:red })
"        Conditional"
"        Repeat"
"        Exception"

call s:h("PreProc",       { "fg": s:green })
call s:h("Include",       { "fg": s:red })
call s:h("Define",        { "fg": s:red })
call s:h("Macro",         { "fg": s:green })
call s:h("PreCondit",     { "fg": s:green })
                           
call s:h("Special",       { "fg": s:purple })
call s:h("SpecialChar",   { "fg": s:red })
call s:h("Delimiter",     { "fg": s:red })
call s:h("SpecialComment",{ "fg": s:light_gray })
call s:h("Tag",           { "fg": s:red })
"        Debug"

call s:h("Todo",          { "fg": s:orange,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:gray, "format": "italic" })
                         
call s:h("Underlined",    { "fg": s:green })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:red, "bg": s:red_dull })

" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:yellow })
call s:h("NERDTreeClosable",        { "fg": s:yellow })
call s:h("NERDTreeHelp",            { "fg": s:yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:red })
call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
call s:h("NERDTreeCWD",             { "fg": s:red })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:gray })
call s:h("NERDTreeDir",             { "fg": s:gray })

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:dark_gray, "bg": s:orange })

" coc
" ---

hi! link CocErrorSign Error
call s:h("CocErrorHighlight",       { "fg": s:red, "format": "underline" })
call s:h("CocErrorFloat",           { "fg": s:red, "bg": s:dark_gray })

call s:h("CocWarningSign",          { "fg": s:orange, "bg": s:dark_gray })
call s:h("CocWarningHighlight",     { "format": "underline" })
call s:h("CocWarningFloat",         { "fg": s:orange, "bg": s:dark_gray })

call s:h("CocInfoSign",             { "fg": s:yellow, "bg": s:dark_gray })
call s:h("CocInfoHighlight",        { "format": "underline" })

call s:h("CocHintSign",             { "fg": s:white, "bg": s:dark_gray })
call s:h("CocHintHighlight",        { "format": "underline" })

" Language highlight
" ------------------

" Java properties
call s:h("jpropertiesIdentifier",   { "fg": s:red })

" Vim command
call s:h("vimCommand",              { "fg": s:red })

" Javascript
call s:h("jsClassKeyword",      { "fg": s:red, "format": "italic" })
call s:h("jsGlobalObjects",     { "fg": s:blue, "format": "italic" })
call s:h("jsFuncName",          { "fg": s:green })
call s:h("jsThis",              { "fg": s:white, "format": "italic" })
call s:h("jsObjectKey",         { "fg": s:white })
call s:h("jsFunctionKey",       { "fg": s:red })
call s:h("jsPrototype",         { "fg": s:red })
call s:h("jsExceptions",        { "fg": s:blue })
call s:h("jsFutureKeys",        { "fg": s:blue })
call s:h("jsBuiltins",          { "fg": s:blue })
call s:h("jsStatic",            { "fg": s:red })
call s:h("jsSuper",             { "fg": s:blue, "format": "italic" })
call s:h("jsFuncArgRest",       { "fg": s:purple, "format": "italic" })                                 
call s:h("jsFuncArgs",          { "fg": s:white, "format": "italic" })
call s:h("jsStorageClass",      { "fg": s:red, "format": "italic" })
call s:h("jsDocTags",           { "fg": s:red,   "format": "italic" })
call s:h("jsFunction",          { "fg": s:red,   "format": "italic" })

" Typescript
call s:h("typescriptBraces",              { "fg": s:white })
call s:h("typescriptParens",              { "fg": s:white })
call s:h("typescriptOperator",            { "fg": s:red })
call s:h("typescriptEndColons",           { "fg": s:white })
call s:h("typescriptModule",              { "fg": s:blue })
call s:h("typescriptPredefinedType",      { "fg": s:blue })
call s:h("typescriptImport",              { "fg": s:red })
call s:h("typescriptExport",              { "fg": s:red })
call s:h("typescriptIdentifier",          { "fg": s:orange, "format": "italic" })
call s:h("typescriptVariable",            { "fg": s:blue })
call s:h("typescriptCastKeyword",         { "fg": s:red })
call s:h("typescriptAmbientDeclaration",  { "fg": s:red })
call s:h("typescriptTestGlobal",          { "fg": s:red })
call s:h("typescriptFuncKeyword",         { "fg": s:blue })
call s:h("typescriptFuncTypeArrow",       { "fg": s:blue })
call s:h("typescriptFuncType",            { "fg": s:orange, "format": "italic" })
call s:h("typescriptFuncName",            { "fg": s:green })
call s:h("typescriptArrowFuncArg",        { "fg": s:orange, "format": "italic" })
call s:h("typescriptCall",                { "fg": s:orange, "format": "italic" })
call s:h("typescriptClassKeyword",        { "fg": s:blue,   "format": "italic" })
call s:h("typescriptClassName",           { "fg": s:white })
call s:h("typescriptClassHeritage",       { "fg": s:white })
call s:h("typescriptInterfaceKeyword",    { "fg": s:blue,   "format": "italic" })
call s:h("typescriptInterfaceName",       { "fg": s:white })
call s:h("typescriptObjectLabel",         { "fg": s:green })
call s:h("typescriptMember",              { "fg": s:green })
call s:h("typescriptTypeReference",       { "fg": s:purple, "format": "italic" })
call s:h("typescriptTypeParameter",       { "fg": s:purple, "format": "italic" })
call s:h("typescriptOptionalMark",        { "fg": s:red })
call s:h("tsxAttrib",                     { "fg": s:green })
call s:h("tsxTagName",                    { "fg": s:red })

" Dart
call s:h("dartStorageClass",    { "fg": s:red })
call s:h("dartExceptions",      { "fg": s:red })
call s:h("dartConditional",     { "fg": s:red })
call s:h("dartRepeat",          { "fg": s:red })
call s:h("dartTypedef",         { "fg": s:red })
call s:h("dartKeyword",         { "fg": s:red })
call s:h("dartConstant",        { "fg": s:purple })
call s:h("dartBoolean",         { "fg": s:purple })
call s:h("dartCoreType",        { "fg": s:blue })
call s:h("dartType",            { "fg": s:blue })
                                 
" HTML
call s:h("htmlTag",             { "fg": s:white })
call s:h("htmlEndTag",          { "fg": s:white })
call s:h("htmlTagName",         { "fg": s:red })
call s:h("htmlArg",             { "fg": s:green })
call s:h("htmlSpecialChar",     { "fg": s:purple })

" XML
call s:h("xmlTag",              { "fg": s:red })
call s:h("xmlEndTag",           { "fg": s:red })
call s:h("xmlTagName",          { "fg": s:orange })
call s:h("xmlAttrib",           { "fg": s:green })

" JSX
call s:h("jsxTag",              { "fg": s:white })
call s:h("jsxCloseTag",         { "fg": s:white })
call s:h("jsxCloseString",      { "fg": s:white })
call s:h("jsxPunct",            { "fg": s:white })
call s:h("jsxClosePunct",       { "fg": s:white })
call s:h("jsxTagName",          { "fg": s:red })
call s:h("jsxComponentName",    { "fg": s:red })
call s:h("jsxAttrib",           { "fg": s:green })
call s:h("jsxEqual",            { "fg": s:white })
call s:h("jsxBraces",           { "fg": s:white })

" CSS
call s:h("cssProp",             { "fg": s:yellow })
call s:h("cssUIAttr",           { "fg": s:yellow })
call s:h("cssFunctionName",     { "fg": s:green })
call s:h("cssColor",            { "fg": s:purple })
call s:h("cssPseudoClassId",    { "fg": s:purple })
call s:h("cssClassName",        { "fg": s:green })
call s:h("cssValueLength",      { "fg": s:purple })
call s:h("cssCommonAttr",       { "fg": s:red })
call s:h("cssBraces" ,          { "fg": s:white })
call s:h("cssClassNameDot",     { "fg": s:red })
call s:h("cssURL",              { "fg": s:orange, "format": "underline,italic" })

" LESS
call s:h("lessVariable",        { "fg": s:green })

" SASS
call s:h("sassMixing",          { "fg": s:blue })
call s:h("sassMixin",           { "fg": s:blue })
call s:h("sassFunctionDecl",    { "fg": s:blue })
call s:h("sassReturn",          { "fg": s:blue })
call s:h("sassClass",           { "fg": s:green })
call s:h("sassClassChar",       { "fg": s:red })
call s:h("sassIdChar",          { "fg": s:red })
call s:h("sassControl",         { "fg": s:blue })
call s:h("sassFor",             { "fg": s:blue })

" ruby
call s:h("rubyInterpolationDelimiter",  {})
call s:h("rubyInstanceVariable",        {})
call s:h("rubyGlobalVariable",          {})
call s:h("rubyClassVariable",           {})
call s:h("rubyPseudoVariable",          {})
call s:h("rubyFunction",                { "fg": s:green })
call s:h("rubyStringDelimiter",         { "fg": s:yellow })
call s:h("rubyRegexp",                  { "fg": s:yellow })
call s:h("rubyRegexpDelimiter",         { "fg": s:yellow })
call s:h("rubySymbol",                  { "fg": s:purple })
call s:h("rubyEscape",                  { "fg": s:purple })
call s:h("rubyInclude",                 { "fg": s:red })
call s:h("rubyOperator",                { "fg": s:red })
call s:h("rubyControl",                 { "fg": s:red })
call s:h("rubyClass",                   { "fg": s:red })
call s:h("rubyDefine",                  { "fg": s:red })
call s:h("rubyException",               { "fg": s:red })
call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange })
call s:h("rubyRailsARMethod",           { "fg": s:orange })
call s:h("rubyRailsRenderMethod",       { "fg": s:orange })
call s:h("rubyRailsMethod",             { "fg": s:orange })
call s:h("rubyConstant",                { "fg": s:blue })
call s:h("rubyBlockArgument",           { "fg": s:orange })
call s:h("rubyBlockParameter",          { "fg": s:orange })

" eruby
call s:h("erubyDelimiter",              {})
call s:h("erubyRailsMethod",            { "fg": s:blue })

" c
call s:h("cLabel",                      { "fg": s:red })
call s:h("cStructure",                  { "fg": s:blue })
call s:h("cStorageClass",               { "fg": s:red })
call s:h("cInclude",                    { "fg": s:red })
call s:h("cDefine",                     { "fg": s:red })
call s:h("cSpecial",                    { "fg": s:purple })

" Markdown
call s:h("markdownCode",       { "fg": s:purple, "format": "italic" } )
call s:h("markdownListMarker", { "fg": s:purple                     } )

" vim-notes
call s:h("notesTitle",        { "fg": s:blue,        "format": "bold"        } )
call s:h("notesAtxMarker",    { "fg": s:red,        "format": "italic,bold" } )
call s:h("notesShortHeading", { "fg": s:white,       "format": "bold"        } )
call s:h("notesListBullet",   { "fg": s:purple                               } )
call s:h("notesListNumber",   { "fg": s:purple,      "format": "italic"      } )
call s:h("notesBold",         {                      "format": "bold"        } )
call s:h("notesDoneMarker",   { "fg": s:green                                } )

" Terminal Colors
" ---------------
if has('nvim')
  let g:terminal_color_0  = s:black.gui
  let g:terminal_color_1  = s:red.gui
  let g:terminal_color_2  = s:green.gui
  let g:terminal_color_3  = s:yellow.gui
  let g:terminal_color_4  = s:blue.gui
  let g:terminal_color_5  = s:purple.gui
  let g:terminal_color_6  = s:blue.gui
  let g:terminal_color_7  = s:white.gui
  let g:terminal_color_8  = s:gray.gui
  let g:terminal_color_9  = s:red.gui
  let g:terminal_color_10 = s:green_dull.gui
  let g:terminal_color_11 = s:yellow.gui
  let g:terminal_color_12 = s:blue.gui
  let g:terminal_color_13 = s:purple.gui
  let g:terminal_color_14 = s:blue.gui
  let g:terminal_color_15 = s:white.gui
else
  let g:terminal_ansi_colors = [
        \ s:black.gui,
        \ s:red.gui,
        \ s:green.gui,
        \ s:yellow.gui,
        \ s:blue.gui,
        \ s:purple.gui,
        \ s:blue.gui,
        \ s:white.gui,
        \ s:gray.gui,
        \ s:red.gui,
        \ s:green_dull.gui,
        \ s:yellow.gui,
        \ s:blue.gui,
        \ s:purple.gui,
        \ s:blue.gui,
        \ s:white.gui]
endif

" Coq
call s:h("CoqtailChecked",       { "bg": s:dark_gray })
call s:h("CoqtailSent",          { "bg": s:dark_gray })

" Coq Inductive
call s:h("coqIndTerm",           { "fg": s:blue })
call s:h("coqIndConsTerm",       { "fg": s:blue })
" call s:h("coqIndNotScope",    { "fg": s:orange })
" call s:h("coqIndConstructor", { "fg": s:orange })
" call s:h("coqIndBody",        { "fg": s:orange })
" call s:h("coqIndContent",     { "fg": s:orange })

" Coq Fixpoint
call s:h("coqFixTerm",           { "fg": s:blue })
call s:h("coqFixContent",        { "fg": s:blue })

call s:h("coqKwd",               { "fg": s:red })
call s:h("coqNotationKwd",       { "fg": s:red })
call s:h("coqNotationKwd",       { "fg": s:red })
call s:h("coqBinder",            { "fg": s:blue })

call s:h("coqProofDelim",        { "fg": s:red })
call s:h("coqOblOfDelim",        { "fg": s:red })

call s:h("coqVernacPunctuation", { "fg": s:red })
call s:h("coqAttrPunc",          { "fg": s:red })
call s:h("coqProofPunctuation",  { "fg": s:red })
call s:h("coqTermPunctuation",   { "fg": s:red })

call s:h("coqVernacCmd",         { "fg": s:red })
call s:h("coqTactic",            { "fg": s:red })
call s:h("coqGoal",              { "fg": s:red })

call s:h("coqTerm",              { "fg": s:blue })
call s:h("coqGoalTerm",          { "fg": s:blue })
call s:h("coqThmTerm",           { "fg": s:blue })

call s:h("coqProofBody",         { "fg": s:blue })

call s:h("coqConstructor",       { "fg": s:blue })


call s:h("coqEqnContent",        { "fg": s:blue })
call s:h("coqKwdParen",          { "fg": s:blue })

hi def link CoqtailError Error

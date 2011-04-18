" Vim color file
" Converted from Textmate theme Texari using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "texari"

hi Cursor  guifg=NONE guibg=#a7a7a7 gui=NONE
hi Visual  guifg=NONE guibg=#8a8470 gui=NONE
hi CursorLine  guifg=NONE guibg=#584e4a gui=NONE
hi CursorColumn  guifg=NONE guibg=#584e4a gui=NONE
hi LineNr  guifg=#96908d guibg=#332722 gui=NONE
hi VertSplit  guifg=#584f4b guibg=#584f4b gui=NONE
hi MatchParen  guifg=#cda869 guibg=NONE gui=NONE
hi StatusLine  guifg=#f8f8f8 guibg=#584f4b gui=bold
hi StatusLineNC  guifg=#f8f8f8 guibg=#584f4b gui=NONE
hi Pmenu  guifg=#c1c1c1 guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#8a8470 gui=NONE
hi IncSearch  guifg=NONE guibg=#49474e gui=NONE
hi Search  guifg=NONE guibg=#49474e gui=NONE
hi Directory  guifg=#a5768e guibg=NONE gui=NONE
hi Folded  guifg=NONE guibg=#332722 gui=NONE

hi Normal  guifg=#f8f8f8 guibg=#332722 gui=NONE
hi Boolean  guifg=#a5768e guibg=NONE gui=NONE
hi Character  guifg=#a5768e guibg=NONE gui=NONE
hi Comment  guifg=NONE guibg=NONE gui=NONE
hi Conditional  guifg=#cda869 guibg=NONE gui=NONE
hi Constant  guifg=#a5768e guibg=NONE gui=NONE
hi Define  guifg=#cda869 guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#a5768e guibg=NONE gui=NONE
hi Function  guifg=#c1c1c1 guibg=NONE gui=NONE
hi Identifier  guifg=#f9ee98 guibg=NONE gui=NONE
hi Keyword  guifg=#cda869 guibg=NONE gui=NONE
hi Label  guifg=#817767 guibg=NONE gui=NONE
hi NonText  guifg=#665d59 guibg=#584e4a gui=NONE
hi Number  guifg=#a5768e guibg=NONE gui=NONE
hi Operator  guifg=#cda869 guibg=NONE gui=NONE
hi PreProc  guifg=#cda869 guibg=NONE gui=NONE
hi Special  guifg=#f8f8f8 guibg=NONE gui=NONE
hi SpecialKey  guifg=#665d59 guibg=#584e4a gui=NONE
hi Statement  guifg=#cda869 guibg=NONE gui=NONE
hi StorageClass  guifg=#f9ee98 guibg=NONE gui=NONE
hi String  guifg=#817767 guibg=NONE gui=NONE
hi Tag  guifg=#c1c1c1 guibg=NONE gui=NONE
hi Title  guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo  guifg=#f8f8f8 guibg=NONE gui=inverse,bold
hi Type  guifg=#c1c1c1 guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#cda869 guibg=NONE gui=NONE
hi rubyFunction  guifg=#c1c1c1 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#a5768e guibg=NONE gui=NONE
hi rubyConstant  guifg=#9b859d guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#817767 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#7587a6 guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#7587a6 guibg=NONE gui=NONE
hi rubyInclude  guifg=#cda869 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#7587a6 guibg=NONE gui=NONE
hi rubyRegexp  guifg=#e9c062 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#e9c062 guibg=NONE gui=NONE
hi rubyEscape  guifg=#a5768e guibg=NONE gui=NONE
hi rubyControl  guifg=#cda869 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#7587a6 guibg=NONE gui=NONE
hi rubyOperator  guifg=#cda869 guibg=NONE gui=NONE
hi rubyException  guifg=#cda869 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#7587a6 guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#9b859d guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#dad085 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=NONE guibg=NONE gui=NONE
hi erubyRailsMethod  guifg=#dad085 guibg=NONE gui=NONE
hi htmlTag  guifg=#ac885b guibg=NONE gui=NONE
hi htmlEndTag  guifg=#ac885b guibg=NONE gui=NONE
hi htmlTagName  guifg=#ac885b guibg=NONE gui=NONE
hi htmlArg  guifg=#ac885b guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#a5768e guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#f9ee98 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#dad085 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#c1c1c1 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#7587a6 guibg=NONE gui=NONE
hi yamlAlias  guifg=#7587a6 guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#817767 guibg=NONE gui=NONE
hi cssURL  guifg=#7587a6 guibg=NONE gui=NONE
hi cssFunctionName  guifg=#dad085 guibg=NONE gui=NONE
hi cssColor  guifg=#a5768e guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=NONE guibg=NONE gui=NONE
hi cssClassName  guifg=NONE guibg=NONE gui=NONE
hi cssValueLength  guifg=#a5768e guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#cf6a4c guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE


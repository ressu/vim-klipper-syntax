" Vim syntax file
" Language: Klipper
" Maintainer: Sami Haahtinen <ressu@ressukka.net>

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "klipper"

" Comments
syn match   klipperComment      "#[^\n]*$"
syn match   klipperComment      ";[^\n]*$"

" Booleans
syn keyword klipperBoolean      true false

" Numbers
syn match   klipperNumber       "<\d\+\>"
syn match   klipperFloat        "<\d\+\.\d*\>"

" Sections
syn region  klipperSection      start=/^\[/ end=/\]/ contains=klipperSectionType matchgroup=Section oneline
syn match   klipperSectionType  "\w\+" contained nextgroup=klipperSectionIdentifier
syn match   klipperSectionIdentifier "[^]]\+" contained

syn match   klipperConfigKey      "^\s*\w\+\s*" nextgroup=klipperConfigOperatorSingleLine,klipperConfigOperatorMultiLine
syn match   klipperConfigOperatorSingleLine "[:=]\s*" contained nextgroup=klipperConfigValueSingleLine
syn match   klipperConfigOperatorMultiLine  "[:=]\s*\n" contained skipnl nextgroup=klipperConfigValueMultiLine
syn match   klipperConfigValueSingleLine ".*$" contained contains=klipperBoolean,klipperNumber,klipperFloat,klipperComment
syn region  klipperConfigValueMultiLine start=/^\s*\S/ end=/^\S/ms=s+1,me=s-1 contains=klipperBoolean,klipperNumber,klipperFloat,klipperComment keepend contained

syn match   klipperGcodeMacroName "^\s*\w*gcode\s*\ze[:=]" nextgroup=klipperGcodeMacroKeyword
syn match   klipperGcodeMacroKeyword  "[:=]" contained skipnl nextgroup=klipperGcodeMacroBlock
syn region  klipperGcodeMacroBlock   start=/^\s*\S/ end=/^\S/ms=s+1,me=s-1 contains=klipperGcodeCommand,klipperGcodeParameter,klipperComment,@jinjaTemplate keepend contained

syn match   klipperGcodeCommand "\<[GM]\d\+\>" contained
syn match   klipperGcodeCommand "\<[A-Z_]\+\>" contained
syn match   klipperGcodeParameter "\<[A-Z_]\+=" contained

" Hilights
hi def link klipperComment      Comment
hi def link klipperBoolean      Boolean
hi def link klipperNumber       Number
hi def link klipperFloat        Float
hi def link klipperGcodeCommand Statement
hi def link klipperGcodeMacroName Type
hi def link klipperGcode        String
hi def link klipperSection      Keyword
hi def link klipperSectionName  Type
hi def link klipperConfigKey Type

hi def link klipperConfigOperatorSingleLine Operator
hi def link klipperConfigOperatorMultiLine Operator
hi def link klipperConfigValueSingleLine String
hi def link klipperConfigValueMultiLine String
hi def link klipperGcodeVariable Type
hi def link klipperGcodeMacroKeyword Keyword
hi def link klipperGcodeMacroBlock String
hi def link klipperKeyword      Identifier


" Klipper exclusively enables {} as the varblock matcher
syn region jinjaVarBlock matchgroup=jinjaVarDelim start=/{-\?/ end=/-\?}/ containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaRaw,jinjaString,jinjaNested,jinjaComment

" Include Jinja syntax
let s:current_syntax = b:current_syntax
unlet b:current_syntax
syn include @jinjaTemplate syntax/jinja.vim
let b:current_syntax = s:current_syntax
unlet s:current_syntax

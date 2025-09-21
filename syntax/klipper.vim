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
syn region  klipperSection      start=/^\[/ end=/\]/ contains=klipperSectionType,klipperSectionIdentifier matchgroup=Section
syn match   klipperSectionType  "\w\+" contained nextgroup=klipperSectionIdentifier
syn match   klipperSectionIdentifier "\s\+\w\+" contained
syn match   klipperVariable     "^\s*\w\+\s*" nextgroup=klipperOperatorSingleLine,klipperOperatorMultiLine
syn match   klipperOperatorSingleLine "[:=]\s*[^\n]" contained nextgroup=klipperSingleLineValue
syn match   klipperOperatorMultiLine  "[:=]\s*\n" contained skipnl nextgroup=klipperMultilineValue
syn match   klipperSingleLineValue ".*$" contained contains=klipperBoolean,klipperNumber,klipperFloat,klipperKeyword,klipperComment
syn region  klipperMultilineValue start=/^\s*\S/ end=/^\S/ms=s+1,me=s-1 contains=klipperBoolean,klipperNumber,klipperFloat,klipperKeyword,klipperComment keepend contained

syn match   klipperGcodeVariable "^\s*\w*gcode\s*" nextgroup=klipperGcodeKeyword
syn match   klipperGcodeKeyword  "[:=]" contained skipnl nextgroup=klipperGcodeBlock
syn region  klipperGcodeBlock   start=/^\s*\S/ end=/^\S/ms=s+1,me=s-1 contains=@jinjaTemplate keepend contained

" Keywords
syn keyword klipperKeyword      serial pinter baud restart_method enable_pin step_pin dir_pin rotation_distance full_steps_per_rotation microsteps endstop_pin position_endstop position_max homing_speed sensor_type sensor_pin min_temp max_temp heater_pin control pid_kp pid_ki pid_kd fan_pin max_power shutdown_speed

" Hilights
hi def link klipperComment      Comment
hi def link klipperBoolean      Boolean
hi def link klipperNumber       Number
hi def link klipperFloat        Float
hi def link klipperGcode        String
hi def link klipperSection      Keyword
hi def link klipperSectionName  Type
hi def link klipperVariable     Type
hi def link klipperGcodeVariable Type
hi def link klipperKeyword      Identifier

" Include Jinja syntax
let s:current_syntax = b:current_syntax
unlet b:current_syntax
syn include @jinjaTemplate syntax/jinja.vim
let b:current_syntax = s:current_syntax
unlet s:current_syntax

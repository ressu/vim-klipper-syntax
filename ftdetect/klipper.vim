" ftdetect/klipper.vim

if exists("did_klipper_ftdetect")
  finish
endif
let did_klipper_ftdetect = 1

au BufRead,BufNewFile *.cfg call s:DetectKlipperFile()

function! s:DetectKlipperFile()
  " Only check files with .cfg extension
  if expand('%:e') != 'cfg'
    return
  endif

  " Check the first 20 lines for Klipper keywords
  let lines = getline(1, 20)
  for line in lines
    if line =~? '^\s*\[\s*\(mcu\|printer\|stepper_x\|stepper_y\|stepper_z\|extruder\|heater_bed\|fan\|gcode_macro\)\>'
      set filetype=klipper
      break
    endif
  endfor
endfunction
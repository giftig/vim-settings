function! s:CycleColourScheme()
  let schemes = ["lucius", "oceandeep", "midnight", "Mustang", "darkbone"]
  if exists("g:color_scheme_cycle_pos")
    let g:color_scheme_cycle_pos += 1
  else
    let g:color_scheme_cycle_pos = 1
  endif

  if g:color_scheme_cycle_pos >= len(schemes)
    let g:color_scheme_cycle_pos = 0
  endif

  let scheme = schemes[g:color_scheme_cycle_pos]
  exec "color " . scheme
  echom "Now using colour scheme" . scheme
endfunction

command! CycleColorScheme call s:CycleColourScheme()

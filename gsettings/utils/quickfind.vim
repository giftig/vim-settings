function! s:QuickFind(mod, name)
  return system("~/scripts/quickfind -1 -l -" . a:mod . " " . a:name)
endfunction

function! s:QuickOpen(mod, name)
  let f = call s:QuickFind(mod, name)
  execute "e " . f
endfunction

command! -nargs=1 Qfc call s:QuickOpen("c", "<args>")
command! -nargs=1 Qfd call s:QuickOpen("d", "<args>")
command! -nargs=1 Qf call s:QuickOpen("f", "<args>")

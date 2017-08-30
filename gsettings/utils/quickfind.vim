function! s:QuickFind(mod, name, extra_flags)
  return system("~/scripts/quickfind " . a:extra_flags . " -l -" . a:mod . " " . a:name)
endfunction

function! s:QuickOpen(mod, name)
  let f = s:QuickFind(a:mod, a:name, "-1")
  execute "e " . f
endfunction

command! -nargs=1 Qoc call s:QuickOpen("c", "<args>")
command! -nargs=1 Qod call s:QuickOpen("d", "<args>")
command! -nargs=1 Qo call s:QuickOpen("f", "<args>")

command! -nargs=1 Qfc echo s:QuickFind("c", "<args>", "")
command! -nargs=1 Qfd echo s:QuickFind("d", "<args>", "")
command! -nargs=1 Qf echo s:QuickFind("f", "<args>", "")

function! s:Rstrip(string)
  return substitute(a:string, '\n\+$', '', '')
endfunction

function! s:QuickFind(mod, name, extra_flags)
  return system("~/scripts/quickfind " . a:extra_flags . " -" . a:mod . " " . a:name)
endfunction

" Quick open to the right line/col
function! s:QuickOpen(mod, name)
  let f = s:Rstrip(s:QuickFind(a:mod, a:name, "-1 --coords"))
  if f ==# ""
    echom "QuickOpen: No results found for " . a:name
    return
  endif

  let pieces = split(f, ":")
  let fn = join(pieces[0:-3], ":")
  let lpos = pieces[-2]
  let cpos = pieces[-1]

  exec "e " . fn

  if fn ==# lpos || fn ==# cpos
    return
  endif

  exec lpos
  exec "normal! 0" . cpos . "l"
endfunction

" Simple quick open: searching for files, so no line/col to match
function! s:QuickOpenFile(name)
  let f = s:Rstrip(s:QuickFind("f", a:name, "-1"))
  if f ==# ""
    echom "QuickOpen: No results found for " . a:name
    return
  endif

  exec "e " . f
endfunction

command! -nargs=1 Qoc call s:QuickOpen("c", "<args>")
command! -nargs=1 Qod call s:QuickOpen("d", "<args>")
command! -nargs=1 Qo call s:QuickOpenFile("<args>")

command! -nargs=1 Qfc echo s:QuickFind("c", "<args>", "")
command! -nargs=1 Qfd echo s:QuickFind("d", "<args>", "")
command! -nargs=1 Qf echo s:QuickFind("f", "<args>", "")

function! s:Rstrip(string)
  return substitute(a:string, '\n\+$', '', '')
endfunction

function! s:QuickFind(mode, name, extra_flags)
  let res = system("qf " . a:extra_flags . " -m" . a:mode . " " . a:name)
  if v:shell_error !=# 0
    echom("Quickfind error: " . res)
    return ""
  endif
  return res
endfunction

" Quick open to the right line/col
function! s:QuickOpen(mode, name)
  let res = s:Rstrip(s:QuickFind(a:mode, a:name, "-1 -o coords"))
  if res ==# ""
    echom "QuickOpen: No results found for " . a:name
    return
  endif

  let pieces = split(res, ":")

  " Just in case the filename contained a colon
  let filename = join(pieces[0:-3], ":")
  let line = pieces[-2]
  " qf / ag return 1-indexed col numbers, so subtract 1
  let col = max([0, str2nr(pieces[-1]) - 1])

  exec "e " . filename

  call cursor(line, col)
endfunction

" Simple quick open: searching for files, so no line/col to match
function! s:QuickOpenFile(name)
  let f = s:Rstrip(s:QuickFind("file", a:name, "-1"))
  if f ==# ""
    echom "QuickOpen: No results found for " . a:name
    return
  endif

  exec "e " . f
endfunction

function! s:QuickImport(name)
  let res = s:QuickFind("import", a:name, "-1 -o import")
  if res ==# ""
    echom "QuickImport: No results found for " . a:name
    return
  endif

  let @" = res
  echom "Found " . res
endfunction

" Look for classes or methods depending on what it looks like
function! s:QuickOpenSmart(name)
  return s:QuickOpen("smart", a:name)
endfunction

function! s:QuickOpenUnderCursor()
  return s:QuickOpenSmart(expand("<cword>"))
endfunction

function! s:PopulateQuickList(mode, name)
  cexpr s:QuickFind(a:mode, a:name, '-o quickfix')
endfunction

function! s:UsagesUnderCursor()
  call s:PopulateQuickList("all-usage", expand("<cword>"))
  copen
endfunction

function! s:QuickImportUnderCursor()
  call s:QuickImport(expand("<cword>"))
endfunction

command! -nargs=1 Qoc call s:QuickOpen("class", "<args>")
command! -nargs=1 Qod call s:QuickOpen("function", "<args>")
command! -nargs=1 Qo call s:QuickOpenFile("<args>")
command! -nargs=1 Qos call s:QuickOpenSmart("<args>")
command! -nargs=0 Qouc call s:QuickOpenUnderCursor()

command! -nargs=1 Qfc echo s:QuickFind("class", "<args>", "")
command! -nargs=1 Qfd echo s:QuickFind("function", "<args>", "")
command! -nargs=1 Qf echo s:QuickFind("file", "<args>", "")
command! -nargs=1 Qfu call s:PopulateQuickList("all-usage", "<args>") | copen
command! -nargs=0 Qfuuc call s:UsagesUnderCursor()
command! -nargs=0 Qfiuc call s:QuickImportUnderCursor()

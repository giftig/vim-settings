" Add a package com.example.whatever line when opening a new scala file

function! s:WriteNewScalaFile()
  let f = expand('%:p')
  echom 'Generating new empty scala file ' . f

  if !match(f, '\vsrc/[^/]+/scala')
    return
  endif

  let short_path = substitute(f, '\v^.*src\/[^\/]+\/scala\/(.+)\/.*$', '\1', '')
  let package_line = 'package ' . substitute(short_path, '\v\/', '.', 'g')
  let obj_name = substitute(f, '\v.+\/(.+)\.scala$', '\1', '')

  call setline(1, package_line)
  call setline(2, '')
  call setline(3, 'trait ' . obj_name . ' {')
  call setline(4, '}')
  call setline(5, '')
  call setline(6, 'object ' . obj_name . ' {')
  call setline(7, '}')
endfunction

autocmd BufNewFile *.scala call s:WriteNewScalaFile()

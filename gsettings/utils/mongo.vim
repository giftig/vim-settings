function! s:FetchDoc(...)
  let docId = a:1
  if a:0 ==# 1
    let collection = "order"
  else
    let collection = a:2
  endif

  let q = "db.getCollection('" . collection . "').findOne({_id: ObjectId('" . docId . "')});"
  let script = "var res = " . q . " print(JSON.stringify(res));"

  let res = system("mongo gdam-vagrant:27017/gdam --quiet --eval \"" . script . "\"")
  exec "new"
  exec "normal! Gi" . res
  exec "set filetype=json"
  exec "FmtJson"
endfunction

command! -nargs=+ FetchDoc call s:FetchDoc(<q-args>)

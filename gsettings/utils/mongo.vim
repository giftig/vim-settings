function! s:FetchDoc(...)
  let docId = a:1
  if a:0 ==# 1
    let collection = "order"
  else
    let collection = a:2
  endif

  let q = "db.getCollection('" . collection . "').findOne({_id: ObjectId('" . docId . "')});"
  let script = "var res = " . q . " print(JSON.stringify(res));"
  let host = $MONGO_HOST
  let port = $MONGO_PORT
  let db = $MONGO_DB

  if host ==# ""
    let host = "localhost"
  endif
  if port ==# ""
    let port = "27017"
  endif
  if db ==# ""
    let db = "default"
  endif

  let conn = "--host " .host . " --port " . port . " " . db
  let res = system("mongo " . conn . " --quiet --eval \"" . script . "\"")

  if v:shell_error !=# 0
    echom "Mongo error: " . res
    return
  endif

  exec "new"
  exec "normal! Gi" . res
  exec "set filetype=json"
  exec "FmtJson"
endfunction

command! -nargs=+ FetchDoc call s:FetchDoc(<f-args>)

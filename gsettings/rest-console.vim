let g:vrc_elasticsearch_support = 1

let g:vrc_curl_opts = {'-s': ''}

let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
let g:vrc_response_default_content_type = 'application/json'
let g:vrc_auto_format_response_patterns = {
  \'json': 'python -m json.tool --indent 2',
  \'xml': '~/scripts/format/xml',
\}

" Save and restore folds in *.rest automatically
autocmd BufWinLeave *.rest mkview
autocmd BufWinEnter *.rest silent loadview

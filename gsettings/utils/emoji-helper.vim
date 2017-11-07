command! ReplaceEmojisOnLine s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
command! ReplaceEmojisEverywhere %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

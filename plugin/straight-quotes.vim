if exists('loaded_straight_quotes_plugin') | finish | endif
let loaded_straight_quotes_plugin = 1


" Highlight erroneous curly quotes
autocmd BufWinEnter * match ErrorMsg /[“”‘’]/


function! s:FixQuotes(line1,line2)
    let l:save_cursor = getpos(".")

    " fix double quotes
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/[“”]/"/g'
    " fix single quotes
    silent! execute ':' . a:line1 . ',' . a:line2 . "s/[‘’]/'/g"

    call setpos('.', l:save_cursor)
endfunction


" Run :FixQuotes to substitute curly quotes for straight quotes.
command! -range=% FixQuotes call <SID>FixQuotes(<line1>,<line2>)

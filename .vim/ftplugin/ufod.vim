nnoremap <F5> :call SetViewFormat()<CR>
inoremap <F5> <C-O>:call SetViewFormat()<CR>
vnoremap <F5> <ESC>:call SetViewFormat()<CR>

function! SetViewFormat()
	execute "%s/\\n//g"
	execute "%s/\\//\\r\\t\\//g"
	execute "%s/\\/24/\\/24\\r/g"
	execute "%s/÷/\\r/g"
endfunction

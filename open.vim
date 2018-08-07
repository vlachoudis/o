"=============================================================================
"    Copyright:	Copyright (C) 2017 Vasilis Vlachoudis
"		Permission is hereby granted to use and distribute this code,
"		with or without modifications, provided that this copyright
"		notice is copied with it. Like anything else that's free,
"		fall.vim is provided *as is* and comes with no
"		warranty of any kind, either expressed or implied. In no
"		event will the copyright holder be liable for any damages
"		resulting from the use of this software.
" Name Of File: Open file or link with the appropriate program
"   Maintainer: Vasilis.Vlachoudis@cern.ch
"          URL: http://home.cern.ch/bnv/software
"  Last Change: Saturday, 11 August 2017
"      Version: 1.0.0
"      History: n/a
"=============================================================================
" Has this already been loaded?
if exists('loaded_open')
	finish
endif
let loaded_open = 1

function! s:openuri(cmd, uri)
	if a:uri != ""
		silent exec "!".a:cmd." '".a:uri."'"
	else
		silent exec "!".a:cmd." '".expand('<cfile>')."'"
	endif
endfunction

function! Open(cmd)
	let s:uri = matchstr(expand("<cWORD>"), '[a-z]\+:\/\/[^ >,;\[\]()]*')
	call s:openuri(a:cmd, s:uri)
endfunction

function! OpenRange(cmd) range
	let v_save = @v
	normal! gv"vy
	call s:openuri(a:cmd, @v)
	let @v = v_save
endfunction

map <leader>o :call Open('o')<cr>
map <leader>e :call Open('e')<cr>
vmap <leader>o :call OpenRange('o')<cr>
vmap <leader>e :call OpenRange('e')<cr>

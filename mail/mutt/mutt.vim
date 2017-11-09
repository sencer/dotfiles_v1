setlocal ft=mail

function! MuttIndent(lnum)
  let s:prev_line = getline(a:lnum - 1)
  if s:prev_line =~? '\v^(to|b?cc):.*,$'
    return &shiftwidth
  else
    return indent(a:lnum - 1)
  endif
endfunction
setlocal indentexpr=MuttIndent(v:lnum)


syn match mailTable keepend contains=mailEmail "^\s*|.*" transparent
setlocal noexpandtab autoindent spell spelllang=en,tr fo+=w tw=78 comments+=nb:>
setlocal dictionary+=/usr/share/dict/words
" nmap mm Vygv:!marky <C-R>"<BS><CR><CR>gqG''
nnoremap <C-t> :call search('\v^(To<bar>Bcc<bar>Cc<bar>Subject):')<CR>A
inoremap <C-t> <ESC>:call search('\v^(To<bar>Bcc<bar>Cc<bar>Subject):')<CR>A
call search('^$')
" normal mm

" au BufWritePost <buffer>

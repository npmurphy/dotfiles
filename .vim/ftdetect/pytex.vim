nmap <F6> :call ToggleFiletype()<CR>

function! ToggleFiletype()
  if &ft == 'python'
    set filetype = tex
    "set ft=mypascal
    :call SetSyn("pytex")
  if filetype = python 
    set filetype = python
  else 
  endif 
 endfunction


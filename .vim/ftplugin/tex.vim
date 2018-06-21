"LatexBox stuff
"setlocal foldmethod=syntax

set spell

set tabstop=2
set shiftwidth=2
set nocursorline "speeds up things
set shiftround
set expandtab
set autoindent
"set nosmartautoindent
set nosmartindent



imap <buffer> [[ 		  \begin{
imap <buffer> ]]		  <Plug>LatexCloseCurEnv
nmap <buffer> <F6>		<Plug>LatexChangeEnv
vmap <buffer> <F7>		<Plug>LatexWrapSelection
vmap <buffer> <S-F7>	<Plug>LatexEnvWrapSelection
imap <buffer> (( 		  \eqref{

" this doesnt work, it seems to need to go in .vimrc
" https://github.com/LaTeX-Box-Team/LaTeX-Box/issues/80
"let g:LatexBox_ignore_warnings += ['LaTeX Font Warning']

if has('win32') || has('win64')
  let g:LatexBox_viewer = '' " executes the file with default app
elseif has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let g:LatexBox_viewer = 'open -a Skim'
  endif
else
  let g:LatexBox_viewer = '/home/nmurphy/bin/evince-sync'
endif

let g:LatexBox_latexmk_async=1

function! SyncTex()
	let filename = bufname("%")
	let lineno = line(".")
	for syncfile in split(system('zgrep -l "' . filename . '" *.synctex.gz'), "\n")
		let pdffile = substitute(syncfile, ".synctex.gz$", ".pdf", "")
		exec 'silent ! python /usr/lib/gedit/plugins/synctex/evince_dbus.py ' .
			\ '"' . pdffile . '" ' . lineno . ' "' . filename . '"'
	endfor
endfunction
map <buffer> <LocalLeader>e :call SyncTex()<CR>

"function! LatexEvinceSearch()
" let cmd = expand("python ~/bin/LaTeXTools/evince/evince_forward_search") . " " . fnamemodify( LatexBox_GetOutputFile(), ":p:." ) . " " . line('.') . " " . expand("%:p")
"  "fnamemodify modifies file names, ":p:." gives us the current file so
"  "file src/this.tex will be returned (src is in pwd)
"  "%:p" gives the full path
"  let output = system(cmd)
"endfun
"command! LatexEvinceSearch call LatexEvinceSearch()
"/usr/lib/gedit/plugins/synctex/evince_dbus.py 
"this file didnt exit the script after running, so have to run a modified
"echo cmd
" let cmd = 'evince_forward_search ' . fnamemodify(Tex_GetMainFileName(), ":p:r") .  '.pdf ' . line(".") . ' ' . expand("%:p")

"execute "!python ~/bin/evince_dbus.py  " . fnamemodify( LatexBox_GetOutputFile(), ":p:." ) . " " . line('.') . " %:p "

function! StartEvinceReverseSearch()
  let cmd = expand("~/bin/evince_dbus.py") . " EVINCE " .  fnamemodify( LatexBox_GetOutputFile(), ":p:." ) . " " . expand("%:p")
  echo cmd
  let output = system(cmd)
endfun


nmap <Leader>ls :call LatexEvinceSearch()<CR>
nmap <Leader>lr :call StartEvinceReverseSearch()<CR>

" colour in the unicode slightly differently than normal math 
hi Conceal guifg=#ffc389 guibg=#3f3f3f
" cfb49c I think this is closer to orginial math mode

" section jumping
" http://vim.wikia.com/wiki/Section_jump_in_Latex
noremap <buffer> <silent> ]j :<c-u>call TexJump2Section( v:count1, '' )<CR>
noremap <buffer> <silent> [j :<c-u>call TexJump2Section( v:count1, 'b' )<CR>
function! TexJump2Section( cnt, dir )
  echo "NIALL:" . cnt . dir
  let i = 0
  let pat = '^\\\(part\|chapter\|\(sub\)*section\|paragraph\)\>\|\%$\|\%^'
  let flags = 'W' . a:dir
  while i < a:cnt && search( pat, flags ) > 0
    let i = i+1
  endwhile
  let @/ = pat
endfunction


"Latex suite stuff
"see also ~/.vim/after/ftplugin/tex/texrc
" and ~/.vim/after/ftplugin/tex/afterls.vim
"
"let g:Tex_IgnoredWarnings =
"    \'Underfull'."\n".
"    \'Overfull'."\n".
"    \'specifier changed to'."\n".
"    \'You have requested'."\n".
"    \'LaTeX Font Warning'."\n".
"    \'LaTeX Warning: Marginpar on page'."\n".
"    \'LaTeX Warning: Command %.%# has changed.'."\n".
"    \'Missing number, treated as zero.'."\n".
"    \'There were undefined references'."\n".
"    \'Citation %.%# undefined'
"
"let g:Tex_IgnoreLevel = 7


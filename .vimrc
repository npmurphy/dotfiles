" So filetype detection is invoked AFTER pathogen functions  
set nocompatible               " be iMproved
scriptencoding utf-8 
set encoding=utf-8

filetype off 


"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"if has('win32') || has('win64')
"  set rtp+=~/vimfiles/bundle/vundle/
"  let path='~/vimfiles/bundle'
"  call vundle#rc(path)
"  "call vundle#rc('$HOME/vimfiles/bundle/')
"  " this stoped a lot of things working
"  "set shell=cmd
"  "set shellcmdflag=/c
"  "set shellxquote=
"  let $MYVIMRC='dotfiles/.vimrc'
"else
"  " Usual quickstart instructions
"  set rtp+=~/.vim/bundle/vundle/
"  call vundle#rc()
"endif
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Make vim more IDE like 
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar.git'
" git 
Plugin 'tpope/vim-fugitive' 
Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'git://repo.or.cz/vcscommand.git'
Plugin 'majutsushi/tagbar' 
Plugin 'scrooloose/syntastic'

" Themes 
Plugin 'jnurmine/Zenburn'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'Lokaltog/powerline-fonts'

" Productivity 
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'tpope/vim-surround'
"Plugin 'Lokaltog/vim-easymotion'

" Languages 
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'vimoutliner/vimoutliner'
Plugin 'rainux/vim-vala'
Plugin 'petRUShka/vim-opencl.git'
"Plugin 'kongo2002/fsharp-vim.git'
Plugin 'fsharp/fsharpbinding' ", {'rtp': 'vim/'}
Plugin 'file:///home/nmurphy/.vim/bundle/fsharpbinding-vim'

"Plugin 'derekwyatt/vim-scala'
"" JavaScript 
Plugin "pangloss/vim-javascript"
Plugin 'clausreinke/typescript-tools'
Plugin 'leafgarland/typescript-vim'
"" Python
Plugin 'davidhalter/jedi-vim' 
Plugin 'ivanov/vim-ipython'
"Bundle 'klen/python-mode'

" Writing tools 
"Bundle 'vim-scripts/LanguageTool'
"Bundle 'davidbeckingsale/writegood.vim.git'
"Bundle 'DamienCassou/textlint'

call vundle#end()

" Recognise file types
filetype plugin indent on
set showbreak=>>>
"set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ 
"let &showbreak=repeat(' ', 14)

set fileformat=unix
set backspace=indent,eol,start

au BufRead,BufNewFile *.proto setfiletype proto 

au BufRead *.tex set syntax=pytex

let g:LatexBox_Folding = 1
let g:LatexBox_fold_envs = 1


let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
"eclim does XML validation on saving which is a pain if you dont have
"a dtd
"let g:EclimXmlValidate=0

"syntax higlighting
syntax on
colorscheme zenburn
"desert
"font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  elseif has("gui_win32") || has('gui_win64')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h9
  endif
endif
let g:Powerline_symbols = 'fancy' 
set laststatus=2 
"Now using powerline
":set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
":set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 

" Fat fingers
noremap <F1> <Esc>
:command W w  "set W to be save too 

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

"line numbers on the left
set number
set cursorline

" Suddenly the mouse disappeared, may be due to synergy. 
set nomousehide

" sets the current directory to be the current file
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"IndentGuidesEnable

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

""Move 5 lines up or down and center.
map <C-j> 5jzz 
map <C-k> 5kzz 
"note that C-S-j seem to be the same 


"pressing X in visual mode searchs for that string.
:vmap X y/<C-R>"<CR>

"control + i in command mode to insert a single character and return to
"command mode
map <C-i> i_<Esc>r


"This runs the script "stamp" on the the pdf of the current file.
"Its is only for tex files
"triggered by \sp 
"runs stamp
"%:r gives the filename minus the extension 
"appends ".pdf" and presses "enter" 
au FileType tex nmap <leader>sp : !stamp %:r.pdf<CR>
au FileType tex nmap <leader>sp : !stamp %:r.pdf<CR>

au BufRead,BufNewFile *.pytex nmap <F7> :call ToggleFiletype()<CR>                                        
au BufRead,BufNewFile *.pytex set filetype=tex  
au BufRead,BufNewFile *.pytex set syntax=pytex  

function! ToggleFiletype()                                                  
  if &ft == 'python'                                                        
    set filetype=tex                                                      
    "set ft=mypascal                                                        
    set syntax=pytex
  elseif &ft == 'tex'                                                                    
    set filetype=python
    set syntax=pytex
  else 
    echo "not a pytex file?" 
  endif
endfunction


"visual indicator of 80 colums
"highlight the 80 char gutter
set cc=80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/




"" NIALL: I dont remember what this is about
" IMPORTANT: grep will sometimes skip displaying the file name if you
"  search in a singe file. This will confuse Latex-Suite. Set your grep
"  program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

"allways past without self indenting
"set paste

" use indents of 4 spaces, and have them copied down lines:
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent

" turn off word wrap
" set nowrap

"while searching for a word it jumps to the current match like firefox
set incsearch

"shows partialy typed commands in the status line
set showcmd

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

set hlsearch "highlight searched for terms


" turn spelling off by default (spelling is set by ftplugin)
"set spell 
let dialect='UK'
set spl=en_gb spell


"toggles the menu bar(m) and toolbar (T)
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
                         \set guioptions-=T <Bar>
                         \set guioptions-=m <Bar>
                    \else <Bar>
                         \set guioptions+=T <Bar>
                         \set guioptions+=m <Bar>
                    \endif<CR>
"toggle spelling with F3 key
map <F3> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
map <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
"vmap <F4> <esc>:NERDTreeToggle<cr>
"imap <F4> <esc>:NERDTreeToggle<cr>

"map <F5> :TlistToggle<CR> "Ctags togle
map <F5> :TagbarToggle<CR>



" make the quickfix list allways be on the bottom, 
" not the bottom right vsplit pane 
" (yes the botright command seems oddly named?)
botright cwindow

""""""""""""""
"" Tags
""""""""""""""
 
let g:tagbar_left = 1 " when on the right, quickfix goes there
let g:tagbar_compact = 1 "less empty lines
let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 'c:chapter',
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0
\ }
"\ 'deffile' : expand('<sfile>:p:h:h') . '/ctags/latex.cnf' " dont need this
"as we are in 

""""""""""""""""""""
"" Latex
""""""""""""""""""""
"let g:LatexBox_ignore_warnings = g:LatexBox_ignore_warnings + ['Font shape', 'Size substitutions']
"let g:tex_fold_enabled=1
"let g:tex_flavor= "latex"
"let g:Tex_UseUtfMenus = 1
"
"pdfsync is in the ftplugin file
"map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
		"\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>


""""""""""""""""""""
"" Modern keyboard short cuts for copy past and save
"" Crtl + S for saving
"" Recommend an imap for the same functionality so one can hit ctrl-s without 
"" having to make sure one isn't in insert mode:
":imap <c-s> <esc><c-s>
"" If one prefers to return to insert mode after the save, the following
"" mapping may be used instead:
"imap <c-s> <c-o><c-s>
"" Has the nice advantage of allowing one to save in the middle of typing.
"" (I actually have two different keys mapped, one for each of the two above
"" behaviours.)
":imap <c-s> <c-o><c-s><cr>
inoremap <C-S>	<C-O>:update<CR>

"make ctrl v be paste in mode
"http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+



""""""""""""""""""""
"" Auto correct
""""""""""""""""""""
"" correct my common typos without me even noticing them:
"abbreviate teh the



""""""""""""""""""""
"" Full screen
""""""""""""""""""""
"To achieve a full screen editing window on any version of gvim you can do:
"
"  :set go-=m go-=T go-=l go-=L go-=r go-=R go-=b go-=F
"  :set lines=999 columns=999
"
"    * 'guioptions': We remove the flags one-by-one to avoid problems if they appear in the option in a different order, or if some of them do not appear at all. By choosing which ones to remove (or not) you can customize your own flavour of "full-screen Vim".
"
"  m   when present, menu bar is present
"  T   present, toolbar is present on versions which support it (W32, GTK1, GTK2, Motif, Photon, kvim)
"  l   when present, left scrollbar is always present
"  L   when present, left scrollbar is present if there is a vertical split
"  r   when present, right scrollbar is always present
"  R   when present, right scrollbar is present if there is a vertical split
"  b   when present, bottom scrollbar is present
"  F   when present, gvim (Motif) will display a footer
"    * 'lines', 'columns': setting them to a large value will maximize the window.
"For more, see:
"  :help 'guioptions'
"  :help 'lines'
"  :help 'columns'
"full screen mode (kills normal vim)
":set lines=999 columns=999


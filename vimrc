" based on http://github.com/jferris/config_files/blob/master/vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set nowritebackup
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching


" Use system keyboard instead
set clipboard=unnamed

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Emacs commands
:cnoremap <C-a> <Home>
:cnoremap <C-d> <Delete>


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Switch wrap on for everything
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set wrap
set linebreak
set nolist " list disables linebreak
set textwidth=0
set wrapmargin=0

" Wrap text for markdown files
" https://robots.thoughtbot.com/wrap-existing-text-at-80-characters-in-vim
" au BufRead,BufNewFile *.md setlocal textwidth=80

" for syntasic / pathogen
" call pathogen#infect()

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " https://github.com/jelera/vim-javascript-syntax
  " Enable folding for JS
  " autocmd FileType javascript call JavaScriptFold()

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else

  set autoindent " always set autoindenting on

endif " has("autocmd")

if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevel=10
  set foldnestmax=10
  set foldcolumn=2
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
endif

" https://github.com/nelstrom/vim-markdown-folding
" Folding for markdown
" set nocompatible
" if has("autocmd")
"   filetype plugin indent on
" endif

" if has("gui_running")
"   if has("gui_macvim")
"     set guifont=Monaco:h12
"   endif
" endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader = ","


" Up and down single display lines
map <Down> gj
map <Up> gk

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel<CR>
map <Leader>c :Rcontroller<CR>
map <Leader>v :Rview<CR>
" map <Leader>u :Runittest
" map <Leader>f :Rfunctionaltest
" map <Leader>tm :RTmodel
" map <Leader>tc :RTcontroller
" map <Leader>tv :RTview
" map <Leader>tu :RTunittest
" map <Leader>tf :RTfunctionaltest
map <Leader>sm :RSmodel<CR>
map <Leader>sc :RScontroller<CR>
map <Leader>sv :RSview<CR>
map <Leader>su :RSunittest<CR>
map <Leader>sf :RSfunctionaltest<CR>

" Buffer Explorer
map <C-b> :BufExplorer<CR>

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

" Mustache - https://github.com/mustache/vim-mustache-handlebars
let g:mustache_abbreviations = 1
au! BufRead,BufNewFile,SessionLoadPost *.hbs         setfiletype mustache.html

" Improve markdown
" https://github.com/tpope/vim-markdown
let g:markdown_fenced_languages = ['html', 'js', 'css', 'objective-c', 'bash=sh', 'swift']

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Adds tags around line
nmap tp <Plug>Yssurround<p>
nmap td <Plug>Yssurround<div>
nmap tD <Plug>YSsurround<div>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" CtrlP's ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|hg|\.svn|dist|node_modules|vendor|tmp)$',
  \ 'file': '\v\.(exe|so|dll|tmp)$',
  \ }

let g:ctrlp_show_hidden = 1

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

" Maps autocomplete to tab
" imap <Tab> <C-N>

imap <C-L> <Space>=><Space>
imap <D-CR> <C-O>o

" Highlight trailing whitespace
" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
set list
set listchars=trail:.
autocmd InsertEnter * set listchars=
autocmd InsertLeave * set listchars=trail:.

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>



" Edit routes kj
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" Setting files to ignore
set wildignore=tmp/*

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
set tags=./tags;

let g:fuf_splitPathMatching=1

" Disable folder for markdown
let g:vim_markdown_folding_disabled=1

" Open URL
command! -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
    if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>

" Relative numbers for absolute
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


" http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
" Space will toggle folds!
nnoremap <space> za

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" Turn on/off spell check
map <C-S> :setlocal spell! spelllang=en_us<cr>

" Save swp files to /tmp
" http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
" http://winterdom.com/2009/02/vimswapfiles
set directory=/tmp//
set backupdir=/tmp//

" Swapping lines
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" Mouse support in terminal
" set mouse=a

" Local/Global Replace
" https://stackoverflow.com/questions/597687/changing-variable-names-in-vim
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" https://gist.github.com/AndrewRayCode/048616a2e3f5d1b5a9ad
function! Refactor()
    call inputsave()
    let @z=input("What do you want to rename '" . @z . "' to? ")
    call inputrestore()
endfunction

" Locally (local to block) rename a variable
nmap <Leader>r "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x

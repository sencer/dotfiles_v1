call plug#begin('~/.config/nvim/bundle')

Plug '~/software/vim-vmd'
Plug '~/software/vim-eval'
Plug 'morhetz/gruvbox'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

Plug 'AndrewRadev/sideways.vim'
Plug 'tommcdo/vim-exchange'
Plug 'bruno-/vim-vertical-move'
Plug 'idbrii/textobj-word-column.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-repeat'
Plug 'kana/vim-niceblock'
Plug 'salsifis/vim-transpose'
Plug 'arecarn/selection.vim'
Plug 'arecarn/crunch.vim'
Plug 'sencer/vis'
Plug 'gioele/vim-autoswap'

Plug 'rstacruz/vim-closer'
Plug 'idbrii/vim-endoscope'
Plug 'tpope/vim-endwise'
Plug 'SirVer/UltiSnips'
Plug 'sencer/vim-snippets'

Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'wellle/tmux-complete.vim'
Plug 'kassio/neoterm'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" if has('nvim')
  Plug 'roxma/nvim-completion-manager'
  Plug 'roxma/ncm-clang'
  if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
" else
  " Plug 'maralla/completor.vim'
" endif

Plug '~/software/vim-gnuplot'
Plug 'sencer/abinitio.vim'
Plug 'sencer/lammps.vim'
Plug 'tweekmonster/braceless.vim'

Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'kshenoy/vim-signature'
Plug 'simnalamburt/vim-mundo'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-tmux-navigator'
Plug 'stefandtw/quickfix-reflector.vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'sencer/wordnet.vim'
Plug 'reedes/vim-textobj-sentence'
Plug 'tpope/vim-abolish'
Plug 'kana/vim-textobj-user'
Plug 'Shougo/echodoc.vim'
Plug 'fs111/pydoc.vim'
Plug 'purplep/python-syntax'
Plug 'mhinz/vim-hugefile'
Plug 'tpope/vim-vinegar'

call plug#end()

set background=dark
colorscheme gruvbox
set termguicolors
hi link BracelessIndent ColorColumn

if exists('$CURRENTSERVER')
  setlocal eventignore=BufEnter,VimEnter
endif

filetype plugin indent on
syntax on
runtime! macros/matchit.vim

" netrw?
" let loaded_netrwPlugin = 1
nnoremap cof :Vexplore!<CR>
let g:netrw_home = $HOME . '/.dotfiles/tmp'
let g:netrw_browsex_viewer = 'xdg-open'
let g:netrw_list_hide=netrw_gitignore#Hide().'.*\.sw.$,.*\.pyc$,.*~'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_preview = 1
let g:netrw_altv = 0
let g:netrw_winsize = 25

" huge file
let g:hugefile_trigger_size = 5

" ultisnips
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/bundle/vim-snippets/UltiSnips"
let g:UltiSnipsEditSplit = "vertical"

" neoterm
let g:neoterm_size=10
let g:neoterm_automap_keys = "<F1>"
let g:neoterm_autoinsert = 1
let g:neoterm_fixedsize = 1
let g:neoterm_direct_open_repl = 1
nnoremap <F2> :TREPLSendLine<CR>
vnoremap <F2> :TREPLSendSelection<CR>
nnoremap <F3> :TREPLSendFile<CR>

" ale
let g:ale_sign_column_always = 1
let g:ale_sign_error   = '⚑'
let g:ale_sign_warning = '⚠'
let g:ale_fixers = {
      \     'python': [
      \     'autopep8',
      \     'add_blank_lines_for_python_control_statements',
      \     'isort',
      \     'remove_trailing_lines',
      \     'trim_whitespace'
      \   ]
      \ }

" crunch
let g:crunch_result_type_append = 0
let g:crunch_user_variables = {
      \ 'e': 2.71828182846,
      \ 'pi': 3.14159265359,
      \ 'b2a': 0.529177249,
      \ 'ev': 13.6056923,
      \ }

" vcoolor
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<F5>'

" other
let g:lmpdoc_path = "/opt/software/lammps/doc/src/"
let g:echodoc#enable_at_startup = 1
let g:surround_no_insert_mappings = 1
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_use_lcd = 1
let g:tcl_extended_syntax = 1
let g:tex_flavor = "latex"

set whichwrap+=<,>,[,],~,h,l

set scrolloff=3
set sidescrolloff=8
set clipboard^=unnamedplus

set cpoptions+=J

set shell=/bin/zsh

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

set gdefault
set ignorecase
set smartcase

set modeline

set virtualedit=block,onemore

set number
set relativenumber

set nowrap

set list
set listchars=trail:·,eol:¬,tab:»-,extends:❯,precedes:❮,nbsp:∴
set showbreak=…

set undofile
set undodir=~/.dotfiles/tmp/undodir
set undolevels=1000
set undoreload=1000

set directory=~/.dotfiles/tmp/swap

set colorcolumn=81
set showtabline=1
set wildmode=longest:full,full
set showmatch
set showcmd
set noshowmode
set noerrorbells
set visualbell
set lazyredraw

set mouse=a
set mousemodel=popup_setpos

set infercase
set wildignore=*.o,*~,*.sw*
set wildignorecase
set thesaurus+=~/.config/nvim/dictionaries/moby
set dictionary+=/usr/share/dict/words

set autoread
set switchbuf=useopen,usetab
set hidden

set autoindent
set smartindent
set copyindent
set cindent
set cinoptions+=l1

set foldlevel=1

set grepprg=rg\ --vimgrep

set shortmess+=c

nmap Y y$
noremap Q <C-L>
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
vnoremap . :norm.<CR>

map <Space> <nop>
map <Space> <Leader>

nnoremap v <C-v>
nnoremap <C-v> v
vnoremap v <C-v>
vnoremap <C-v> v

nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent> cog :GitGutterToggle<CR>
nnoremap <silent> coe :ColorToggle<CR>
nnoremap <silent> coz :MundoToggle<CR>
nnoremap <silent> coo :RainbowParentheses!!<CR>

nmap cx <Plug>(Exchange)
nmap gl :SidewaysRight<CR>
nmap gh :SidewaysLeft<CR>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

vmap <Enter> <Plug>(LiveEasyAlign)
nmap ga <Plug>(EasyAlign)

inoremap <C-U> <C-g>u<C-U>
inoremap ;; <Esc>g_a;
imap <A-=> <C-g>u<C-o>vBg=

vmap <Leader><Space> gc
nmap <Leader><Space> gcc

nnoremap <silent> <Leader>w :up!<CR>
nnoremap <silent> <Leader>x :x!<CR>
nnoremap <expr> <Leader>z winnr('$')==1?':tabclose<CR>':':tab split<CR>'
nnoremap <expr> <Leader>q len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))==1?':q<CR>':':bw<CR>'

nnoremap [h <Plug>(GitGutterPrevHunk)
nnoremap ]h <Plug>(GitGutterNextHunk)

nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>ga :Gcommit --amend<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <Leader>a :Ag <C-r>=expand("<cword>")<CR><CR>
nnoremap <Leader>A :Ag <C-r>=expand("<cWORD>")<CR><CR>
nnoremap <Leader>/ :Ag
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>c :BCommits<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>j :History<CR>
nnoremap <Leader>m :Marks<CR>
nnoremap <Leader>s :Snippets<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>; :History:<CR>
nnoremap <Leader>: :Commands<CR>

if has('nvim')
  tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
  tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
  tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
  tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<CR>
  tnoremap <silent> <C-w> <C-\><C-n><C-w>
  tnoremap <silent> <C-x> <C-\><C-n><C-w>c
endif

augroup RNU
  autocmd!
  autocmd RNU InsertEnter * set norelativenumber
  autocmd RNU InsertLeave * set relativenumber
augroup END

augroup vimrc
  autocmd!

  autocmd vimrc FileType awk setl commentstring=#\ %s
  autocmd vimrc FileType tcl setl foldmethod=syntax
  autocmd vimrc FileType vim setl keywordprg=:help
  autocmd vimrc FileType python
        \ compiler python |
        \ BracelessEnable +indent +fold +highlight

  autocmd vimrc FileType python,tex,latex,vim,tcl
        \ let b:closer = 1|
        \ let b:closer_flags = '([{'

  autocmd vimrc BufWritePost $MYVIMRC source %

  if has('nvim')
    autocmd vimrc BufRead,BufNewFile * exec ':Tmap '. &makeprg
  endif

  autocmd vimrc BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif
  
  autocmd BufNewFile,BufReadPre /dev/shm/* setl noswapfile nobackup noundofile

  au FileType *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif

augroup END

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" set status line
let s:norm = '#004466'
let s:ins  = '#446600'
let s:rep  = '#660044'

function! s:STLColor(mode)
  if a:mode == 'i'
    exec "hi statusline guifg=".s:ins
  elseif a:mode == 'r'
    exec "hi statusline guifg=".s:rep
  else
    exec "hi statusline guifg=".s:norm
  endif
endfunction
exec "hi statusline guifg=".s:norm

augroup STL
  autocmd!
  autocmd STL InsertEnter  * call <SID>STLColor(v:insertmode)
  autocmd STL InsertChange * call <SID>STLColor(v:insertmode)
  autocmd STL InsertLeave  * exec "hi statusline guifg=".s:norm
augroup END

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '' : printf(
        \   '%dW %dE |',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

let &stl='%n [%{substitute(getcwd(), $HOME, "~", "")}] %f%( [%M%R%H]%)%='
let &stl.='%{LinterStatus()} %{tagbar#currenttag("%s | ", "", "f")}'
let &stl.='%P, col %c %y%q'

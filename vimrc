let mapleader = " "

set nocompatible
filetype off

au BufWritePost .vimrc so $MYVIMRC

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'int3/vim-extradite'
Plug 'slim-template/vim-slim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'cespare/vim-toml'
Plug 'pest-parser/pest.vim'
Plug 'junegunn/fzf'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-cucumber'
Plug 'groenewege/vim-less'
Plug 'jgdavey/vim-blockle'
Plug 'severin-lemaignan/vim-minimap'
Plug 'dhruvasagar/vim-dotoo'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mtth/scratch.vim'
Plug 'elmcast/elm-vim'
Plug 'ledger/vim-ledger'
Plug 'vim-scripts/EnvEdit.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'b4b4r07/vim-hcl'
Plug 'chr4/nginx.vim'
Plug 'Ron89/thesaurus_query.vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'aklt/plantuml-syntax'
Plug 'flowtype/vim-flow'
Plug 'skanehira/gh.vim'

call plug#end()

filetype plugin indent on

" Brief help
" :PluginList - list plugins
" :PluginInstall(!) - install (update) plugins
" :PluginSearch(!) - search (or refresh cache first) for foo
" :PluginClean(!) - confirm (or auto-approve) removal of unused plugins
"
" :h vundle for more details

" plugin config options

let g:ale_linters = {'rust': ['rustfmt', 'analyzer']}

let g:ale_rust_analyzer_config = {
      \ 'diagnostics': { 'disabled': ['unresolved-import'] },
      \ 'cargo': { 'loadOutDirsFromCheck': v:true },
      \ 'procMacro': { 'enable': v:true },
      \ 'checkOnSave': { 'command': 'clippy', 'enable': v:true }
      \ }

let g:airline#extensions#ale#enabled = 1

" let g:rustfmt_autosave = 1

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Ack.vim

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" non-plugin stuff below
set number
set clipboard=unnamed
" set background=light

set noerrorbells
set noswapfile
set nobackup

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif

syntax on

" NETRW config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

autocmd Filetype gitcommit setlocal spell textwidth=72

autocmd FileType markdown setlocal spell
autocmd Filetype markdown setlocal makeprg=pandoc\ --pdf-engine\=xelatex\ -o\ %.pdf\ %

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction

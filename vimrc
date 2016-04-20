let mapleader = " "

set nocompatible
filetype off

au BufWritePost .vimrc so $MYVIMRC

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" required, start vundling
Plugin 'gmarik/Vundle.vim'

"Add my plugins here
Plugin 'tpope/vim-sensible'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'int3/vim-extradite'
Plugin 'tpope/vim-commentary'
Plugin 'slim-template/vim-slim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'rust-lang/rust.vim'
Plugin 'timonv/vim-cargo'
Plugin 'cespare/vim-toml'
Plugin 'nginx.vim'
Plugin 'scrooloose/syntastic'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-cucumber'
Plugin 'groenewege/vim-less'
Plugin 'jgdavey/vim-blockle'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'dhruvasagar/vim-dotoo'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mtth/scratch.vim'
Plugin 'elmcast/elm-vim'
Plugin 'ledger/vim-ledger'
Plugin 'vim-scripts/EnvEdit.vim'

call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList - list plugins
" :PluginInstall(!) - install (update) plugins
" :PluginSearch(!) - search (or refresh cache first) for foo
" :PluginClean(!) - confirm (or auto-approve) removal of unused plugins
"
" :h vundle for more details

" plugin config options

let g:syntastic_ruby_checkers          = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec      = '~/.rbenv/shims/rubocop'
let g:syntastic_ruby_rubocop_quiet_messages = { "level" : [] }

let g:syntastic_slim_checkers = ['slimrb']

let g:rustfmt_autosave = 1

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" non-plugin stuff below
set number
set clipboard=unnamed
set background=light

set noerrorbells
set noswapfile
set nobackup

syntax on

autocmd Filetype gitcommit setlocal spell textwidth=72

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


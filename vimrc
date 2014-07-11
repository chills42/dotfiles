set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" required, start vundling
Plugin 'gmarik/Vundle.vim'

"Add my plugins here
Plugin 'tpope/vim-sensible'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'slim-template/vim-slim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'wting/rust.vim'

call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList - list plugins
" :PluginInstall(!) - install (update) plugins
" :PluginSearch(!) - search (or refresh cache first) for foo
" :PluginClean(!) - confirm (or auto-approve) removal of unused plugins
"
" :h vundle for more details

" non-plugin stuff below
set background=light
colorscheme solarized
syntax on

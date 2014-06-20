set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" required, start vundling
Plugin 'gmarik/Vundle.vim'

"Add my plugins here
Plugin 'Solarized'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim/sleuth'
Plugin 'slim-template/vim-slim.git'
Plugin 'ekalinin/Dockerfile.vim'

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

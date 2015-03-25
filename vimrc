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
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'tpope/vim-commentary'
Plugin 'slim-template/vim-slim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'wting/rust.vim'
Plugin 'nginx.vim'
Plugin 'scrooloose/syntastic'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-cucumber'
Plugin 'groenewege/vim-less'


call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList - list plugins
" :PluginInstall(!) - install (update) plugins
" :PluginSearch(!) - search (or refresh cache first) for foo
" :PluginClean(!) - confirm (or auto-approve) removal of unused plugins
"
" :h vundle for more details

set number
set clipboard=unnamed

" non-plugin stuff below
set background=light
syntax on

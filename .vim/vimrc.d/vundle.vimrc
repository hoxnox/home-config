set nocompatible

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage itself
Bundle 'gmarik/vundle'

" bundles
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/indexer.tar.gz'
" --- indexer dependency
Bundle 'vim-scripts/vimprj'
Bundle 'vim-scripts/DfrankUtil'
" ----

" Brief help
" :BundleList          - list
" :BundleInstall(!)    - install(udpate)
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" :h vundle


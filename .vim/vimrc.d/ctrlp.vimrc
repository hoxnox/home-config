" CtrlP plugin config

" Change the default mapping and the default command to invoke CtrlP:

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <c-l> :CtrlPTag<CR>

"When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:

"let g:ctrlp_working_path_mode = 'ra'
"'c' - the directory of the current file.
"'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
"'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
"0 or '' (empty string) - disable this feature.
"
"Define additional root markers with the g:ctrlp_root_markers option.
"
"Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore:
"
" set wildignore+=*/tmp/*,*build/*,*.so,*.swp,*.zip
"
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn))|build$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"Use a custom file listing command:
"
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"Check :help ctrlp-options for other options.

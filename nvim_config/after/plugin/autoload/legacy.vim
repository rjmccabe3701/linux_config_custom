
" Highlight on yank
au TextYankPost * silent! lua vim.highlight.on_yank {timeout=500}

"Easy opening of directories
" From:
" http://stackoverflow.com/questions/1708623/opening-files-in-the-same-folder-as-the-current-file-in-vim
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

autocmd FileType * setlocal expandtab shiftwidth=3 softtabstop=3
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType make setlocal noexpandtab
autocmd FileType go setlocal noexpandtab
autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cycle thru relativenumber + number, number (only) and no numbering
function! Cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

nnoremap <silent> <Leader>R :call Cycle_numbering()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use Escape to exit terminal "insert" mode
tnoremap <Esc> <C-\><C-n>
"Send Esc to terminal
tnoremap <C-v><Esc> <Esc>

"The Mozilla style is a pretty sane fallback if .clang-format
" DNE in the working dir
" let g:clang_format_fallback_style = 'Google'
" vmap <C-Y> :py3f ~/.vim/clang-format.py<cr>
"
"From https://jdhao.github.io/2020/04/19/nvim_cpp_and_c_completion/
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="Google"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
vmap <C-Y> :Neoformat<cr>

"Universal reformatting (uses the vim-autoformat plugin), will
" call into clang-format for C/C++, autopep8 for python, etc.
vmap <C-U> :Autoformat<CR>

"Recursive git grep
function! Ggrepr(myargs)
   echo a:myargs
   exe 'Ggrep --recurse-submodules' a:myargs
   " exe 'echo a:myargs'
endfunction
" com -nargs=1 Ggrepr call Ggrepr(<args>)
com -nargs=1 Ggrepr call Ggrepr(<f-args>)
" command! Ggrepr call Ggrepr(<args>)

"Shortcut to "git grep" and "git grep --recurse-submodules
nmap <C-\>\ :Ggrep <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>r :Ggrepr <C-R>=expand("<cword>")<CR><CR>

"Block comment code in C/C++
autocmd FileType cpp,c let b:surround_45 = "#if 0\n\r\n#endif\n"

"Code block for markdown
autocmd FileType markdown let b:surround_45 = "```\n\r\n```"

"Block comment for python
autocmd FileType python let b:surround_45 = "\"\"\"\n\r\n\"\"\""


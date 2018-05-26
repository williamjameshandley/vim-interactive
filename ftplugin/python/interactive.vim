" Vim integration with interactive prompts
"
" Using this plugin, you can send lines or whole files for an interactive
" prompt to execute. 
"
" -----------------
" Quickstart Guide:
" -----------------
"   :source interactive.vim
"   :Iipython
"
" written by Will Handley (williamjameshandley@gmail.com)
"
if !has('python')
    " exit if python is not available.
    finish
endif

" Import the module
python << EOF
import vim
import sys
vim_interactive_path = vim.eval("expand('<sfile>:h')")
sys.path.append(vim_interactive_path)
from interactive import *
EOF

" Setup plugin mappings for the most common ways to interact with ipython.
noremap  <Plug>(IRunLine)  :python server.runline()<CR>
noremap  <Plug>(IRunLines) :python server.runlines()<CR>

map  <buffer> <silent> <C-s> <Plug>(IRunLine)
imap <buffer> <silent> <C-s> <C-o><Plug>(IRunLine)
xmap <buffer> <silent> <C-S> <Plug>(IRunLines)

" Setup plugin mappings for the most common ways to interact with ipython.
command!  Iipython :py server=IPython()
command!  Ipython :py server=Python()
command!  Ibash :py server=Bash()
command!  Imaple :py server=Maple()

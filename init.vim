call plug#begin('~/.local/share/nvim/plugged')

" Auto-complete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Auto-complete for python
Plug 'zchee/deoplete-jedi'

" Status-bar plugin
Plug 'vim-airline/vim-airline'

" Plugin for themes of vim-airline
Plug 'vim-airline/vim-airline-themes'

" For auto bracket and quote
Plug 'jiangmiao/auto-pairs'

" For comments
Plug 'scrooloose/nerdcommenter'

" For code formatting
Plug 'sbdchd/neoformat'

" For code jump
Plug 'davidhalter/jedi-vim'

" For file explorer
Plug 'scrooloose/nerdtree'

" Code checker plugin
Plug 'neomake/neomake'

" Highlight the yanked area
Plug 'machakann/vim-highlightedyank'

" Code folding plugin
Plug 'tmhedberg/SimpylFold'

" Popular colorscheme
Plug 'morhetz/gruvbox'

" REPL functionality for vim
Plug 'jalvesaq/vimcmdline'

call plug#end()







" disable autocompletion, cause we use deoplete for completion 
let g:jedi#completions_enabled = 0  

" open the go-to function in split, not another buffer 
let g:jedi#use_splits_not_buffers = "right"

" set neomake as python code checker
let g:neomake_python_enabled_makers = ['pylint']

" neomake: don't show error next to the line
let g:neomake_virtualtext_current_error = 0

" for automatic checking
call neomake#configure#automake('nrwi', 500)

" making highlightedyank plugin work correctly on some themes
hi HighlightedyankRegion cterm=reverse gui=reverse

" set colorscheme
colorscheme gruvbox

set background=dark " use dark mode
"set background=light

" show line numbers on left
set number

" let vim use system clipboard for copy/paste
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""vimcmdline (repl) options"""""""""""""""""""""""""""""""""
" vimcmdline options
let cmdline_vsplit      = 1      " Split the window vertically
let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
let cmdline_term_height = 15     " Initial height of interpreter window or pane
let cmdline_term_width  = 80     " Initial width of interpreter window or pane
let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
let cmdline_outhl       = 1      " Syntax highlight the output
let cmdline_auto_scroll = 1      " Keep the cursor at the end of terminal (nvim)

let cmdline_app           = {}
let cmdline_app['python'] = 'defpy'

" vimcmdline mappings
let cmdline_map_start          = '<LocalLeader>s'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = '<LocalLeader>p'
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_quit           = '<LocalLeader>q'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""NERDTree configurations"""""""""""""""""""""""""""""""""
" shortcut for opening nerdtree
nnoremap <Leader>nt :NERDTreeToggle<Enter>

" close nerdtree after file opens
let NERDTreeQuitOnOpen = 1

" set default width of nerdtree window
let NERDTreeWinSize = 40					  
" arrow symbols for nerd tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" close nerdtree if it is the only windows open after all others have closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" automatically open nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree Desktop | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""Leave Terminal with Escape key"""""""""""""""""""""""""""""""""""""""
:tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""chdir when file/buffer/tab changes""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * lcd %:p:h


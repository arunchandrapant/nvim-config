" If running nvim for the first time, this section will ensure that..........
"..... vim-plug is automatically installed and all the plugins get installed

let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if empty(glob(autoload_plug_path))
  silent execute '!curl -fLo ' . autoload_plug_path . ' --create-dirs
    \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" All the plugins that need to be loaded
call plug#begin(stdpath('data') . '/plugged')

" to load python plugins pynvim is required
" pip install pynvim

" pylint and flake8 required from pip for ale to work
" mypy is required for type checking through ale
" yapf is required for auto formatting by ale
" pip install pylint flake8 mypy yapf
" jedi is required by coc for autocompletion and other functionality. First .....
" ..... install coc-python plugin
"

" C/C++ SETUP FOR AUTOCOMPLETION
" Install coc.nvim using plug
" Install nodejs and npm
" Install :CocInstall coc-clangd
" Install clangd - sudo apt install clangd-9
"

" RUST SETUP FOR AUTOCOMPLETE-LINTING-FORMATTING etc.
" Install coc.nvim using plug
" Install nodejs and npm
" Install rust toolchain components - rustup component add rls rust-analysis rust-src
" Install :CocInstall coc-rls


" ALE for asynchronous linting
Plug 'dense-analysis/ale'

" COC for code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status-bar plugin
Plug 'vim-airline/vim-airline'

" Plugin for themes of vim-airline
Plug 'vim-airline/vim-airline-themes'

" For auto bracket and quote
Plug 'jiangmiao/auto-pairs'

" For comments
Plug 'scrooloose/nerdcommenter'

" For file explorer
Plug 'scrooloose/nerdtree'

" Highlight the yanked area
Plug 'machakann/vim-highlightedyank'

" Code folding plugin
Plug 'tmhedberg/SimpylFold'

" Popular colorscheme
Plug 'morhetz/gruvbox'

" REPL functionality for vim
Plug 'jalvesaq/vimcmdline'

" Plugin for session management
Plug 'mhinz/vim-startify'

" For creating tags for easier code navigation
Plug 'liuchengxu/vista.vim'

" Plugin for golang development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plugin for improving tabline in terminal
Plug 'mkitt/tabline.vim'

" Plugin for better syntax highlighting in python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Many functions in Rust
Plug 'rust-lang/rust.vim'


call plug#end()


" making highlightedyank plugin work correctly on some themes
hi HighlightedyankRegion cterm=reverse gui=reverse

" set colorscheme
colorscheme gruvbox

set background=dark " use dark mode
"set background=light

" show line numbers on left
set number relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""Highlight line while in insert mode""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

"""""""""""""""""""""""""""""""""""""""""""""""""""""""Line number settings"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" let vim use system clipboard for copy/paste
set clipboard+=unnamedplus

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

let cmdline_app           = {'python': 'python'}

" vimcmdline mappings
let cmdline_map_start          = '<LocalLeader>s'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = '<LocalLeader>p'
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_quit           = '<LocalLeader>q'

" vimcmdline colorscheme options
let cmdline_follow_colorscheme = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""NERDTree configurations"""""""""""""""""""""""""""""""""
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

" open nerdtree in highlighted buffer instead of a drawer
let NERDTreeHijackNetrw=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""Leave Terminal with Escape key"""""""""""""""""""""""""""""""""""""""
:tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""Vista Plugin settings""""""""""""""""""""""""""""""""""""""""""
"set coc as default tag provider
let g:vista_default_executive = 'coc'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Python Specific Settings""""""""""""""""""""""""""""""""""""""""""""""""""
" set yapf for formatting python. Set auto formatting on save
let g:ale_fixers = {'python': ['yapf'],}
let g:ale_fix_on_save = 1

" use coc and jedi to go to function definition
nmap <silent> gd <Plug>(coc-definition)

" displaying documentation is floating window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""C/C++ SPECIFIC SETTINGS"""""""""""""""""""""""""""""""""""""""""""""
" Using ale for linting
let g:ale_linters = {
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}



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
" black is used for autoformatting. earlier yapf was used
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

" Disable polyglot to trigger for go
let g:polyglot_disabled = ['go']

" ALE for asynchronous linting
Plug 'dense-analysis/ale'

" COC for code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" For syntax and indentation support for most languages
Plug 'sheerun/vim-polyglot'

" Status-bar plugin
Plug 'vim-airline/vim-airline'

" Plugin for themes of vim-airline
Plug 'vim-airline/vim-airline-themes'

" For auto bracket and quote
Plug 'jiangmiao/auto-pairs'

" For comments
Plug 'scrooloose/nerdcommenter'

" For file explorer
"Plug 'scrooloose/nerdtree'

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

" Theme inspired by vs code dark mode
Plug 'tomasiser/vim-code-dark'

" For git commands integration into vim
Plug 'tpope/vim-fugitive'

" For git changes viewing while editing file
Plug 'mhinz/vim-signify'

" Search files in the project
Plug 'junegunn/fzf'

" Searching files in the project
Plug 'junegunn/fzf.vim'

" Change current working director to project root
Plug 'airblade/vim-rooter'

" requires
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'


call plug#end()


" making highlightedyank plugin work correctly on some themes
hi HighlightedyankRegion cterm=reverse gui=reverse

" set colorscheme
colorscheme codedark
let g:airline_theme = 'codedark'

set background=dark " use dark mode
"set background=light

" show line numbers on left
set number relativenumber

" Set tab settings
" size of a hard tabstop
set tabstop=4
" size of an indent
set shiftwidth=4


"""""""""""""""""""""""""""""""""""""""""""""""""""Redefining leader key"""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "



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

" vimrc
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_window_picker_exclude = {
	\   'filetype': [
	\     'notify',
	\     'packer',
	\     'qf'
	\   ],
	\   'buftype': [
	\     'terminal'
	\   ]
	\ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
	\ 'git': 1,
	\ 'folders': 0,
	\ 'files': 0,
	\ 'folder_arrows': 0,
	\ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
	\ 'default': '',
	\ 'symlink': '',
	\ 'git': {
	\   'unstaged': "✗",
	\   'staged': "✓",
	\   'unmerged': "",
	\   'renamed': "➜",
	\   'untracked': "★",
	\   'deleted': "",
	\   'ignored': "◌"
	\   },
	\ 'folder': {
	\   'arrow_open': "",
	\   'arrow_closed': "",
	\   'default': "",
	\   'open': "",
	\   'empty': "",
	\   'empty_open': "",
	\   'symlink': "",
	\   'symlink_open': "",
	\   }
	\ }

nnoremap <leader>d :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua require'nvim-tree'.setup()


"" shortcut for opening nerdtree
"nnoremap <leader>nt :nerdtreetoggle<enter>

"" close nerdtree after file opens
"let nerdtreequitonopen = 1

"" set default width of nerdtree window
"let nerdtreewinsize = 40					  
"" arrow symbols for nerd tree
"let g:nerdtreedirarrowexpandable = '▸'
"let g:nerdtreedirarrowcollapsible = '▾'

"" close nerdtree if it is the only windows open after all others have closed
"autocmd bufenter * if (winnr("$") == 1 && exists("b:nerdtree") && b:nerdtree.istabtree()) | q | endif

"" open the existing nerdtree on each new tab.
"autocmd bufwinenter * silent nerdtreemirror

"" automatically open nerdtree
"autocmd stdinreadpre * let s:std_in=1
"autocmd vimenter * if argc() == 0 && !exists("s:std_in") | nerdtree desktop | endif

"" open nerdtree in highlighted buffer instead of a drawer
"let nerdtreehijacknetrw=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""Leave Terminal with Escape key"""""""""""""""""""""""""""""""""""""""
:tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""Vista Plugin settings""""""""""""""""""""""""""""""""""""""""""
"set coc as default tag provider
let g:vista_default_executive = 'coc'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Python Specific Settings""""""""""""""""""""""""""""""""""""""""""""""""""
" set black for formatting python. Set auto formatting on save
" let g:ale_fixers = {'python': ['black', 'isort'],}
" let g:ale_fix_on_save = 1

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

" auto sort imports on save. use coc-pyright to sort
autocmd BufWritePre *.py :silent call CocAction('runCommand', 'editor.action.organizeImport')

""""""""""""""""""""""""""""""""""""""""""""C/C++ SPECIFIC SETTINGS"""""""""""""""""""""""""""""""""""""""""""""
" Using ale for linting
let g:ale_linters = {
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang'],
    \ 'go': ['golint', 'go vet']
\}

""""""""""""""""""""""""""""""""""""" Auto install COC extensions """""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-tsserver', 'coc-snippets']

"""""""""""""""""""""""""""""""""""COC settings"""""""""""""""""""""""""""""""""""
""Map <tab> to trigger completion and navigate to the next item: >
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()



""""""""""""""""""""""""""""""""""""Go settings """"""""""""""""""""""""""""""""""""

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

let g:go_fmt_experimental=1
"let g:go_metalinter_autosave=1
"let g:go_metalinter_autosave_enabled=['golint', 'govet']

let g:gofmt_autosave = 1

let g:go_imports_autosave = 1

augroup go

au!
au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>db <Plug>(go-doc-browser)

au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
au FileType go nmap <C-g> :GoDecls<cr>
au FileType go nmap <leader>dr :GoDeclsDir<cr>
au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

"""""""""""""""""""""""""""""""""""""""" Haskell settings """"""""""""""""""""""""""""""""""""""""
autocmd FileType haskell setlocal shiftwidth=4 shiftround softtabstop=4 tabstop=8 expandtab 

""""""""""""""""""""""""""""""""""""""""""FZF settings""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>l :GFiles<CR>
nnoremap <leader>a :Files<CR>
nnoremap <leader>b :Buffers<CR>


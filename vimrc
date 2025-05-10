set encoding=utf-8

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" auto complete
" Plug 'ycm-core/YouCompleteMe', { 'do': '/usr/bin/python3 install.py --clangd-completer' }
Plug 'ycm-core/YouCompleteMe'

" clang-format
Plug 'rhysd/vim-clang-format'

" trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" On-demand loading: loaded when the specified command is executed
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" float terminal
Plug 'voldikss/vim-floaterm'

" better status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Call plug#end to update &runtimepath and initialize the plugin system.
" - It automatically executes `filetype plugin indent on` and `syntax enable`
call plug#end()

" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" Color schemes should be loaded after plug#end().
" We prepend it with 'silent!' to ignore errors when it's not yet installed.
" silent! colorscheme seoul256

" ycm plugin setup
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1

let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "cuda":1,
			\ "python":1,
			\ "sh":1,
			\ "dockerfile":1,
			\ "vim":1,
			\ }

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,cuda,python': ['re!\w{2}', '_'],
           \ }

" clang-format plugin setup
let g:clang_format#auto_format = 1

" strip all whitespace
nnoremap <leader>s :StripWhitespace<CR>

" nerdtree plugin setup
nnoremap <C-n> :NERDTreeToggle<CR>

" floaterm plugin setup
nnoremap   <silent>   <C-t>    :FloatermNew<CR>
tnoremap   <silent>   <C-t>    <C-\><C-n>:FloatermNew<CR>

nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>

" vim-airline plugin
"let g:airline#extensions#tabline#enabled = 1

"
" custom setup: key map binding, tab, etc.
"
" vimdiff mode: set syntax off
if &diff
    syntax off
endif

" set command mode autocomplete
set wildmenu
set wildmode=longest:full,full

" use jk to normal mode
imap jk <esc>

" map ctrl+u to change uppper
imap <c-u> <esc>vbUea

" select working windows more easy
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" tab
set expandtab softtabstop=4 shiftwidth=4 tabstop=4
autocmd BufNewFile,BufRead *.proto3 set filetype=proto
autocmd FileType c,cpp,cuda,hip,objc,proto,cmake setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

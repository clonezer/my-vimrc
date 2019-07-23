set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Monokai theme
Plugin 'patstockwell/vim-monokai-tasty'

" Plugin for fuzzy file search, most recent files list
" and much more
Plugin 'Shougo/unite.vim'

" Snippet engine
Plugin 'SirVer/ultisnips'

" Default snippets
Plugin 'honza/vim-snippets'

" Allow autoclose paired characters like [,] or (,),
" and add smart cursor positioning inside it,
Plugin 'Raimondi/delimitMate'

" Add code static check on write
" need to be properly configured.
" I just enable it, with default config,
" many false positive but still useful
Plugin 'w0rp/ale'

" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
" Must have
Plugin 'scrooloose/nerdtree'

" Show code coverage in vim
Plugin 'L0stsoul/coverage.vim'

" Add smart commands for comments like:
" gcc - Toggle comment for the current line
" gc  - Toggle comments for selected region or number of strings
" Very useful
Plugin 'tomtom/tcomment_vim'

" Best git wrapper for vim
" But with my workflow, i really rarely use it
" just Gdiff and Gblame sometimes
Plugin 'tpope/vim-fugitive'

" Add usefull hotkey for operation with surroundings
" cs{what}{towhat} - inside '' or [] or something like this allow
" change surroundings symbols to another
" and ds{what} - remove them
Plugin 'tpope/vim-surround'

" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
Plugin 'othree/html5.vim'

" Syntax highlighting for .vue (js files for vue js)
Plugin 'posva/vim-vue'

" Syntax highlighting for javscript
Plugin 'pangloss/vim-javascript'

" Syntax highlighting for pug
Plugin 'digitaltoad/vim-pug'

" Syntax highlighting for typescript
Plugin 'leafgarland/typescript-vim'

" Add Support css3 property
Plugin 'hail2u/vim-css3-syntax'

" Syntax highlighting for mustache & handlebars
Plugin 'mustache/vim-mustache-handlebars'

" Syntax highlighting for Stylus
Plugin 'wavded/vim-stylus'

" Add support for taltoad/vim-jadeumarkdown
Plugin 'tpope/vim-markdown'

" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
Plugin 'gregsexton/MatchTag'

" Automatically add closing tags in html-like formats
Plugin 'alvan/vim-closetag'

" Smart indent for javascript
" http://www.vim.org/scripts/script.php?script_id=3081
Plugin 'lukaszb/vim-web-indent'

" Plugin for changing cursor when entering in insert mode
" looks like it works fine with iTerm Konsole adn xerm
" Applies only on next vim launch after NeoBundleInstall
Plugin 'jszakmeister/vim-togglecursor'

" Nice statusline/ruler for vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Code-completion for jquery, lodash e.t.c
Plugin 'othree/javascript-libraries-syntax.vim'

" Most recent files source for unite
Plugin 'Shougo/neomru.vim'

" Plugin for chord mappings
Plugin 'kana/vim-arpeggio'

" Autocompletion engine
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable syntax highlighting
syntax enable
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

" Disable annoying prompt on initial bundle install
set nomore

"--------------------------------------------------
" Bundles settings

"-------------------------
" ultsnips

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0

" Smart snippet expanding on CR
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

"-------------------------
" Unite

" Set unite window height
let g:unite_winheight = 10

" Start unite in insert mode by default
let g:unite_enable_start_insert = 1

" Display unite on the bottom (or bottom right) part of the screen
let g:unite_split_rule = 'botright'

" Set short limit for max most recent files count.
" It less unrelative recent files this way
let g:unite_source_file_mru_limit = 100

" Enable history for yanks
let g:unite_source_history_yank_enable = 1

" Make small limit for yank history,
let g:unite_source_history_yank_limit = 40

" Grep options Default for unite + supress error messages
let g:unite_source_grep_default_opts = '-iRHns'

let g:unite_source_rec_max_cache_files = 99999

" If ack exists use it instead of grep
if executable('ack-grep')
    " Use ack-grep
    let g:unite_source_grep_command = 'ack-grep'
    " Set up ack options
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
    let g:unite_source_grep_recursive_opt = ''
endif

" Hotkey for open window with most recent files
nnoremap <silent><leader>m :<C-u>Unite file_mru <CR>

" Hotkey for open history window
nnoremap <silent><leader>h :Unite -quick-match -max-multi-lines=2 -start-insert history/yank<CR>

" Quick tab navigation
nnoremap <silent><leader>' :Unite tab<CR>

"-------------------------
" coverage
"
let g:coverage_json_report_pathes = ['.coverage/coverage-final.json', 'coverage/coverage-final.json']
let g:coverage_sign_covered = '⦿'
let g:coverage_show_covered = 1

"-------------------------
" NERDTree

" Tell NERDTree to display hidden files on startup
let NERDTreeShowHidden=1

" Disable bookmarks label, and hint about '?'
let NERDTreeMinimalUI=1

" Display current file in the NERDTree ont the left
nmap <silent> <leader>f :NERDTreeFind<CR>

"-------------------------
" Arpeggio

" Map jk to escape
call arpeggio#map('i', '', 0, 'jk', '<ESC>')

" Always open sign column, it's annoying if its jumping
let g:ale_sign_column_always = 1

let g:ale_sign_error = '😱'
let g:ale_sign_warning = '😨'

" Integrate Ale in airline
let g:airline#extensions#ale#enabled = 1

nmap <silent> [ <Plug>(ale_previous_wrap)
nmap <silent> ] <Plug>(ale_next_wrap)

"-------------------------
" Fugitive

" Blame on current line
nmap <silent> <leader>b :.Gblame<cr>
" Blame on all selected lines in visual mode
vmap <silent> <leader>b :Gblame<cr>
" Git status
nmap <silent> <leader>gst :Gstatus<cr>
" like git add
nmap <silent> <leader>gw :Gwrite<cr>
" git diff
nmap <silent> <leader>gd :Gdiff<cr>
" git commit
nmap <silent> <leader>gc :Gcommit<cr>
" git commit all
nmap <silent> <leader>gca :Gcommit -a<cr>
" git fixup previous commit
nmap <silent> <leader>gcf :Gcommit -a --amend<cr>

"-------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

" Enable it for quotes
let delimitMate_smart_quotes = 1

"-------------------------
" vim-mustache-handlebars

" Enable shortcuts for things like {{{ an {{
let g:mustache_abbreviations = 1

"-------------------------
" vim-closetag

" Enable for files with this extensions
let g:closetag_filenames = "*.handlebars,*.html,*.xhtml,*.phtml,*.tsx,*.vue"

"-------------------------
" vim-airline

" Colorscheme for airline
let g:airline_theme='understated'

" Set custom left separator
let g:airline_left_sep = '▶'

" Set custom right separator
let g:airline_right_sep = '◀'

" Enable airline for tab-bar
let g:airline#extensions#tabline#enabled = 1

" Don't display buffers in tab-bar with single tab
let g:airline#extensions#tabline#show_buffers = 0

" Display only filename in tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't display encoding
let g:airline_section_y = ''

" Don't display filetype
let g:airline_section_x = ''

"-------------------------
" YouCompleteMe

let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+' ],
    \   'less': [ 're!^\s{4}', 're!:\s+' ]
    \ }

" Choose completion with tab
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

let g:ycm_filepath_blacklist = {
    \ 'jsx': 1,
    \ 'vue': 1,
    \ 'typescript': 1,
    \ 'html': 1,
    \ 'xml': 1
    \}

" Since we use ale already
let g:ycm_show_diagnostics_ui = 0

" Go to type definition/declaration
nmap <silent> <leader>td :YcmCompleter GoTo<CR>

" Show all references to variable under coursor
nmap <silent> <leader>gr :YcmCompleter GoToReferences<CR>

" Show type of variable under cursor
nmap <silent> <leader>gt :YcmCompleter GetType<CR>

" Show docs for entity under cursor
nmap <silent> <leader>gd :YcmCompleter GetDoc<CR>

" Refactor smart rename, space at the end are important :)
nmap <leader>rr :YcmCompleter RefactorRename 

"--------------------------------------------------
" General options
" Toggle terminal below :)
nmap <leader>tr :below term<CR> 

"--------------------------------------------------
" General options

" Enable per-directory .vimrc files and disable unsafe commands in them
"set exrc secure

" Set up leader key <leader>, i use default \
"let mapleader = ','

" Buffer will be hidden instead of closed when no one display it
"set hidden

" Auto reload changed files
set autoread

" Always change current directory to current-editing-file dir
"set autochdir

" Indicates fast terminal connection
set ttyfast

" Set character encoding to use in vim
set encoding=utf-8

" Let vim know what encoding we use in our terminal
set termencoding=utf-8

" Which EOl used. For us it's unix
" Not works with modifiable=no
if &modifiable
    set fileformat=unix
endif

" Enable Tcl interface. Not sure what is exactly mean.
" set infercase

" Interprete all files like binary and disable many features.
" set binary

"--------------------------------------------------
" Display options

" Hide showmode
" Showmode is useless with airline
set noshowmode

" Show file name in window title
set title

" open preview window at bottom
set splitbelow

" Hide preview window for completion
set completeopt-=preview

" Mute error bell
set novisualbell

" Remove all useless messages like intro screen and use abbreviation like RO
" instead readonly and + instead modified
set shortmess=atI

" Enable display whitespace characters
set list

" Setting up how to display whitespace characters
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~

" Wrap line only on characters in breakat list like ^I!@*-+;:,./?
" Useless with nowrap
" set linebreak

" Numbers of lines to scroll when the cursor get off the screen
" Useless with scrolloff
" set scrolljump=5

" Numbers of columns to scroll when the cursor get off the screen
" Useless with sidescrollof
" set sidescroll=4

" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=10

" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=10

" Vim will move to the previous/next line after reaching first/last char in
" the line with this command (you can add 'h' or 'l' here as well)
" <,> stand for arrows in command mode and [,] arrows in visual mode
set whichwrap=b,s,<,>,[,],

" Display command which you typing and other command related stuff
set showcmd

" Indicate that last window have a statusline too
set laststatus=2

" Add a line / column display in the bottom right-hand section of the screen.
" Not needed with airline plugin
"set ruler

" Setting up right-hand section(ruller) format
" Not needed with airline plugin
"set rulerformat=%30(%=\:%y%m%r%w\ %l,%c%V\ %P%)

" The cursor should stay where you leave it, instead of moving to the first non
" blank of the line
set nostartofline

" Disable wrapping long string
set nowrap

" Display Line numbers
set number

" Highlight line with cursor
set cursorline

" Maximum text length at 80 symbols, vim automatically breaks longer lines
" set textwidth=80

" Highlight column right after max textwidth
set colorcolumn=+1

"--------------------------------------------------
" Colorscheme

" Use solarized colorscheme
colorscheme vim-monokai-tasty

" " Setting up light color scheme
" set background=light

" " Set highlighting for colorcolumn
" highlight ColorColumn ctermbg=lightGrey


"--------------------------------------------------
" Tab options

" Copy indent from previous line
set autoindent

" Enable smart indent. It add additional indents whe necessary
set smartindent

" Replace tabs with spaces
set expandtab

" When you hit tab at start of line, indent added according to shiftwidth value
set smarttab

" Number of spaces to use for each step of indent
set shiftwidth=2

" Number of spaces that a Tab in the file counts for
set tabstop=2

" Same but for editing operation (not sure what exactly does it means)
" but in most cases tabstop and softtabstop better be the same
set softtabstop=2

" Round indent to multiple of 'shiftwidth'.
" Indentation always be multiple of shiftwidth
" Applies to  < and > command
set shiftround

"--------------------------------------------------
" Search options

" Add the g flag to search/replace by default
set gdefault

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable highlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Show matching brackets
set showmatch

"--------------------------------------------------
" Wildmenu

" Extended autocompletion for commands
set wildmenu

" Autocmpletion hotkey
set wildcharm=<TAB>

"--------------------------------------------------
" Folding

" Enable syntax folding in javascript
let javaScript_fold=1

" No fold closed at open file
set foldlevelstart=99
set nofoldenable

" Keymap to toggle folds with space
nmap <space> za

"--------------------------------------------------
" Edit

" Allow backspace to remove indents, newlines and old text
set backspace=indent,eol,start

" toggle paste mode on \p
set pastetoggle=<leader>p

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" Disable backups file
set nobackup

" Disable vim common sequence for saving.
" By default vim write buffer to a new file, then delete original file
" then rename the new file.
set nowritebackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol


"--------------------------------------------------
" Diff Options

" Display filler
set diffopt=filler

" Open diff in horizontal buffer
set diffopt+=horizontal

" Ignore changes in whitespaces characters
set diffopt+=iwhite

"--------------------------------------------------
" Hotkeys

" Open new tab
nmap <silent><leader>to :tabnew .<CR>

" Replace
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Moving between splits
nmap <leader>w <C-w>w

"--------------------------------------------------
" Autocmd

" It executes specific command when specific events occured
" like reading or writing file, or open or close buffer
if has("autocmd")
    " Define group of commands,
    " Commands defined in .vimrc don't bind twice if .vimrc will reload
    augroup vimrc
    " Delete any previously defined autocommands
    au!
        " Auto reload vim after your change it
        au BufWritePost *.vim source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

        " Restore cursor position :help last-position-jump
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif

        " Set filetypes aliases
        au FileType htmldjango set ft=html.htmldjango
        au FileType scss set ft=scss.css
        au FileType less set ft=less.css
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
        au BufRead,BufNewFile *.js set ft=javascript.javascript-jquery
        au BufRead,BufNewFile *.json set ft=json
        " Execute python \ -mjson.tool for autoformatting *.json
        au BufRead,BufNewFile *.bemhtml set ft=javascript
        au BufRead,BufNewFile *.bemtree set ft=javascript
        au BufRead,BufNewFile *.xjst set ft=javascript
        au BufRead,BufNewFile *.tt2 set ft=tt2
        au BufRead,BufNewFile *.plaintex set ft=plaintex.tex

        " Fix vue syntax highlighting stops working randomly
        autocmd FileType vue syntax sync fromstart

        " Auto close preview window, it uses with tags,
        " I don't use it
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType typescript setlocal omnifunc=typescriptcomlete#CompleteTS

        " Disable vertical line at max string length in NERDTree
        autocmd FileType * setlocal colorcolumn=+1
        autocmd FileType nerdtree setlocal colorcolumn=""

        " Not enable Folding - it really slow on large files, uses plugin vim-javascript-syntax
        " au FileType javascript* call JavaScriptFold()

    " Group end
    augroup END

endif

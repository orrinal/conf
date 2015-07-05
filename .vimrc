" Basics {
	set nocompatible " explicitly get out of vi-compatible mode
	set background=dark " we plan to use a dark background
	syntax on " syntax highlighting on
    syn sync fromstart
" }

" General {
"	set autochdir " always switch to the current directory of the file you are editing
	set backspace=indent,eol,start " make backspace a little more flexible
	set backup " make backup files
"	set patchmode=.orig
"	set backupdir=~/.vim/backup " where to put backup files
	set clipboard+=unnamed " share windows clipboard
"	set directory=~/.vim/tmp " directory to place swap files in
	set fileformats=unix,dos,mac " support all three, in this order
	set hidden " you can change buffers without saving
	set iskeyword+=_,- " none of these are word dividers
	set noerrorbells " don't make noise
"	set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
	set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png " ignore these
	set wildmenu " turn on command line completion
	set wildmode=list:longest " turn on wild menu with very large list
	set cpoptions-=<	"make sure <C-Z> is tread as Ctrl-Z
	set updatetime=1000	"swp -> disk if no typing for 1 sec
" }

" Vim UI {
	colorscheme candycode_my
"	colorscheme black_angus
	set cursorcolumn " highlight the current column
	set cursorline " highlight current line
	set incsearch " BUT do highlight as you type you search phrase
	set laststatus=2 " always show the status line
	set lazyredraw " do not redraw while running macros
	set linespace=0 " don't insert any extra pixel lines betweens rows
"	set list " we do what to show tabs, to ensure we get them out of my files
"	set listchars=tab:>-,trail:- " show tabs and trailing whitespace
	set matchtime=2 " how many tenths of a second to blink matching brackets for
	set hlsearch " highlight searched for phrases
	set nostartofline " leave my cursor where it was
	set novisualbell " don't blink
	set number " turn on line numbers
	set numberwidth=5 " We are good up to 99999 lines
	set report=0 " tell us when anything is changed via :...
	set ruler " Always show current positions along the bottom
	set scrolloff=1 " Keep 1 lines (top/bottom) for scope
	set shortmess=atI " shortens messages to avoid 'press a key' prompt
	set showcmd " show the command being typed
	set showmatch " show matching brackets
	set sidescrolloff=5 " Keep 5 lines at the size
	set cmdheight=1             " 设定命令行的行数为 1
"	set statusline=%F%m%r%h%w\ [%{&fileformat}]\ [%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"	set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
	set statusline=%F%m%r%h%w\ [%{&fileformat}][%l,%v][%p%%,%L]
                            " 设置在状态行显示的信息如下：
                            " %F    当前文件名
                            " %m    当前文件修改状态
                            " %r    当前文件是否只读
                            " %Y    当前文件类型
                            " %{&fileformat}	当前文件编码
                            " %b    当前光标处字符的 ASCII 码值
                            " %B    当前光标处字符的十六进制值
                            " %l    当前光标行号
                            " %c    当前光标列号
                            " %V    当前光标虚拟列号 (根据字符所占字节数计算)
                            " %p    当前行占总行数的百分比
                            " %%    百分号
                            " %L    当前文件总行数
	"set backupcopy=yes          " 设置备份时的行为为覆盖
	set confirm                 " 用确认对话框（对于 gvim）或命令行选项（对于vim）来代替有未保存内容时的警告信息
	"set display=lastline        " 长行不能完全显示时显示当前屏幕能显示的部分。默认值为空，长行不能完全显示时显示 @。
	set nolinebreak             " 在单词中间断行
	set history=50		" keep 50 lines of command line history

	" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break.
	inoremap <C-U> <C-G>u<C-U>

	" In many terminal emulators the mouse works just fine, thus enable it.
"	if has('mouse')
"	  set mouse=a
"	endif

	" Only do this part when compiled with support for autocommands.
	if has("autocmd")

	  " Enable file type detection.
	  " Use the default filetype settings, so that mail gets 'tw' set to 72,
	  " 'cindent' is on in C files, etc.
	  " Also load indent files, to automatically do language-dependent indenting.
	  filetype plugin indent on

	  " Put these in an autocmd group, so that we can delete them easily.
	  augroup vimrcEx
	  au!

	  " For all text files set 'textwidth' to 78 characters.
	  autocmd FileType c,cpp,h,hpp,text setlocal textwidth=78 fo+=Mm

	  " When editing a file, always jump to the last known cursor position.
	  " Don't do it when the position is invalid or when inside an event handler
	  " (happens when dropping a file on gvim).
	  " Also don't do it when the mark is in the first line, that is the default
	  " position when opening a file.
	  autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif

	  augroup END

	else

	  set autoindent		" always set autoindenting on

	endif " has("autocmd")

	" Convenient command to see the difference between the current buffer and the
	" file it was loaded from, thus the changes you made.
	" Only define it when not defined already.
	if !exists(":DiffOrig")
	  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
			  \ | wincmd p | diffthis
	endif

" }

" Text Formatting/Layout {
	set complete=.,w,b,u,t,i "java complete?
	set completeopt=menu,longest " improve the way autocomplete works
	set expandtab " no real tabs please!
"	set formatoptions=rq " Automatically insert comment leader on return, and let gq work
	set formatoptions=tcqro     " 使得注释换行时自动加上前导的空格和星号
	set formatoptions+=mM	"中文字符折行不加空格
	set nowrap " do not wrap line
	set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
"	set ignorecase " case insensitive
"	set smartcase " if there are caps, go case-sensitive
	" Indent Related {
		set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
		set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格（不足 4 个时删掉所有剩下的空格）
		set tabstop=4 " real tabs should be 4, but they will show with set list on
	" }
" }

" Folding {
	set foldenable " Turn on folding
"	set foldmarker={,} " Fold C style code (useful with high foldlevel)
"	set foldmethod=marker " Fold on the marker
	set foldmethod=syntax
	set foldlevel=99 " Don't autofold anything (but I can still fold manually)
"	autocmd FileType c,cpp setl fdm=syntax | setl fen
"	setlocal diff foldmethod=diff scrollbind nowrap foldlevel=1 " folding unchanged lines
"	set foldopen=block,hor,mark,percent,quickfix,tag " what movements to open folds on
	function SimpleFoldText() " {
		return getline(v:foldstart).' '
	endfunction " }
	set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)
" }

" Mappings {
	" Set mapleader
	let mapleader=","

	" I know it's horrible for a vi master but useful for newbies.
	imap <C-a> <Esc>I
	imap <C-e> <ESC>A
	map <C-Tab> <C-W>w
	imap <C-Tab> <C-O><C-W>w
	cmap <C-Tab> <C-C><C-Tab>

	"map <F5> :bp<C-M>
	"map <F6> :bn<C-M>
	"map <F7> :bd<C-M>

	" Windows HotKey
	vmap <C-c>	"yy
	vmap <C-x>	"yd
	nmap <C-v>	"yp
	vmap <C-v>	"yp
	nmap <C-a>	ggvG$
	imap <C-s>	<Esc>:wa<cr>i<Right>
	nmap <C-s>	:wa<cr>

	" vim as hex editor
	map <Leader>hon :%!xxd<CR>
	map <Leader>hof :%!xxd -r<CR>
	" trim trail blanks
"	nmap    <F12>       :%s,\s\+$,,g<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	map <F12> ggVGg?
"	noremap <S-space> <C-b>
"	noremap <space> <C-f>
	" Make Arrow Keys Useful {
"		map <down> <ESC>:bn<RETURN>
"		map <left> <ESC>:NERDTreeToggle<RETURN>
"		map <right> <ESC>:Tlist<RETURN>
"		map <up> <ESC>:bp<RETURN>
	" }
" }

" Project settings {
	set tags+=~/.vim/sys.tags
	let work_dire = "."
	set tags+=./tags,work_dire/tags
	set tags+=./TAGS,work_dire/TAGS
	set tags+=../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags,../../../../../../../tags,../../../../../../../../tags
	set tags+=../TAGS,../../TAGS,../../../TAGS,../../../../TAGS,../../../../../TAGS,../../../../../../TAGS,../../../../../../../TAGS,../../../../../../../../TAGS
	"set tags+=work_dire/*.tags
	"cs add work_dire/cscope.out work_dire
	set csprg=gtags-cscope
	"cs add GTAGS
	"set path+=./**,.,work_dire/**
	"set path+=../**,../../**,../../../**,../../../../**,../../../../../**
	"set path+=/usr/local/include/**,/usr/include/**
	" execute project related configuration in current directory
	"if filereadable("workspace.vim")
	"	source workspace.vim
	"endif
" }

" Plugin Settings {
	let b:match_ignorecase = 1 " case is stupid

	" perl syntax
	let perl_extended_vars=1 " highlight advanced perl vars inside strings

	" java syntax
	let java_highlight_all=1
	let java_highlight_functions="style"
	let java_allow_cpp_keywords=1

	""""""""""""""""""""""""""""""""
	" std_c	:help std_c
	""""""""""""""""""""""""""""""""
	"let c_c_vim_compatible = 1
	let c_syntax_for_h = 1
	let c_C99 = 1
	let c_posix = 1
	let c_math = 1
	let c_gnu = 1
	let c_cpp_comments = 0
	"let c_comment_strings = 1
	"let c_comment_numbers = 1
	"let c_comment_types = 1
	"let c_comment_date_time = 1

	""""""""""""""""""""""""""""""""
	" TagList
	""""""""""""""""""""""""""""""""
	"if MySys() == "linux"
	"	let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
	"elseif MySys() == "windows"
	"	let Tlist_Ctags_Cmd = 'ctags'
	"endif
	let Tlist_Show_One_File=1
	let Tlist_Exit_OnlyWindow=1
	let Tlist_Auto_Open=0 " let the tag list open automagically
	let Tlist_Compact_Format = 1 " show small meny
	let Tlist_Enable_Fold_Column = 0 " do show folding tree
	let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
	let Tlist_File_Fold_Auto_Close = 1 " fold closed other trees
	let Tlist_Sort_Type = "name" " order by
"	let Tlist_Use_Right_Window = 1 " split to the right side of the screen
"	let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always) read my functions
	" Langauge Specifics {
		let tlist_aspjscript_settings = 'asp;f:function;c:class' " functions/classes
		let tlist_aspvbs_settings = 'asp;f:function;s:sub' " functions/subs
		let tlist_php_settings = 'php;c:class;d:constant;f:function' " no variables
		let tlist_vb_settings = 'asp;f:function;c:class' " functions/classes
	" }
	map <silent> <leader>tl :TlistToggle<cr>

	""""""""""""""""""""""""""""""""
	" netrw setting
	""""""""""""""""""""""""""""""""
	let g:netrw_winsize=30
	nmap <silent> <leader>fe :Sexplore!<cr>

	""""""""""""""""""""""""""""""""
	" BufExplorer
	""""""""""""""""""""""""""""""""
	let g:bufExplorerDefaultHelp=0		" Do not show default help.
	let g:bufExplorerShowRelativePath=1	" Show ralative paths.
	let g:bufExplorerSortBy='mru'		" Sort by most recently used.
	let g:bufExplorerSplitRight=0		" Split left.
	let g:bufExplorerSplitVertical=1	" Split vertically.
	let g:bufExplorerSplitVertSize=30	" Split width
	let g:bufExplorerUseCurrentWindow=1	" Open in new window

	""""""""""""""""""""""""""""""""
	" SourceExplorer
	""""""""""""""""""""""""""""""""
	nmap <C-H> <C-W>h 
	nmap <C-J> <C-W>j 
	nmap <C-K> <C-W>k 
	nmap <C-L> <C-W>l

	" // The switch of the Source Explorer 
"	nmap <F8> :SrcExplToggle<CR> 
	" // Set the height of Source Explorer window 
	let g:SrcExpl_winHeight = 8 
	" // Set 100 ms for refreshing the Source Explorer 
	let g:SrcExpl_refreshTime = 100 
	" // Set "Enter" key to jump into the exact definition context 
	let g:SrcExpl_jumpKey = "<ENTER>" 
	" // Set "Space" key for back from the definition context 
	let g:SrcExpl_gobackKey = "<SPACE>" 
	" // In order to Avoid conflicts, the Source Explorer should know what plugins 
	" // are using buffers. And you need add their bufname into the list below 
	" // according to the command ":buffers!" 
	let g:SrcExpl_pluginList = [ 
			\ "__Tag_List__", 
			\ "_NERD_tree_", 
			\ "Source_Explorer" 
		\ ] 
	" // Enable/Disable the local definition searching, and note that this is not 
	" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
	" // It only searches for a match with the keyword according to command 'gd' 
	let g:SrcExpl_searchLocalDef = 1 
	" // Let the Source Explorer update the tags file when opening 
	let g:SrcExpl_isUpdateTags = 1 
	" // Use program 'ctags' with argument '--sort=foldcase -R' to create or 
	" // update a tags file 
	let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
	" // Set "<F12>" key for updating the tags file artificially 
	let g:SrcExpl_updateTagsKey = "<F12>"

	""""""""""""""""""""""""""""""""
	" Trinity(integrate Taglist,NERD_tree and SourceExplorer to simulate source insight)
	""""""""""""""""""""""""""""""""
	" Open and close all the three plugins on the same time 
	nmap <F8>   :TrinityToggleAll<CR> 
	" Open and close the srcexpl.vim separately 
	nmap <F9>   :TrinityToggleSourceExplorer<CR> 
	" Open and close the taglist.vim separately 
	nmap <F10>  :TrinityToggleTagList<CR> 
	" Open and close the NERD_tree.vim separately 
	nmap <F11>  :TrinityToggleNERDTree<CR>

	""""""""""""""""""""""""""""""""
	" WinManager
	""""""""""""""""""""""""""""""""
	let g:winManagerWindowLayout='FileExplorer,BufExplorer|TagList'
	let g:winManagerWidth=30
	let g:defaultExplorer=0
	nmap <C-W><C-F> :FirstExplorerWindow<cr>
	nmap <C-W><C-B> :BottomExplorerWindow<cr>
	nmap <silent> <leader>wm :WMToggle<cr>

	""""""""""""""""""""""""""""""""
	" Echofunc
	""""""""""""""""""""""""""""""""
	"let g:EchoFuncLangsDict "Dictionary to map the Vim file types to tags languages that should be used. You do not need to touch it in most cases.
	let g:EchoFuncLangsUsed=["c","cpp","java"]
	let g:EchoFuncMaxBalloonDeclarations=3
	"let g:EchoFuncKeyNext "Key to echo the next function
	"let g:EchoFuncKeyPrev "Key to echo the previous function

	""""""""""""""""""""""""""""""""
	" LookupFile
	""""""""""""""""""""""""""""""""
	let g:LookupFile_MinPatLength=2				" start lookup on n chars input
	let g:LookupFile_PreserveLastPattern=0		" don not previous lookup string
	let g:LookupFile_PreservePatternHistory=1	" keep search history
	let g:LookupFile_AlwaysAcceptFirst=1		" <cr> to open first match
	let g:LookupFile_AllowNewFiles=0			" don not allow create new file
	if filereadable("./filename.tags")
		let g:LookupFile_TagExpr='"./filename.tags"'
	endif
	nmap <silent> <leader>lk <Plug>LookupFile<cr>
	nmap <silent> <leader>ll :LUBufs<cr>
	nmap <silent> <leader>lw :LUWalk<cr>

	""""""""""""""""""""""""""""""""
	" cscope setting
	""""""""""""""""""""""""""""""""
	"if has("cscope")
	"	set csprg=/usr/local/bin/cscope
	"	set csto=1 "search tag file(s)first
	"	set cst "always use :cstag instead :tag behavior
	"	set nocsverb
	"	" add any database in current directory
	"	if filereadable("cscope.out")
	"		cs add cscope.out
	"	elseif $CSCOPE_DB != ""
	"		cs add $CSCOPE_DB
	"	endif
	"	set csverb
	"endif

	""""""""""""""""""""""""""""""""
	" Gtags
	""""""""""""""""""""""""""""""""
	"nmap <silent> <leader>g :Gtags<cr>

	""""""""""""""""""""""""""""""""
	" quick fix
	""""""""""""""""""""""""""""""""
	autocmd! FileType h,c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
	nmap <leader>cn :cn<cr>
	nmap <leader>cp :cp<cr>
	nmap <leader>cw :cw 17<cr>

	""""""""""""""""""""""""""""""""
	" Grep
	""""""""""""""""""""""""""""""""
	nnoremap <silent> <F3> :Grep<CR>
	nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

	""""""""""""""""""""""""""""""""
	" DevHelp in debian
	""""""""""""""""""""""""""""""""
	" vim macro to jump to devhelp topics.
	function! DevHelpCurrentWord()
		let word = expand("<cword>")
		exe "!devhelp -s " . word
	endfunction

	" Example: bind <ESC>h to start devhelp and search for the word under the
	" cursor
	nmap <ESC>h :call DevHelpCurrentWord()<CR>

	""""""""""""""""""""""""""""""""
	" OmniCppComplete
	""""""""""""""""""""""""""""""""
	inoremap <expr> <CR>	pumvisible()?"\<C-Y>":"\<CR>"
	inoremap <expr> <C-J>	pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
	inoremap <expr> <C-K>	pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
	inoremap <expr> <C-U>	pumvisible()?"\<C-E>":"\<C-U>"
	"inoremap <leader>x <C-X>
	inoremap <C-]> <C-X><C-]>
	inoremap <C-F> <C-X><C-F>
	inoremap <C-D> <C-X><C-D>
	inoremap <C-L> <C-X><C-L>

	""""""""""""""""""""""""""""""""
	" ShowMarks
	""""""""""""""""""""""""""""""""
	" Enable ShowMarks
	let showmarks_enable=1
	" Show which marks
	let showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	" Ignore help, quickfix, non-modifiable buffers
	let showmarks_ignor_type="hqm"
	" Hilight lower & upper marks
	let showmarks_hlline_lower=1
	let showmarks_hlline_upper=1


	""""""""""""""""""""""""""""""""
	" MarkBrowser
	""""""""""""""""""""""""""""""""
	nmap <silent> <leader>mk :MarksBrowser<cr>



	""""""""""""""""""""""""""""""""
	" cvim	:help csupport
	""""""""""""""""""""""""""""""""
	let g:C_TemplateOverwrittenMsg= 'no'
	let g:C_FormatDate            = '%D'
	let g:C_FormatTime            = '%H:%M'
	let g:C_FormatYear            = 'year %Y'

	let g:alternateNoDefaultAlternate=1
	"let g:Cpp_Template_Function="c-function-description-wxs"


	""""""""""""""""""""""""""""""""
	" bash vim	:help bashsupport
	""""""""""""""""""""""""""""""""
	let g:BASH_AuthorName			 = 'xiaoshuo'
	let g:BASH_Email				 = 'wxshuo@gmail.com'
	let g:BASH_Company				 = 'ftsafe'
    let g:BASH_FormatDate       = '%D'
    let g:BASH_FormatTime       = '%H:%M'
    let g:BASH_FormatYear       = 'year %Y'

	""""""""""""""""""""""""""""""""
	" gtk-vim-syntax
	""""""""""""""""""""""""""""""""
	"let glib_enable_deprecated = 1
	let glib_deprecated_errors = 1

	""""""""""""""""""""""""""""""""
	" DoxygenToolkit
	""""""""""""""""""""""""""""""""
	let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
	let g:DoxygenToolkit_paramTag_pre="@Param " 
	let g:DoxygenToolkit_returnTag="@Returns   " 
	let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
	let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------" 
	let g:DoxygenToolkit_authorName="xiaoshuo" 
	let g:DoxygenToolkit_licenseTag="LGPL" "<-- !!! Does not end with '\<enter>'
 
	""""""""""""""""""""""""""""""""
	" vala-vim-syntax
	""""""""""""""""""""""""""""""""
	" Disable valadoc syntax highlight
	"let vala_ignore_valadoc = 1

	" Enable comment strings
	let vala_comment_strings = 1

	" Highlight space errors
	let vala_space_errors = 1
	" Disable trailing space errors
	"let vala_no_trail_space_error = 1
	" Disable space-tab-space errors
	let vala_no_tab_space_error = 1

	" Minimum lines used for comment syncing (default 50)
	"let vala_minlines = 120


" }


" Autocommands {
	" 读文件时自动设定当前目录为刚读入文件所在的目录
	"autocmd BufReadPost * cd %:p:h
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 " ruby standard 2 spaces, always
	au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 " ...
	au BufRead,BufNewFile *.rb,*.rhtml set tabstop=2 " ...
	" Notes {
		" I consider .notes files special, and handle them differently
		au BufRead,BufNewFile *.notes set foldlevel=1
		au BufRead,BufNewFile *.notes set foldmethod=indent
		au BufRead,BufNewFile *.notes set foldtext=foldtext()
		au BufRead,BufNewFile *.notes set listchars=tab:\ \
		au BufRead,BufNewFile *.notes set noexpandtab
		au BufRead,BufNewFile *.notes set shiftwidth=1
		au BufRead,BufNewFile *.notes set softtabstop=1
		au BufRead,BufNewFile *.notes set syntax=notes
		au BufRead,BufNewFile *.notes set tabstop=1
	" }
	autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
	autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
	au BufRead,BufNewFile *.vala            setfiletype vala
	au BufRead,BufNewFile *.vapi            setfiletype vala
" }

" GUI Settings {
	set guioptions-=m
	set guioptions-=T
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	if has("gui")
		" Basics {
"			colorscheme metacosm " my color scheme (only works in GUI)
"			set columns=150 " perfect size for me
"			set guifont=Consolas:h12 " My favorite font
			set guifont=Monospace\ 12 " My favorite font
"			set guifont=Monospace\ 10 " My favorite font
"			set guioptions=c " use simple dialogs rather than pop-ups
"			set lines=50 " perfect size for me
			set mousehide " hide the mouse cursor when typing
		" }
	endif
" }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Make % work with <>
set mps+=<:>

" Helptags
helptags ~/.vim/doc

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936,big5
let &termencoding=&encoding
set ambiwidth=double        " ambiwidth 默认值为 single。在其值为 single 时，若 encoding 为 utf-8，gvim 显示全角符号时就会出问题，会当作半角显示。

" indent
set autoindent
set cindent
"set smartindent
"set cinkeys=0{,0},0),:,0#,!^F,o,O,e
set cinoptions=g0 " 打开自动缩进和 C 语言风格的缩进模式，定制 C 语言缩进风格
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"set cinwords=if,else,while,do,for,switch

" Search selected content
" Forward(,/)
:vnoremap <silent> ,/ y/<c-r>=escape(@", '\\/.*$^~[]')<cr><cr>
" Backward(,?)
:vnoremap <silent> ,? y?<c-r>=escape(@", '\\/.*$^~[]')<cr><cr>

" Platform
function! MySys()
	return "linux"
endfunction

" Switch to buffer according to file name
function! SwitchToBuf(filename)
	let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
	" find in current tab
	let bufwinnr = bufwinnr(fullfn)
	if bufwinnr != -1
		exec bufwinnr . "wincmd w"
		return
	else
		" find in each tab
		tabfirst
		let tab = 1
		while tab <= tabpagenr("$")
			let bufwinnr = bufwinnr(fullfn)
			if bufwinnr != -1
				exec "normal" . tab . "gt"
				exec bufwinnr . "wincmd w"
				return
			endif
			tabnext
			let tab = tab + 1
		endwhile
		" not exist, new tab
		exec "tabnew" . fullfn
	endif
endfunction

" Fast edit vimrc
"if MySys() == "linux"
	" Fast reloading of the .vimrc
"	map <silent> <leader>s :source ~/.vimrc<cr>
	" Fast editing of .vimrc
"	map <silent> <leader>e :call SwitchToBuf("~/.vimrc")<cr>
	" When .vimrc is edited, reload it
	"autocmd! bufwritepost .vimrc source ~/.vimrc
"elseif MySys() == "windows"
	" Fast reloading of the .vimrc
"	map <silent> <leader>s :source ~/_vimrc<cr>
	" Fast editing of .vimrc
"	map <silent> <leader>e :call SwitchToBuf("~/_vimrc")<cr>
	" When .vimrc is edited, reload it
	"autocmd! bufwritepost _vimrc source ~/_vimrc
"endif

	" autocmd
	"autocmd bufnewfile *.c so ~/.vim/c_header.txt
	"autocmd bufnewfile *.c exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
	"autocmd bufnewfile *.c exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
	"autocmd bufwritepre,filewritepre *.c execute "normal ma"
	"autocmd bufwritepre,filewritepre *.c exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
	"autocmd bufwritepost,filewritepost *.c execute "normal `a"

	" set vimgdb
	"run macros/gdb_mappings.vim



let mapleader="\<space>"

vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

nmap <leader><leader> V

set nopaste




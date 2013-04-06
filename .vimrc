    set nocompatible               " be iMproved
    filetype off                   " required!

    set rtp+=~/.vima/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'

    " Your Bundles here:
    "
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/nerdcommenter'
	Bundle 'mattn/webapi-vim'
	Bundle 'mattn/gist-vim'
	Bundle 'tpope/vim-surround'
	Bundle 'tpope/vim-repeat'
	Bundle 'kien/ctrlp.vim'
	Bundle 'AutoClose'
	Bundle 'ervandew/supertab'
	Bundle 'evindor/vim-rusmode'
	Bundle 'altercation/vim-colors-solarized'
	Bundle 'UltiSnips'
	Bundle 'mattn/zencoding-vim'
	Bundle 'tpope/vim-fugitive'
	Bundle 'git://github.com/pangloss/vim-javascript.git'
	Bundle 'git://github.com/itspriddle/vim-jquery.git'
	Bundle 'git://github.com/kchmck/vim-coffee-script.git'
	Bundle 'git://github.com/walm/jshint.vim.git'


	set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

    filetype plugin indent on     " required!
	syntax enable
    "
    " Brief help
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
    "
    " see :h vundle for more details or wiki for FAQ
    " NOTE: comments after Bundle command are not allowed..

" Search
    set incsearch   " При поиске перескакивать на найденный текст в процессе набора строки
    set hlsearch    " Включаем подсветку выражения, которое ищется в тексте
    set ignorecase  " Игнорировать регистр букв при поиске
    set smartcase   " Override the 'ignorecase' if the search pattern contains upper case characters
    set gdefault    " Включает флаг g в командах замены, типа :%s/a/b/

" <Esc><Esc>
" Clear the search highlight in Normal mode
		nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Ремапим русские символы
	 set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>


    " Мапим ведущую клавишу на ,
    let mapleader = ","

    " ,p
    " Режим вставки извне, без него лютый реформат кода
    set pastetoggle=<LEADER>p

    " Переключение вкладок по tab
    	nmap <Tab> gt
		nmap <S-Tab> gT

	" Shift+> и Shift+< в Visual Mode
		vnoremap < <gv
		vnoremap > >gv

	" Удалить буфер
		nmap <Leader>bd :bdelete<cr>

	"Новый таб
		nmap <Leader>tn :tabnew<cr>

    " Перемещение строк
        " переместить одну строку
        nmap <C-S-k> ddkP
        nmap <C-S-j> ddp
        " переместить несколько выделенных строк http://www.vim.org/scripts/script.php?script_id=1590
        vmap <C-S-k> xkP'[V']
        vmap <C-S-j> xp'[V']

    " Don't skip wrap lines
        " Еще раз и попонятнее:
        " если строка n длиная и не влезла в окно — она перенесется на
        " следующую (wrap on). Шокткаты ниже нужны, чтобы попасть
        " на каждую псевдострочку этой врапнутой строки.
        noremap j gj
        noremap k gk

    " NERDTree
        nmap <Bs> :NERDTreeToggle<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
        let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
        let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'

	set encoding=utf-8
	set wrap
	set linebreak
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set autoindent
	set showmatch
	set cursorline
	set scrolloff=999
	set number

	" Копируем из VIM в общий буфер (vim.gtk и macvim)
	if has("unnamedplus")
	  set clipboard=unnamedplus
	elseif has("clipboard")
	  set clipboard=unnamed
	endif

	nmap <Leader>n :set number! <cr>

	" hjkl в Insert mode зажав <Ctrl>
	imap <C-h> <C-o>h
	imap <C-j> <C-o>j
	imap <C-k> <C-o>k
	imap <C-l> <C-o>l

	" В коммандном режиме разрешить прыгать в конец и начало строки,
	" как в консоли
	cnoremap <C-e> <end>
	imap     <C-e> <c-o>$
	cnoremap <C-a> <home>
	imap     <C-a> <c-o>^

	"unprintable chars
	"
	set list

    " ,v
        " Pressing ,v opens the .vimrc in a new tab
        nmap <leader>v :tabedit $MYVIMRC<CR>

    " Переключение по сплитам
        nmap <C-h> <C-W>h
        nmap <C-j> <C-W>j
        nmap <C-k> <C-W>k
        nmap <C-l> <C-W>l

    " <Space> = <PageDown> Как в браузерах
        nmap <Space> <PageDown>zz

    " n и N
        " когда бегаем по результатам поиска, то пусть они всегда будут в центре
        nmap n nzz
        nmap N Nzz
        nmap * *zz
        nmap # #zz
        nmap g* g*zz
        nmap g# g#zz

    " AutoReload .vimrc
        " from http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
        " Source the vimrc file after saving it
        if has("autocmd")
          autocmd! bufwritepost .vimrc source $MYVIMRC
        endif

		set background=dark
		set t_Co=256
		let g:solarized_termcolors=256
		colorscheme solarized


    " Символ табуляции и конца строки
        if has('multi_byte')
            if version >= 700
                set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
            else
                set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
            endif
        endif

    " Символ, который будет показан перед перенесенной строкой
        if has("linebreak")
              let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
        endif


    " Приводим в порядок status line

        function! FileSize()
            let bytes = getfsize(expand("%:p"))
            if bytes <= 0
                return ""
            endif
            if bytes < 1024
                return bytes . "B"
            else
                return (bytes / 1024) . "K"
            endif
        endfunction

        function! CurDir()
            return expand('%:p:~')
        endfunction

        set laststatus=2
        set statusline=\ 
        set statusline+=%n:\                 " buffer number
        set statusline+=%t                   " filename with full path
        set statusline+=%m                   " modified flag
        set statusline+=\ \ 
        set statusline+=%{&paste?'[paste]\ ':''}
        set statusline+=%{&fileencoding}
        set statusline+=\ \ %Y               " type of file
        set statusline+=\ %3.3(%c%)          " column number
        set statusline+=\ \ %3.9(%l/%L%)     " line / total lines
        "set statusline+=\ \ %2.3p%%          " percentage through file in lines
        set statusline+=\ \ %{FileSize()}
        set statusline+=%<                   " where truncate if line too long
        set statusline+=\ \ CurDir:%{CurDir()}

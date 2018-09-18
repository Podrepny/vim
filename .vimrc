if exists('skip_defaults_vim')
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
"set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=10

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=v
endif

"=============СИНТАКСИС И ПОДСВЕТКА=============
"colorscheme alexey

syntax on

:set hlsearch  " подсветка выражения поиска
":set syntax=whitespace  " подсветка пробелов. Show all tabs: (/\t) Show trailing whitespace: ( /\s\+$ )
"au BufReadPost *.conf set syntax=ini
":filetype plugin on
"=============ПРОБЕЛЫ И ТАБУЛЯЦИЯ=============
set expandtab " вставлять пробелы, а не табы
set softtabstop=2 " величина отступа
set paste " режим вставки, чтобы не дулировать коментарии

"=============КОМЕНТАРИИ=============
"" Закоментировать (^v } I # <ESC>)
" vmap cc :norm i#<CR>  " закоментировать блок v i p c c (выделить ctrl+v) (^v)
" vmap uc :norm ^x<CR>  " Раскоментировать блок v i p u c

"=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
"set foldenable " отклключить фолдинг по умолчанию
"set foldexpr=empty(getline(v:lnum))?'=':indent(v:lnum)/4
"set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
"set foldmethod=expr " определять блоки на основе регулярных выражений
"set foldmethod=syntax " определять блоки на основе синтаксиса файла
"set foldmethod=indent " определять блоки на основе отступов
"set foldnestmax=3       "глубина вложенности 3 уровня
"set foldcolumn=3 " показать полосу для управления сворачиванием
"set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
"set foldopen=all " автоматическое открытие сверток при заходе в них

"=============СТРОКА СОСТОЯНИЯ И ИМЯ ФАЙЛА=============
" always show file name
set modeline
set ls=2
set statusline=[%n]\ %<%F\ \ [%M%R%H%W%Y][%{&fileformat}][%{&fileencoding}]\ \ %=\ line:%l/%L\ (%p%%)\ col:%c\ chr[0x%04B]

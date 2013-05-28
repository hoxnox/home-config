
@param body - HTTP body" 2010.03.11
" hoxnox <hoxnox@gmail.com>

" load vimrc.d/*.vimrc scripts
:runtime! vimrc.d/*.vimrc

filetype plugin indent on

" Open the definition in a horizontal tab
map <A-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

set sessionoptions=blank,buffers,folds,globals,options,resize,sesdir,tabpages,winpos,winsize
set spell
set spelllang=ru,en
set penc=cp1251
set nocp
set virtualedit=all
set nocompatible
set title
"set backup
"set backupdir=$VIM/backup
set autoread
set hidden
set t_Co=256
set ruler
set number
set showmatch
set laststatus=2
set statusline=%1*%m%*%2*%r%*%F%=\ Col:%3*%03v%*\ Ln:%3*%03l%*/%3*%03L%*\ File:%3*%{&filetype}%*-%3*%{&fileformat}%*Enc%3*%{&encoding}%*/%3*%{&fileencoding}%*%<
set tabstop=8 softtabstop=0 shiftwidth=8
set noexpandtab
"set autoindent
set smartindent
set smarttab
set shiftround
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase
set nowrap
" scrolls
set scrolloff=0
set scrolljump=1
set sidescrolloff=0
set sidescroll=1
set backspace=indent,eol,start
set splitbelow
set foldmethod=indent
set foldlevel=99
set nojoinspaces
set list listchars=tab:>-,trail:.,extends:>,precedes:<
set encoding=utf-8
set fileencodings=utf-8,windows-1251,koi8-r,iso-8859-15
" keymap - будем пользоваться вимовской разскладкой
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set wildmenu
set wildcharm=<TAB>
set makeprg=make
if !&diff
        syntax on
endif
if has('gui_running')
        set guioptions-=T
        set guioptions-=t
        set mouse=a
        set mousemodel=popup
"       set guifontset=Fixedsys:h10:cRUSSIAN
endif

let g:miniBufExplorerMoreThanOne=1

"Tags autocomplete
" configure tags - add additional tags here or comment out not-used ones
set tags+=$VIM\ctags\stl
" build tags of your own project with CTRL+F12 
" DISABLED: use undexer instead
" map <S-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" TagList on the right-hand
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 1
let Tlist_Display_Prototype = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Sort_Type = "name"
 

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

"Set colorscheme
colorscheme hoxnox
set colorcolumn=+1,+9


" KEYS
" header/source
nnoremap <a-o> :A<CR>
inoremap <a-o> <ESC>:A<CR>
vnoremap <a-o> <ESC>:A<CR>

" умный прыжок в начало строки
nnoremap <silent><HOME> :call SmartHome('n')<CR>
inoremap <silent><HOME> <C-R>=SmartHome('i')<CR>
vnoremap <silent><HOME> <ESC>:call SmartHome('v')<CR>

" умный прыжок в конец строки
nnoremap <silent><END> :call SmartEnd('n')<CR>
inoremap <silent><END> <C-R>=SmartEnd('i')<CR>
vnoremap <silent><END> <ESC>:call SmartEnd('v')<CR>

" удалить пробелы в конце строк
noremap <silent>,t :call RemoveTrailingSpaces()<CR>:echo 'trailing spaces removed'<CR>

" сохранить
nnoremap <F2> :w<CR>
inoremap <F2> <C-O>:w<CR>
vnoremap <F2> <ESC>:w<CR>

" сохранить всё
nnoremap <C-F2> :wall!<CR>
inoremap <C-F2> <C-O>:wall!<CR>
vnoremap <C-F2> <ESC>:wall!<CR>

" скрыть результаты поиска
nnoremap <F3> :nohlsearch<CR>:echo 'nohlsearch'<CR>
inoremap <F3> <C-O>:nohlsearch<CR><C-O>:echo 'nohlsearch'<CR>
vnoremap <F3> <ESC>:nohlsearch<CR>:echo 'nohlsearch'<CR>

" перенос строк
nnoremap <F4> :setlocal wrap! wrap?<CR>
inoremap <F4> <C-O>:setlocal wrap! wrap?<CR>
vnoremap <F4> <ESC>:setlocal wrap! wrap?<CR>

" Смена кодировки
nnoremap <F10> :e ++enc=cp1251<CR>
inoremap <F10> <C-O>:e ++enc=cp1251<CR>
vnoremap <F10> <ESC>:e ++enc=cp1251<CR>
nnoremap <F11> :e ++enc=cp866<CR>
inoremap <F11> <C-O>:e ++enc=cp866<CR>
vnoremap <F11> <ESC>:e ++enc=cp866<CR>
nnoremap <F12> :e ++enc=utf-8<CR>
inoremap <F12> <C-O>:e ++enc=utf-8<CR>
vnoremap <F12> <ESC>:e ++enc=utf-8<CR>

" --- меню ---
" меню выбора типа конца строк
anoremenu &File.&EOL.&unix :setlocal fileformat=unix<CR>
anoremenu &File.&EOL.&dos :setlocal fileformat=dos<CR>
anoremenu &File.&EOL.&mac :setlocal fileformat=mac<CR>
" меню выбора кодировки сохранения
anoremenu &File.E&ncoding.&Write.&utf-8 :setlocal fileencoding=utf-8<CR>
anoremenu &File.E&ncoding.&Write.&windows-1251 :setlocal fileencoding=windows-1251<CR>
anoremenu &File.E&ncoding.&Write.&iso-8859-15 :setlocal fileencoding=iso-8859-15<CR>
anoremenu &File.E&ncoding.&Write.&koi8-r :setlocal fileencoding=koi8-r<CR>
" меню выбора кодировки чтения
anoremenu &File.E&ncoding.&Read.&utf-8 :edit ++enc=utf-8<CR>
anoremenu &File.E&ncoding.&Read.&windows-1251 :edit ++enc=windows-1251<CR>
anoremenu &File.E&ncoding.&Read.&iso-8859-15 :edit ++enc=iso-8859-15<CR>
" меню проверки орфографии
anoremenu &File.&Spell.&Combined :setlocal spell spelllang=ru,en<CR>
anoremenu &File.&Spell.&Russian :setlocal spell spelllang=ru<CR>
anoremenu &File.&Spell.&English :setlocal spell spelllang=en<CR>
anoremenu &File.&Spell.&Off :setlocal nospell spelllang=<CR>
" меню открытия внешней программой
anoremenu &File.&Preview.&Firefox :!firefox %<CR>
anoremenu &File.&Preview.&Opera :!opera %<CR>
anoremenu &File.&Preview.&Midori :!midori %<CR>

" ограничитель длины строки
set textwidth=72
" hi LineProximity        guibg=#3f3333
" hi LineOverflow guibg=#553333
" hi LineHardLimit        guibg=#550000

" let w:m1=matchadd('LineProximity',  '\%<81v.\%>75v', -1)
" let w:m2=matchadd('LineOverflow',   '\%<133v.\%>81v', -1)
" let w:m2=matchadd('LineHardLimit',  '\%>132v.\+', -1)


" autocmd WinEnter * if !exists('w:created') | let w:m1=matchadd('LineProximity', '\%<81v.\%>75v', -1) | endif
" autocmd WinEnter * if !exists('w:created') | let w:m2=matchadd('LineOverflow',  '\%<133v.\%>81v', -1) | endif
" autocmd WinEnter * if !exists('w:created') | let w:m2=matchadd('LineHardLimit', '\%>132v.\+', -1) | endif

" автоматически перечитывать конфигурацию VIM после сохранения
autocmd! bufwritepost $VIM/_vimrc source $VIM/_vimrc
"autocmd FileType text

" удалить пробелы в конце строк
function! RemoveTrailingSpaces()
        normal! mzHmy
        execute '%s/\s\+$//ge'
        normal! 'yzt`z
endfunction

" умный прыжок в начало строки
function! SmartHome(mode)
        let l:curcol=col('.')
        if l:curcol>indent('.')+2
                call cursor(0, l:curcol-1)
        endif
        if l:curcol==1
                if &wrap
                        normal! g^
                else
                        normal! ^
                endif
        else
                if &wrap
                        normal! g0
                else
                        normal! 0
                endif
        endif
        if a:mode=='v'
                normal! msgv`s
        endif
        return ''
endfunction

" умный прыжок в конец строки
function! SmartEnd(mode)
        let l:curcol=col('.')
        let l:lastcol=col('$')
        if a:mode!='i'
                let l:lastcol-=1
        endif
        if l:curcol<l:lastcol-1
                call cursor(0, l:curcol+1)
        endif
        if l:curcol<l:lastcol
                if &wrap
                        normal! g$
                else
                        normal! $
                endif
        else
                normal! g_
        endif
        if a:mode=='i'
                call cursor(0, col('.')+1)
        elseif a:mode=='v'
                normal! msgv`s
        endif
        return ''
endfunction

" Выдает сообщение в stderr
function! ShowError(text)
   echohl Error
   echo a:text
   echohl None
endfunction

com! -range -nargs=* Format <line1>,<line2>call Format(<f-args>)
" сформировать абзац с отступом 4, шириной textwidth, без переноса слов
nmap _f :Format 4 tw<CR>
vmap _f :Format 4 tw<CR>
" сформировать абзац с отступом 4, шириной textwidth, символ переноса - '-'
nmap _wf :Format 4 tw -<CR>
vmap _wf :Format 4 tw -<CR>
" из каждой строки range сформировать абзац с отступом 4, шириной texwidth,
" без переноса слов
nmap _F :call FormatLines(4, 'tw')<CR>
vmap _F :call FormatLines(4, 'tw')<CR>
" из каждой строки range сформировать абзац с отступом 4, шириной texwidth,
" символ переноса слов - '-'
nmap _WF :call FormatLines(4, 'tw', '-')<CR>
vmap _WF :call FormatLines(4, 'tw', '-')<CR>

" Для каждой строки из range выполняет Format
function! FormatLines(indent, textwidth, ...) range
  if a:0 > 1
    call ShowError('FormatLines: too many arguments')
  endif
  let cnt = a:lastline - a:firstline
  call cursor( a:firstline )
  let i = 0
  if a:0 == 1
    call Format(a:indent, a:textwidth, a:1)
  else
    call Format(a:indent, a:textwidth)
  endif
  while i < cnt
    call cursor(line(".") + 1, 0)
    if a:0 == 1
      call Format(a:indent, a:textwidth, a:1)
    else
      call Format(a:indent, a:textwidth)
    endif
    let i = i + 1
  endwhile
endfunction

" Функция объединяет выделенные строки в один абзац, разделяет на строки по
" textwidth длиной с indent отступом в начале и, если задан символ переноса 
" слова  (3 аргумент), переносом строк.
" 3 аргумент должен быть одним символом, отличным от '\n'
function! Format(indent, textwidth, ...) range
  if a:0 > 1
    call ShowError('Too many arguments')
  endif
  if a:indent =~ '^\d\+$' && (a:textwidth =~ '^\d\+$' || a:textwidth == 'tw')
    execute 'set formatoptions=tq'
    if a:textwidth != 'tw'
      let txtw = a:textwidth
    else
      let txtw = &textwidth
    endif
    " объединяем
    execute a:firstline.','.a:lastline.'j'
    " уадляем лишние пробелы
    execute 's/\s\+/ /g'
    " делаем отступ
    execute 'left '.a:indent
    " делим на строки
    let tmp = 0
    if a:0 == 1
      let g:wrap_divide_words = 1
      let tmp = a:1
    else
      let g:wrap_divide_words = 0
    endif
    call Wrap(txtw, tmp)
    " выравниваем
    execute 'runtime macros/justify.vim'
    let lastline = line(".") - 1
    if a:firstline <= lastline
      execute a:firstline.','.lastline.'Justify tw 4'
    endif
    " для удобства оставляем курсор на последней строке
    call cursor( lastline + 1, 0 )
  else
    call ShowError('Format: wrong parameter value')
    return 2
  endif
endfunction

" Разделить слово по слогам
" Точное происхождение алгоритма неизвестно, по сети он бродит под именем 
" ?алгоритм П. Хpистова в модификации Дымченко и Ваpсанофьева?
function! DivideWord(text, hyphen)
  " Объявляем гласные/согласные/особые символы алфавита в разных кодировках
  if &encoding == 'utf-8'
    let RusAll  = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
    let RusAll .= 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
    let RusV    = 'аеёиоуыэюяАЕЁИОУЫЭЮЯ'
    let RusN    = 'бвгджзклмнпрстфхцчшщБВГДЖЗКЛМНПРСТФХЦЧШЩ'
    let RusX    = 'ьъйЬЪЙ'
  elseif(&encoding == 'cp866')
    let RusAll  = ' ?????с??Ё©??????абвгдежзийклмноп'
    let RusAll .= '??????р??????????????????????????'
    let RusV    = ' ?сЁ?глноп??р???????'
    let RusN    = '???????????абвдежзий????????????????????'
    let RusX    = 'мк©???'
  elseif(&encoding == 'utf-8')
    let RusAll  = 'Р°Р?Р?Р?Р?Р?С?Р?Р·РёР?Р?Р?Р?Р?'
    let RusAll .= 'Р?Р?С?С?С?С?С?С?С?С?С?С?С?С?С?С?С?'
    let RusAll .= 'Р?Р?Р?Р?Р?Р?Р?Р?Р?Р?Р?Р?Р?Р?Р?'
    let RusAll .= 'Р?Р?Р Р?Р?Р?Р?Р?Р?Р?Р©Р?РЁС?Р?Р?Р?'
    let RusV    = 'Р°Р?С?РёР?С?С?С?С?С?Р?Р?Р?Р?Р?Р?Р?Р?Р?Р?'
    let RusN    = 'Р?Р?Р?Р?Р?Р·Р?Р?Р?Р?Р?Р?С?С?С?С?С?С?С?С?С?С?'
    let RusN   .= 'Р?Р?Р?Р?Р?Р?Р?Р?Р?Р?Р?Р Р?Р?Р?Р?Р?Р?РЁР©'
    let RusX    = 'С?С?Р?Р?Р?Р?'
  else
    ShowError('DivideWord: wrong encoding')
    return 2
  endif
  let text = a:text
  " последовательно применяем замены
  let p = '\(['.RusX.']\)\(['.RusAll.']{2}\)'
  let text = substitute(text, p, '\1'.a:hyphen.'\2', "g")
  let p = '\(['.RusV.']\)\(['.RusV.']['.RusAll.']\)'
  let text = substitute(text, p, '\1'.a:hyphen.'\2', "g")
  let p = '\(['.RusV.']['.RusN.']\)\(['.RusN.']['.RusV.']\)'
  let text = substitute(text, p, '\1'.a:hyphen.'\2', "g")
  let p = '\(['.RusN.']['.RusV.']\)\(['.RusN.']['.RusV.']\)'
  let text = substitute(text, p, '\1'.a:hyphen.'\2', "g")
  let p = '\(['.RusV.']['.RusN.']\)\(['.RusN.']['.RusN.']['.RusV.']\)'
  let text = substitute(text, p, '\1'.a:hyphen.'\2', "g")
  let p = '\(['.RusV.']['.RusN.']['.RusN.']\)\(['.RusN.']['.RusN.']['.RusV.']\)'
  let text = substitute(text, p, '\1'.a:hyphen.'\2', "g")
  return text
endfunction

" Вставить разделитель левее указанной позиции
function! DivideWordInPos(str, pos, hyphen)
  let dvd = DivideWord(a:str, "\n")
  let dvdlen = strlen(dvd)
  let pos = 0
  let lbp = 0
  let cnt = 0
  while cnt < dvdlen && pos < a:pos
    if dvd[cnt] == "\n"
        let lbp = pos
    else
        let pos = pos + 1
    endif
    let cnt = cnt + 1
  endwhile
  if lbp > 0
    let lpart = strpart(a:str, 0, lbp)
    return lpart.a:hyphen.strpart(a:str, lbp, strlen(a:str) - lbp)
  else
    return a:str
  endif
endfunction

" Разрывает строку на две в позиции pos и записывает в буффер
function! TearWriteStr(str, pos)
  call setline(line("."), strpart(a:str, 0, a:pos))
  call append(line("."), strpart(a:str, a:pos + 1))
  call cursor(line(".") + 1, 0)
endfunction

" Рекурсивная функция разбивает строку на куски длиной не более textwidth
" символ переноса hyphen должен быть длиной не более 1 символа
" Кроме того, поведение функции Wrap контролирует глобальная переменная
" g:wrap_divide_words. Если ее значение 1, то функция использует перенос
" слов, если 0, то переносы слов запрещены.
let g:wrap_divide_words = 1
function! Wrap(textwidth, hyphen)
  if strlen(a:hyphen) > 1
    call ShowError('Wrap: hyphen mast be one symbol')
  endif
  if a:textwidth < 4
    call ShowError('Wrap: Textwidth too short')
  endif
  let str = getline(".")
  let strlen = strlen(str)
  let textwidth = a:textwidth - 1
  if strlen <= textwidth
    return
  endif
  " left и right - сдвиги от места разрыва слова до его начала и конца
  let right = 0
  while right + textwidth < strlen && str[textwidth + right] !~ '\s'
    let right = right + 1
  endwhile
  let left = 0
  while left <= textwidth && str[textwidth - left] !~ '\s'
    let left = left + 1
  endwhile
  " слово очень длинное и заканчивает абзац
  if left == textwidth && (right + textwidth == strlen) 
    return
  endif
  " слово длинное, но после него абзац не заканчивается
  if left==textwidth && (right+textwidth != strlen) || (left == 0 && right == 0)
    call TearWriteStr(str, textwidth + right)
    call Wrap( a:textwidth, a:hyphen )
    return
  endif
  " делим слово и разбиваем строку на 2
  let part = strpart(str, textwidth - left + 1, right + left - 1)
  let dvd = DivideWordInPos(part, left, a:hyphen.' ')
  let divpos = match(dvd, a:hyphen.' ')
  let wrappos = textwidth - left + divpos + 2
  if g:wrap_divide_words == 0 || divpos == -1 || wrappos > textwidth + 1
    " слово не может быть разделено, приходится его переносить
    call TearWriteStr( str, textwidth - left )
    call Wrap( a:textwidth, a:hyphen )
  else
    " делим слово и строку
    let lpart = strpart(str, 0, textwidth - left + 1)
    let rpart = strpart(str, textwidth + right, strlen - textwidth - right + 1)
    let str = lpart.dvd.rpart
    call TearWriteStr( str, wrappos )
    call Wrap( a:textwidth, a:hyphen )
  endif
endfunction

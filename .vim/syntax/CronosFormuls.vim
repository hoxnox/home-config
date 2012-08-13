" Vim syntax file
" Language:	Cronos - formuls
" Maintainer:	hoxnox <hoxnox@gmail.com>
" Last Change:	2009 Nov 10

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Case insensitive language
syn case ignore

" Keywords
syn keyword cfSystemVars    @CURRENTTIME @CURRENTDATE @USERNAME @BANKNAME @BASENAME @BASEMNEMOCODE @SYSNOMER @TEMPDIR @VALUESEPARATOR @STATION @USERID @ENDOFLINE @RET
syn keyword cfJump          GOTO
" Functions
syn keyword cfFunDate       ADDAGE AGE CHECKDATE DATE DATETOYMD INTERVAL MULAGE SUBAGE SUMAGE
syn keyword cfFunTime       ADDTIME CHECKTIME SUBTIME SUMTIME TIME
syn keyword cfFunNumbers    ROUND ABS DES INT NUM NUMTOTEXT POWER
syn keyword cfFunStrings    CHAR CHECKSYMBOL CHECKHTML CONCAT CONVERT CR ENDOFLINE FIELD GETNEXT INDEX LATRUS LEN LOWER LR QUOTE RR RUSLAT SCOUNT SEQ STR SUBSTR SWAP TRIM ULOWER UPPER UTF82WIN WIN2UTF8
syn keyword cfFunFiles      APPENDFILE DELETEFILE DIR GETFILEPROPERTIES GETFOLDER MAKEFOLDER OPENFILE READFILE RENAMEFILE SAVEFILE WRITEFILE
syn keyword cfFunCoded      ADDVOCRECORD DECODE DSL FSL GETVOCCODE MSL NSL SL
syn keyword cfFunFile       ADDFILE GETFILE GETFILENAME GETEXT GETTEXT SETFILE SETFILENAME SETEXT SETTEXT
syn keyword cfFunDynamic    ADDVALUECHECK CATVAL COMPSTRING COMPSTRINGALL DELETEVAL EXIST INSERTVAL LOCATEVAL LOCATEALLVAL MAXVAL MINVAL SORT SUMVAL VALCOUNT VALCOUNT1 VALCOUNT2
syn keyword cfFunIOVal      DELETE GETGLOBAL ICGETVAR ICSETVAR LOAD LOADLOCK SAVE SAVEUNLOCK SETGLOBAL
syn keyword cfFunKeyboard   SETGLOBAL INPUTCOMMENT INPUTDATE INPUTDATEINTERVAL
syn keyword cfFunInform     GETBASENAME GETNAME GETNUMBER GETSN RECORDSCOUNT
syn keyword cfFunValues     GETFIELD SETFIELD
syn keyword cfFunRelation   ADDRECORD CAT COUNT DELETERECORD DELETERECORDS LINKROOT LOOP MAX MIN NEW SUM USERECORD USERECORD USERECORD
syn keyword cfFunSelected   FIND FINDARRAY GETCOUNTARRAY GETINDEXARRAY UNIONARRAYS ANDARRAYS SORTRECORDS
syn keyword cfFunAccess     ADDACCESS CHECKACCESS DELETEACCESS
syn keyword cfFunSpecial    BANKRENAME COPYWAIT ENDBAR EXECUTE FORMULAEXECUTE FORMULATRANSLATE GETSIGNATURE GETSTOPFLAG GLOBALDELETE LUASCRIPT MAKEREPORT MESSAGE PAUSE RUNBANKFUNCTION RUNSYSTEMFUNCTION SETPOSBAR STARTBAR
syn keyword cfFunDebug      LOGINIT LOGCLEAR LOGDUMP LOGVARS TRACEALL TRACEVAR


" Const
syn match  cfNumber          /-\?\d*\.\?\d*/
syn region cfString start=/"/ skip=/\\"/ end=/"\|$/ contains=cfLineComment,cfMultyComment keepend
" Identifiers
syn match  cfGlobalIdent     /\c@@[A-ZА-Я][A-ZА-Я0-9_]*/
syn match  cfIdentifier      /\c@[A-ZА-Я][A-ZА-Я0-9_]*/
syn match  cfBankField       /\c[a-zА-Я0-9]\{2}\d\{1,3}/
syn match  cfBankRelation    /\c[a-zА-Я0-9]\{2}\d\{1,3}_[a-zА-Я0-9]\{2}/
" Operators
syn match  cfMathOperator    /-\|+\|\*\|%\|\/\|<</
syn match  cfLogicOperator   /=\|#\|>\|</
syn match  cfBooleanOperator /&\||\|NOT/
syn match  cfAssignOperator  /:=/
" Conditional operators
syn region cfWhile matchgroup=cfWhile start=/\cwhile/ end=/\cDO/ contains=cfCondNest
syn region cfIf matchgroup=cfIf start=/\cif/ end=/then/ contains=cfCondNest
syn match cfElse /\celse/
syn region cfCondNest start=/(/ end=/)/ contains=ALL contained transparent

" Comments
syn region cfMultyComment start=/\/\*/ end=/\*\//
syn region cfLineComment start=/\/\// end=/$/ contains=cfMultyComment keepend


" Highlight
hi default link cfJump            Error
hi default link cfSystemVars      Constant
hi default link cfString          Constant
hi default link cfNumber          Constant
hi default link cfBankField       Special
hi default link cfBankRelation    Special
hi default link cfGlobalIdent     Identifier
hi default link cfIdentifier      Identifier
hi default link cfMultyComment    Comment
hi default link cfLineComment     Comment
hi default link cfMathOperator    Operator
hi default link cfLogicOperator   Operator
hi default link cfBooleanOperator Operator
hi default link cfAssignOperator  Operator
hi default link cfFunctions       Function
hi default link cfWhile           Repeat
hi default link cfIf              Conditional
hi default link cfElse            Conditional
hi default link cfFunDate         Function
hi default link cfFunTime         Function
hi default link cfFunNumbers      Function
hi default link cfFunStrings      Function
hi default link cfFunFiles        Function
hi default link cfFunCoded        Function
hi default link cfFunFile         Function
hi default link cfFunDynamic      Function
hi default link cfFunIOVal        Function
hi default link cfFunKeyboard     Function
hi default link cfFunInform       Function
hi default link cfFunValues       Function
hi default link cfFunRelation     Function
hi default link cfFunSelected     Function
hi default link cfFunAccess       Function
hi default link cfFunSpecial      Function
hi default link cfFunDebug        Function

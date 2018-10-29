" Vim syntax file
" Language:	Gambas3 source files (*.class, *.module)
" Author:	Tobias Boege (2012)

" Directives
syn keyword gb3_dir	#If #Else #Endif

" Shebang in scripts
syn match gb3_comment	/^#!.*gbs3/

" String
syn region gb3_string	start=/"/ end=/"/ skip=/\\./

" Language Constants
syn keyword gb3_const	True False +Inf -Inf Null

" Labels
syn match gb3_label	/^\s*.+:/

" Comments
syn region gb3_comment	start=/\'/ end=/$/
syn region gb3_comment	start=/#If False/ end=/#Endif/ skip=/#Else/

" Assignment
syn keyword gb3_key	Let Swap
" Control structures
syn keyword gb3_key	If Then Else Endif
syn keyword gb3_key	Select Case End
syn keyword gb3_key	Do Loop For Next To Step Each Repeat Until While Wend
syn keyword gb3_key	Break Continue Default DownTo In
syn keyword gb3_key	Return Goto GoSub Quit Stop With
" Error management
syn keyword gb3_key	Catch Debug Error Finally Try
" JIT compilation
syn keyword gb3_key	Fast
" Class and type description
syn keyword gb3_key	Enum Event Raise Wait Property Read Const
syn keyword gb3_key	Class Create Export Inherits Is Last Me Super
" Arithmetic
syn keyword gb3_key	Inc Dec Div Mod
" Logical operators
syn keyword gb3_key	And Or Not Xor
" Externals
syn keyword gb3_key	Extern Library
" Files
syn keyword gb3_key	Chmod Chown Chgrp Copy Kill Link MkDir Move RmDir
" Local variable declaration
syn keyword gb3_key	Dim As New
" Method/global declaration
syn keyword gb3_key	Static Public Private Function Sub Procedure ByRef
syn keyword gb3_key	Optional
" Process management
syn keyword gb3_key	Exec Shell
" Stream
syn keyword gb3_key	Open Close Create To Input Output Line Flush Lock
syn keyword gb3_key	Pipe Print Read Write Seek Unlock Memory Watch
" String
syn keyword gb3_key	Like Begins Ends Match
" Structure
syn keyword gb3_key	Struct
" Misc
syn keyword gb3_key	Randomize Sleep Use

hi def link gb3_dir	Preproc
hi def link gb3_string	String
hi def link gb3_const	Constant
hi def link gb3_label	Label
hi def link gb3_comment	Comment
hi def link gb3_key	Keyword

" Two spaces, no tabs in Gambas
set expandtab

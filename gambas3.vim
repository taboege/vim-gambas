" Vim syntax file
" Language:	Gambas3 source files (*.class, *.module)
" Author:	Tobias Boege (2012, 2018)

" TODO:
" legend: [ ] open, [/] in progress/idea, [X] done
"
"  [ ] Check for new keywords.
"  [/] Highlight TODO, FIXME, XXX? -> Todo syntax category
"  [/] More syntax categories, e.g. ByRef is not the same category
"      as Div or Procedure. -> found all applicable categories in vim
"  [ ] Non-keyword operators?
"  [/] Maybe highlight escaped special chars like "\n" in strings
"      like the IDE does these days, also "&1" (-> SpecialChar)
"  [ ] Maybe highlight translatable strings with underline (hard to
"      detect if parens are a method call or translatable marker)?
"  [ ] Core types Boolean, Int, Long, Short, Float, String, etc.
"  [ ] Core functions MkDate, CDate, etc.
"  [ ] Gambas markdown syntax file and highlight that in '' and '''
"      style comments (see help :syn-include or cpp.doxygen for example,
"      make gambas.markdown similarly).
"  [ ] Folding?
"  [ ] Figure out how to handle keywords with a space, as they often
"      appear in Gambas: "Create Static", "Select Case", where subkeywords
"      like "Create" and "Case" may appear elsewhere and mean something
"      else, even get a different syntax category.
"  [/] README with instructions on how to set up Gambas syntax highlighting.

" Generically, i.e. when a better syntax category is lacking, instructions
" which perform an operation are gb_op, while keywords which declare, define
" or control are gb_key.

" Directives
syn keyword gb_precond	#If #Else #Endif

" Shebang in scripts
syn match gb_comment	/^#!.*gb.3/

" String
syn region gb_str	start=/"/ end=/"/ skip=/\\./

" Language Constants
syn keyword gb_const	Null
syn keyword gb_bool	True False
syn keyword gb_number	Pi +Inf -Inf

" Labels
syn match gb_label	/^\s*.+:/

" Comments
syn region gb_comment	start=/\'/ end=/$/
syn region gb_comment	start=/#If False/ end=/#Endif/ end=/#Else/
"syn region gb_comment	skip #If True and match the #Else region...

" Assignment
syn keyword gb_op	Let Swap
"
" Control structures
syn keyword gb_cond	If Then Else Endif
syn keyword gb_cond	Select Case End
syn keyword gb_repeat	Do Loop For Next To DownTo Step Each In Repeat Until While Wend
" TODO: "Select Case" should be a gb_cond keyword, but Case and Default
" should be gb_label keywords

" Flow control is Special for lack of a better category
syn keyword gb_spec	Break Continue Default
syn keyword gb_spec	Return Goto GoSub Quit Stop With

" Error management
syn keyword gb_except	Catch Debug Error Finally Try
" TODO: Error is a class, writing to stderr and sometimes also
" a Boolean for whether an error happened.

" JIT compilation
syn keyword gb_storage	Fast

" Class and type description
syn keyword gb_struct	Struct Enum
" TODO: Enum is also a class, as is String and probably others.
" But the Enum declarator has nothing to do with the Enum class.
syn keyword gb_key	Event Property Read Const
syn keyword gb_key	Class Create Export Inherits
" TODO: Create here is part of "Create Static", not Open's Create flag
syn keyword gb_op	Raise Is
syn keyword gb_spec	Last Me Super

" Method/global declaration
syn keyword gb_storage	Static
syn keyword gb_key	Public Private
syn keyword gb_key	Function Sub Procedure
syn keyword gb_spec	Optional ByRef

" Local variable declaration
syn keyword gb_key	Dim As
syn keyword gb_op	New

" Arithmetic
syn keyword gb_op	Inc Dec Div Mod

" Logical operators
syn keyword gb_op	And Or Not Xor

" Externals
syn keyword gb_key	Extern Library

" Files
syn keyword gb_op	Chmod Chown Chgrp Copy Kill Link MkDir Move RmDir

" Process management
syn keyword gb_op	Exec Shell
" TODO: "To" can be used in gb_repeat above but also for Exec and Shell,
" or "Output/Error To".
" TODO: "Wait" is ambiguous as well.

" Stream
syn keyword gb_op	Open Close Memory Pipe Line Flush Lock Unlock
syn keyword gb_key	Create Input Ouput Watch
" TODO: "Input" is a flag to Open (gb_key), but also three instructions (gb_op),
" namely Input by itself, it is part of Line Input and of Input From.
" Output also has the flag and Output To. There is also Error To.
" TODO: "Open String" exists too.
syn keyword gb_op	Print Read Write Seek

" String
syn keyword gb_op	Like Begins Ends Match

" Misc
syn keyword gb_op	Randomize Sleep Use Wait

hi def link gb_comment	Comment

hi def link gb_const	Constant
hi def link gb_str	String
hi def link gb_number	Number
hi def link gb_bool	Boolean

hi def link gb_ident	Identifier
hi def link gb_func	Function

hi def link gb_stmt	Statement
hi def link gb_cond	Conditional
hi def link gb_repeat	Repeat
hi def link gb_label	Label
hi def link gb_op	Operator
hi def link gb_key	Keyword
hi def link gb_except	Exception

hi def link gb_preproc	PreProc
hi def link gb_precond	PreCondit

hi def link gb_type	Type
hi def link gb_storage	StorageClass
hi def link gb_struct	Structure

hi def link gb_spec	Special
hi def link gb_escape	SpecialChar

hi def link gb_error	Error

hi def link gb_todo	Todo

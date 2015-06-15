#include debug.ahk
#include Functions.ahk

<^>b::	
	init()
	EnterContextKey("b")
	closeAndSelectNext()
return

<^>d::
	init()
	EnterContextKey("d")
	SendInput +{tab 8}
	SendInput Spend
	sleepLong()
	SendInput {tab 2}
return

<^+>e::
	init()
	EnterContextKey("z")
return

<^>e::
	init()
	EnterContextKey("z")
	closeAndSelectNext()
return

<^>m::
	init()
	SendInput {tab 12}
	sleepMiddle()
	copy()
	Input :=  RegExReplace(clipboard, "[\W\d]", " ")  
	Input :=  RegExReplace(Input, "[ ]{1,9}", " ")  
	NameArray := StrSplit(Input, " ")
	Vorname := NameArray[2]
	Name := NameArray[1]
	SendInput +{tab 12}
	EnterContextKey("m")z
	SendInput {tab 3}
	sleepShort()
	SendInput *%Vorname%*
	SendInput {tab 2}
	SendInput *%Name%*
	SendInput +{tab 7}
return

<^>s::
	init()	
	openSchnellsuche()		
return

<^+>s::
	init()	
	StringLeft, name, clipboard, 25
	openSchnellsuche()	
	name :=  Trim(name)
	SendInput *%name%*
return

; Vertauschen zweier Felder unabhängig davon ob ein oder zwei Tabs zwischen den Feldern 
<^>t::
	init()
	cut()
	eins = %clipboard%
	tabs := cutWithTabCount()
	zwei = %clipboard%
	SendInput %eins%
	if tabs = 1
		SendInput +{tab}
	else if tabs = 2
		SendInput +{tab 2}
	sleepShort()
	SendInput %zwei%
return
 

F1::
	init()
	showHelp()
return



<^>q::
	init()
ExitApp 


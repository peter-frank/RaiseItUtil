#include debug.ahk

<^>t::
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
 
<^>s::	
	openSchnellsuche()		
return

<^+>s::	
	StringLeft, name, clipboard, 25
	openSchnellsuche()	
	SendInput *%name%*
return

openSchnellsuche(){
	sleepShort()
	Send !p	
	sleepShort()
	SendInput s
	sleepMiddle()
	SendInput {tab 3}
}


cutWithTabCount(){
	SendInput {tab}
	sleepMiddle()
	cut()
	if clipboard
		{
		   	return 1	
		}
	SendInput {tab}
	cut()	
	if clipboard
		{
		   	return 2	
		}
	MsgBox, 4, , Leider fehlgeschlagen - bitte nochmal versuchen bzw. Fehler melden, 5	
	return
}

F1::
	showHelp()
return

; Opens The Context Help with F12 and enters the Key
EnterContextKey(Key){
	sleepShort()
	SendInput {F12}
	sleepShort()
	SendInput %Key%
	sleepShort()
}


appendCommandDescription(Gui,command,description){
	Gui, font,bold
	Gui, Add, Text,X15,%command% ->%A_Space% 
	Gui, font, 
	Gui, Add, Text,X+0, %description%
}

copy(){
	clipboard = ; Empty the clipboard
	Send, ^c
	ClipWait, 1
}


cut(){
	clipboard = ; Empty the clipboard
	sleepShort()
	Send, ^a
	sleepShort()
	Send, ^x
	ClipWait, 1
}

showHelp(){
	Gui, Add, Text,, Moegliche Befehle: 
	appendCommandDescription(Gui,"Strg+b","Umsatz buchen und naechsten Umsatz oeffnen")
	appendCommandDescription(Gui,"Strg+d","Daten einfuegen bei der Partner Anlage")
	appendCommandDescription(Gui,"Strg+e","Umsatz zuordnen")	
	appendCommandDescription(Gui,"Strg+m","Manuellen Vorschlag erstellen")
	appendCommandDescription(Gui,"Strg+q","RaiseIt Hotkeys Beenden")		
	appendCommandDescription(Gui,"Strg+s","Schnellsuche oeffnen")
	appendCommandDescription(Gui,"Strg+S","Schnellsuche oeffnen und Name einfuegen")
	appendCommandDescription(Gui,"Strg+t","Felder vertauschen")
	
	gui, add, button, yp+20  gmyguiclose, Close
	gui, add, button, X+0  gdocu, Online-Doku
	gui,show
return

myguiclose:
      {
      gui,destroy
      return
      }
	  
docu:
      {
      Run, https://docs.google.com/document/d/1WA8Y0voUtA-SuQqbUyLi_VA8BQZPL2kWvVVurOyJACg
	  gui,destroy
      return
      }	  
}


<^>m::
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

<^>d::
	EnterContextKey("d")
	SendInput +{tab 8}
	SendInput Spend
	sleepLong()
	SendInput {tab 2}
return

<^>q::
ExitApp 

<^>b::
	EnterContextKey("b")
	send, !o
	sleepShort()
	SendInput,{DOWN}
	sleepShort()
	SendInput,{enter}
return

<^>z::
	EnterContextKey("z")
return

sleepShort(){
	sleep, 200
}

sleepMiddle(){
	sleepShort()
	sleepShort()
	sleepShort()
}

sleepLong(){
	sleepMiddle()
	sleepMiddle()
}

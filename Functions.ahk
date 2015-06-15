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
    static _ := showHelp()

	Gui, Add, Text,, Moegliche Befehle: 
	appendCommandDescription(Gui,"Strg+b","Umsatz buchen und naechsten Umsatz oeffnen")
	appendCommandDescription(Gui,"Strg+d","Daten einfuegen bei der Partner Anlage")
	appendCommandDescription(Gui,"Strg+e","Umsatz zuordnen und naechsten Umsatz oeffnen")
	appendCommandDescription(Gui,"Strg+E","Umsatz zuordnen")		
	appendCommandDescription(Gui,"Strg+m","Manuellen Vorschlag erstellen")
	appendCommandDescription(Gui,"Strg+q","RaiseIt Hotkeys Beenden")		
	appendCommandDescription(Gui,"Strg+s","Schnellsuche oeffnen")
	appendCommandDescription(Gui,"Strg+S","Schnellsuche oeffnen und Name einfuegen")
	appendCommandDescription(Gui,"Strg+t","Felder vertauschen")
	appendCommandDescription(Gui,"F1","Schnellhilfe")

	
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

closeAndSelectNext(){
	send, !o
	sleepShort()
	SendInput,{DOWN}
	sleepShort()
	SendInput,{enter}
}
	
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

init(){
; Verify if the active window is RaiseIt
WinGetActiveTitle, OutputVar
IfInString, OutputVar, 2X
	{
	  return
	}
	else
	{
	   MsgBox "RaisIt Hotkeys sind aktiviert, sollten aber nur in RaiseIt ausgefuehrt werden. Um die Hotkeys zu deaktivieren bitte Strg+q druecken" 
	   Exit
	}
}
short 	:= 100
middle 	:= 2*short
long 	:= 5*short
verylong	:= 10*short


<^>m::
SendInput {tab 12}
sleep, long
copy()
Input :=  RegExReplace(clipboard, "[\W\d]", " ")  
Input :=  RegExReplace(Input, "[ ]{1,9}", " ")  
NameArray := StrSplit(Input, " ")
Vorname := NameArray[2]
Name := NameArray[1]
SendInput +{tab 12}
EnterContextKey("m")
SendInput {tab 3}
sleep, middle
SendInput %Vorname%*
SendInput {tab 2}
SendInput %Name%*
SendInput +{tab 7}
return

<^>d::
EnterContextKey("d")

SendInput +{tab 8}
SendInput Spend
sleep, middle
SendInput {tab 2}
return

<^>q::
EnterContextKey("b")
send, !o
sleep, 400
SendInput,{DOWN}
sleep, 400
SendInput,{enter}
return

<^>e::
EnterContextKey("z")
return

<^>t::
Clipboard =
sleep, middle
Send, ^a
sleep, middle
Send, ^x
ClipWait
sleep, middle
tmp = %clipboard%
Clipboard =
SendInput {tab}
sleep, middle
Send, ^a
sleep, middle
Send, ^x
ClipWait
sleep, middle
zwei = %clipboard%
SendInput %tmp%
sleep, middle
SendInput +{tab}
sleep, middle
SendInput %zwei%
return

F1::
splash()
return


<^>r::
Clipboard =
sleep, middle
Send, ^a
sleep, middle
Send, ^x
ClipWait
sleep, middle
tmp = %clipboard%
Clipboard =
SendInput {tab 2}
sleep, middle
Send, ^a
sleep, middle
Send, ^x
ClipWait
sleep, middle
zwei = %clipboard%
SendInput %tmp%
sleep, middle
SendInput +{tab 2}
sleep, middle
SendInput %zwei%
return

; Opens The Context Help with F12 and enters the Key
EnterContextKey(Key){
sleep, middle
SendInput {F12}
sleep, middle
SendInput %Key%
sleep, middle
}

copy(){
clipboard = ; Empty the clipboard
Send, ^c
ClipWait, 2
}

splash(){
Var :=
(
Line 1 of the text.
Line 2 of the text. By default, a linefeed (`n) is present between lines.
)

SplashTextOn, , Var , Displays only a title bar.
Sleep, 2000
SplashTextOn, 400, 300, Clipboard, The clipboard contains:`n%clipboard%
Sleep, 2000
SplashTextOff
}

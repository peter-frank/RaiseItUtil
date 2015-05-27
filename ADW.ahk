!m::
SendInput {tab 12}
sleep, 600
SendInput ^a 
sleep, 100
SendInput ^c 
sleep, 100
Input :=  RegExReplace(clipboard, "[\W\d]", " ")  
Input :=  RegExReplace(Input, "[ ]{1,9}", " ")  
NameArray := StrSplit(Input, " ")
Vorname := NameArray[2]
Name := NameArray[1]
sleep, 200
SendInput +{tab 12}
sleep, 200
SendInput {F12}
sleep, 200
SendInput m
sleep, 200
SendInput {tab 3}
sleep, 200
SendInput %Vorname%
sleep, 200
SendInput {tab 2}
SendInput %Name%
SendInput +{tab 7}
return

!d::
sleep, 300
SendInput {F12}
sleep, 200
SendInput d
sleep, 200
SendInput +{tab 8}
SendInput Spend
sleep, 200
SendInput {tab 2}
return


<^>b::
sleep, 300
SendInput {F12}
sleep, 200
SendInput b
sleep, 200
send, !o
return

!z::
sleep, 300
SendInput {F12}
sleep, 200
SendInput z
return

!t::
Clipboard =
sleep, 300
Send, ^a
sleep, 200
Send, ^x
ClipWait
sleep, 200
tmp = %clipboard%
Clipboard =
SendInput {tab}
sleep, 300
Send, ^a
sleep, 200
Send, ^x
ClipWait
sleep, 200
zwei = %clipboard%
SendInput %tmp%
sleep, 200
SendInput +{tab}
sleep, 300
SendInput %zwei%
return

!r::
Clipboard =
sleep, 300
Send, ^a
sleep, 200
Send, ^x
ClipWait
sleep, 200
tmp = %clipboard%
Clipboard =
SendInput {tab 2}
sleep, 300
Send, ^a
sleep, 200
Send, ^x
ClipWait
sleep, 200
zwei = %clipboard%
SendInput %tmp%
sleep, 200
SendInput +{tab 2}
sleep, 300
SendInput %zwei%
return
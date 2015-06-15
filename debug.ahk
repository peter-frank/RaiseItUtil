
<^>r::
Run C:\Program Files\AutoHotkey\Compiler\Ahk2exe.exe /in D:\Git\RaiseItADW\ADW.ahk /out D:\dev\mdm\RaiseItHotkey.exe
	reload
	
return

log(text){
	FileAppend, %text%`n, D:\Git\RaiseItADW\log.txt
}


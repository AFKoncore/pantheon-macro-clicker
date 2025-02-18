#SingleInstance force

; Pantheon Macro Clicker, by Core (afkoncore). 
; Uses Auto Hot Key v1.1 https://www.autohotkey.com/download/1.1/?C=M;O=D
; Start the script, an icon will appear in your system tray (right of the task bar, next to the clock), a white H in a green square. 
; Right click this icon and pick Window Spy. Under the 'Mouse Position' look at the line that says 'Window: ###, ### (default)
; those numbers are your mouse position on your screen in pixels.
; You can hold Ctrl to freeze the numbers and paste them inside the Click(###, ###) command to make 
; the script send a click at those coordinates.

;You can look up the list of AHK keybinds to assign a hotkey to this click command: https://www.autohotkey.com/docs/v1/KeyList.htm
; and here is the documentation about hotkeys themselves: https://www.autohotkey.com/docs/v1/Hotkeys.htm

F8:: 
	Reload ; F8 reloads the script to apply any newly saved changes
return

#ifWinActive, ahk_exe Pantheon.exe ; The keybinds below are only actives when Pantheon is the foreground window in focus

;Exemple:
; 4:: 	 			;this hotkey activates when you press 4.
; 	click(500, 250)		;it sends a left click on the screen position X 500 (horizontal), Y 250 (vertical)
; return

Esc:: ; spam escape to close inventory windows
	Send {Escape}
	Sleep, 50
	Send {Escape}
	Sleep, 50
	Send {Escape}
	Sleep, 50
	Send {Escape}
	Sleep, 50
	Send {Escape}
	Sleep, 50
	Send {Escape}
return


^!v:: ;Ctrl+Alt+V - Open chat and sends the message in clipboard
	while GetKeyState("Ctrl","p"){	 
		Sleep, 100 ;Wait for the Ctrl key to be released before acting
	}
	Send, {Enter}
	Sleep, 50
	Send ^v ;Ctrl+V
	Sleep, 50
	Send, {Enter}
return


click(x, y){ ; the click function
	if GetKeyState("RButton","p"){	
		RButton := 1
		Click, Up Right ; releases right click if it's being help down to avoid moving the camera while clicking
	}
	if GetKeyState("LButton","p"){
		LButton := 1
		Click, Up ; releases left click if it's being help down to allow the macro click to happen
	}
	
	MouseGetPos, mX, mY ;save the current mouse position to restore it after clicking
	Click, %x% %y%
	MouseMove, %mX%, %mY%, 0
	
	if (RButton){
		Click, Down Right ; press back down on right click if it was held down
	}
	if (LButton){
		Click, Down ; press back down on left click if it was held down
	}
	Sleep, 100
}

; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

; Movements
; A Move quarter 1
; B Move quarter 2
; C Move quarter 3
; D Move quarter 4
; E Move left
; F Move right
; G Maximize
; H Minimize
; I Half top
; J Half bot
; H Rearrange windows to make them aligned in their quarters
; K

; Windows Application
; A New instance of active application
; B Activate most recent instance
; C Maximize first screen chrome use existing instance if any

i = 0
SetTitleMatchMode, 2

; Win+<char> quick mapping
#v::Run gvim
#c::Run chrome

#w::
    Input, c, B L1 T1,,h,v,s
    if ErrorLevel = Max
    {
        return
    }
    MsgBox, %c%
Return

^!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run Notepad
return


; WINDOWS KEY + H TOGGLES HIDDEN FILES
#h::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
If HiddenFiles_Status = 2
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
Else
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
WinGetClass, eh_Class,A
If (eh_Class = "#32770" OR A_OSVersion = "WIN_VISTA")
send, {F5}
Else PostMessage, 0x111, 28931,,, A
Return

; Launch CMD from current
#IfWinActive ahk_class CabinetWClass ; for use in explorer.
^!h::
ClipSaved := ClipboardAll
Send !d
Sleep 10
Send ^c
Run, cmd /K "cd `"%clipboard%`""
Clipboard := ClipSaved
ClipSaved =
return
#IfWinActive

;Windows Key + Right Arrow

;Windows +  Left Arrow
#Left::
Move("Left")
Return

;Windows +  Up Arrow
#Up::
Move("Up")
Return

;Windows +  Down Arrow
#Down::
Move("Down")
Return


;Ctrl-Alt-S
^!s::

WinGetTitle, Title, A
MsgBox, The active window is "%Title%".
Return

Move(direction)
{
	SysGet, monCount, MonitorCount
	WinGetPos, winX, winY, winW, winH, A
	WinGet, mm, MinMax, A

	;Use center of window as base for comparison.
	baseX := winx + winw / 2
	baseY := winy + winh / 2

	curMonNum := GetMonitorNumber(baseX, baseY, winX, winY, monCount)
	curMonWidth := GetMonitorWorkArea("width", curMonNum)
	curMonHeight := GetMonitorWorkArea("height", curMonNum)
	SysGet, curMon, Monitor, %curMonNum%

	;Check for monitor in corresponding direction.
	gosub GetXYForExists
	monitorExists := DoesMonitorExist(tmpWinX, tmpWinY, monCount)

	;Move to new monitor.
	If (monitorExists = "true")
	{
		goSub GetXYForMove

		If (mm = 1)
		{
			WinRestore, A
			WinMove, A,, newWinX, newWinY
			WinMaximize, A
		}
		Else
		{
			WinMove, A,, newWinX, newWinY
		}
	}
	;New monitor not found, let's re-align in current monitor.
	Else If (monitorExists = "false")
	{
		monForReAlign := curMonNum

		gosub ReAlignX
		gosub ReAlignY

		WinMove, A,, newWinX, newWinY
	}

	Return

GetXYForExists:
	If (direction = "Right")
	{
		tmpWinX := baseX + curMonWidth
		tmpWinY := baseY
	}
	Else If (direction = "Left")
	{
		tmpWinX := baseX - curMonWidth
		tmpWinY := baseY
	}
	Else If (direction = "Up")
	{
		tmpWinX := baseX
		tmpWinY := baseY - curMonHeight
	}
	Else If (direction = "Down")
	{
		tmpWinX := baseX
		tmpWinY := baseY + curMonHeight
	}
	Return

GetXYForMove:
	/*
	Maximized winows are -4 x + -4 y of their current monitor.
	Acount for this here.
	*/
	If (mm = 1)
	{
		winX := winX + 4
		winY := winY + 4
	}
	gosub SetReAlignMon
	gosub ReAlignX
	gosub ReAlignY

	Return

SetReAlignMon:
	If (direction = "Right")
	{
		newBaseX := baseX + curMonWidth
		newBaseY := baseY
		monForReAlign := GetMonitorNumber(newBaseX, newBaseY, null, null, monCount)
	}
	Else If (direction = "Left")
	{
		newBaseX := baseX - curMonWidth
		newBaseY := baseY
		monForReAlign := GetMonitorNumber(newBaseX, newBaseY, null, null, monCount)
	}
	Else If (direction = "Up")
	{
		newBaseX := baseX
		newBaseY := baseY - curMonHeight
		monForReAlign := GetMonitorNumber(newBaseX, newBaseY, null, null, monCount)
	}
	Else If (direction = "Down")
	{
		newBaseX := baseX
		newBaseY := baseY + curMonHeight
		monForReAlign := GetMonitorNumber(newBaseX, newBaseY, null, null, monCount)
	}
	Return

;ReAlignX and ReAlignY work to keep the window in a monitor.
ReAlignX:
	{
		If (direction = "Right")
		{
			SysGet, newMon, Monitor, %monForReAlign%
			newMonWidth := GetMonitorWorkArea("width", monForReAlign)
			;adjust by setup, not fully tested.
			padding := 0 ;curMonRight - curMonLeft - newMonWidth

			If ((winX + winW + curMonWidth) > newMonRight)
			{
				newWinX := (newMonRight - winW) + padding
			}
			Else If ((winX + curMonWidth) < newMonLeft)
			{
				newWinX := newMonLeft + padding
			}
			Else
			{
				newWinX := (winX + newMonWidth) + padding
			}
		}
		Else If (direction = "Left")
		{
			SysGet, newMon, Monitor, %monForReAlign%
			newMonWidth := GetMonitorWorkArea("width", monForReAlign)
			;adjust by setup, not fully tested.
			padding := 0 ;curMonRight - curMonLeft - newMonWidth

			If ((winX - curMonWidth) < newMonLeft)
			{
				newWinX := newMonLeft - padding
			}
			Else If ((winX + winW - curMonWidth) > newMonRight)
			{
				newWinX := (newMonRight - winW) - padding
			}
			Else
			{
				newWinX := (winX - newMonWidth) - padding
			}
		}
		Else If (direction = "Up" or direction = "Down")
		{
			SysGet, newMon, Monitor, %monForReAlign%
			newMonWidth := GetMonitorWorkArea("width", monForReAlign)

			If (winX < newMonLeft)
			{
				newWinX := newMonLeft
			}
			Else If ((winX + winW) > (newMonWidth + newMonLeft))
			{
				newWinX := (newMonWidth + newMonLeft) - winW
			}
			Else
			{
				newWinX := winX
			}
		}
		Return
	}

ReAlignY:
	{
		If(direction = "Right" or direction = "Left")
		{
			SysGet, newMon, Monitor, %monForReAlign%
			newMonHeight := GetMonitorWorkArea("height", monForReAlign)

			If (winY < newMonTop)
			{
				newWinY := newMonTop
			}
			Else If ((winY + winH) > (newMonHeight + newMonTop))
			{
				newWinY := (newMonHeight + newMonTop) - winH
			}
			Else
			{
				newWinY := winY
			}
		}
		Else If (Direction = "Up")
		{
			SysGet, newMon, Monitor, %monForReAlign%
			newMonHeight := GetMonitorWorkArea("height", monForReAlign)
			;adjust by setup, not fully tested.
			padding := 0 ;curMonBottom - curMonTop - newMonHeight

			If ((winY - curMonHeight) < newMonTop)
			{
				newWinY := newMonTop + padding
			}
			Else If ((winY + winH - curMonHeight) > (newMonTop + newMonHeight))
			{
				newWinY := ((newMonTop + newMonHeight) - winH) - padding
			}
			Else
			{
				newWinY := (winY - newMonHeight) - padding
			}
		}
		Else If (Direction = "Down")
		{
			SysGet, newMon, Monitor, %monForReAlign%
			newMonHeight := GetMonitorWorkArea("height", monForReAlign)
			padding := curMonBottom - curMonTop - newMonHeight

			If ((winY + winH + curMonHeight) > newMonBottom)
			{
				newWinY := (newMonBottom - winH) - padding
			}
			Else If ((winY + curMonHeight) < newMonTop)
			{
				newWinY := newMonTop + padding
			}
			Else
			{
				newWinY := (winY + newMonHeight)  + padding
			}
		}
		Return
	}
}

Center()
{
	WinGet, mm, MinMax, A
	If (mm <> 1)
	{
		SysGet, monCount, MonitorCount
		WinGetPos, winX, winY, winW, winH, A

		;Use center of window as base for comparison.
		baseX := winx + winw / 2
		baseY := winy + winh / 2

		curMonNum := GetMonitorNumber(baseX, baseY, winX, winY, monCount)
		curMonWidth := GetMonitorWorkArea("width", curMonNum)
		curMonHeight := GetMonitorWorkArea("height", curMonNum)

		SysGet, curMon, Monitor, %curMonNum%

		newWinX := (curMonWidth - winW)/2 + curMonLeft
		newWinY := (curMonHeight - winH)/2 + curMonTop

		WinMove, A,, newWinX, newWinY
	}
	Return
}

GetMonitorNumber(baseX, baseY, winX, winY, monCount)
{
	i := 0
	monFound := 0

	Loop %monCount%
    {
		i := i+1
		SysGet, tmpMon, Monitor, %i%
        if (baseX >= tmpMonLeft and baseX <= tmpMonRight and baseY >= tmpMonTop and baseY <= tmpMonBottom)
		{
            monFound := i
		}
    }
	;If we couldn't find a monitor through the assumed x/y, lets check by window x/y.
	If (monFound = 0)
	{
		{
			i := 0
			Loop %monCount%
			{
				i := i+1
				SysGet, tmpMon, Monitor, %i%
				if (winX >= tmpMonLeft and winX <= tmpMonRight and winY >= tmpMonTop and winY <= tmpMonBottom)
				{
					monFound := i
				}
			}
		}
	}
	Return monFound
}

GetMonitorWorkArea(measurement, monToGet)
{
    SysGet, tmpMon, MonitorWorkArea, %monToGet%
	If (measurement = "width")
	{
		tmpMonWidth  := tmpMonRight - tmpMonLeft
		Return tmpMonWidth
	}
	Else If (measurement = "height")
	{
		tmpMonHeight := tmpMonBottom - tmpMonTop
		Return tmpMonHeight
	}
}

DoesMonitorExist(newWinX, newWinY, monCount)
{
	i := 0
	monitorFound = false

	Loop %monCount%
    {
		i := i+1
		SysGet, tmpMon, Monitor, %i%
        if (newWinX >= tmpMonLeft and newWinX <= tmpMonRight and newWinY >= tmpMonTop and newWinY <= tmpMonBottom)
		{
            monitorFound = true
			break
		}
    }
	Return monitorFound
}

Return

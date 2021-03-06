;      ___  _____  ____  _  _
;   ()/ __)(  _  )(_  _)( \( )()
;    ( (__  )(_)(  _)(_  )  (
; ()()\___)(_____)(____)(_)\_)()()
; My Own Autohotkeys script

LShift & RShift::
    Send #{Space}
    Return

; Win+<char> quick mappings
; -------------------------
#v::
    Run gvim
    WinWaitActive
Return

#t::
    Run mintty -
    WinWaitActive
Return

#d:: winshell_swapScreen("A")

; Reload AHK Script
; -----------------
#a::
    Reload
    Return

; Google Chrome
; -------------
; <WIN><Leader>c  Run Chrome
;       * Create a new instance if no one not exists
;       * Create a new tab to an existing instance
; <WIN><Leader>cn Run a new instance
;       * Create a new chrome instance
#c::
Input, leader, T0.5 L1 B
If ErrorLevel = Timeout
{
    If !WinExist("ahk_class Chrome_WidgetWin_1")
    {
        Run, chrome
            WinWaitActive
    }
    IfWinNotActive, ahk_class Chrome_WidgetWin_1
    {
        WinActivate
            WinWaitActive
    }
    Send ^T!d{Del}
    Return
}
If leader = n
    Run, chrome
Return

; Move windows to next monitor
; ----------------------------
#s::
    WinGet, mm, MinMax, A
    WinRestore, A
    WinGetPos, X, Y,,,A
    WinMove, A,, Mod(X+A_ScreenWidth, 2*A_ScreenWidth) , Y
    if(mm = 1) {
        WinMaximize, A
    }
return

; Move window to the quadrant #
#q::
    Input, leader, T1 L1 B
    If ErrorLevel = Timeout
    {
        Return
    }
    MoveToQuadrant(leader)
;       WinMove, A,, 0*(A_ScreenWidth/2), 0, A_ScreenWidth/2, A_ScreenHeight - taskbar

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
return

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

MoveToQuadrant(number)
{
    number := number - 1

    horizontalQuadrantsPerMonitor := 2
    verticalQuadrantsPerMonitor := 1

	SysGet, monCount, MonitorCount
	WinGetPos, winX, winY, winW, winH, A
	WinGet, mm, MinMax, A

	curMonNum := GetMonitorNumber(baseX, baseY, winX, winY, monCount)
    quadrants := horizontalQuadrantsPerMonitor * verticalQuadrantsPerMonitor * curMonNum

    If (number > quadrants)
        Return

	monWidth := GetMonitorWorkArea("width", curMonNum)
	monHeight := GetMonitorWorkArea("height", curMonNum)

    winH := monHeight
    winW := monWidth/horizontalQuadrantsPerMonitor
    tX := number*(winW)
    tY := 0

    WinMove, A,, tX, tY, winW, winH
}

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

winshell_swapScreen(windowTitle := "A") {
    global screenLeftMonitorWidth
    global screenLeftMonitorHeight
    global screenRightMonitorWidth
    global screenRightMonitorHeight

    activeWindow := WinActive(windowTitle)
    borderThreshold := -10
    if activeWindow = 0
    {
        return
    }
    WinGet, minMax, MinMax, ahk_id %activeWindow%
    WinGetPos, x, y, width, height, ahk_id %activeWindow%
    
    if (minMax = 1) {
        ; WinRestore, ahk_id %activeWindow%
        ; a maximized window has x,y = -8,-8 on Windows 8
        newY := y
        if (x > borderThreshold) {
            newX := x - screenLeftMonitorWidth
            newWidth := screenLeftMonitorWidth   - screenRightMonitorWidth  + width
            newHeight := screenLeftMonitorHeight - screenRightMonitorHeight + height
        } else {
            newX := x + screenLeftMonitorWidth
            newWidth := screenRightMonitorWidth   - screenLeftMonitorWidth  + width
            newHeight := screenRightMonitorHeight - screenLeftMonitorHeight + height
        }
    } else {
        WinGetPos, x, y, width, height, ahk_id %activeWindow%
        if (x > borderThreshold) {
            xScale := screenLeftMonitorWidth / screenRightMonitorWidth
            yScale := screenLeftMonitorHeight / screenRightMonitorHeight
            newX := x * xScale
            newY := y * yScale
            newWidth := width * xScale
            newHeight := height * yScale
            newX := newX - screenLeftMonitorWidth
        } else {
            xScale := screenRightMonitorWidth / screenLeftMonitorWidth
            yScale := screenRightMonitorHeight / screenLeftMonitorHeight
            x := screenLeftMonitorWidth + x
            newX := x * xScale
            newY := y * yScale
            newWidth := width * xScale
            newHeight := height * yScale
        }
    }
    WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
    /*
    if (minMax = 1) {
        WinMaximize, ahk_id %activeWindow%
    }
    */
    WinActivate ahk_id %activeWindow%  ;Needed - otherwise another window may overlap it
    return
}

#NoEnv
SetBatchLines -1
ListLines Off
SetWinDelay 0
CoordMode Mouse

LWin & RButton::
	MouseGetPos, , , windowUnderCursor

	WinSet Top, , ahk_id %windowUnderCursor%
	WinGet isMaximised, MinMax, ahk_id %windowUnderCursor%
	if isMaximised
		WinRestore ahk_id %windowUnderCursor%

	MouseGetPos mouseX, mouseY
	WinGetPos windowX, windowY, windowWidth, windowHeight, ahk_id %windowUnderCursor%

	isRightHalf  := mouseX > windowX + windowWidth / 2
	isBottomHalf := mouseY > windowY + windowHeight / 2

	changeX      := isRightHalf  ? 0 : 1
	changeWidth  := isRightHalf  ? 1 : -1
	changeY      := isBottomHalf ? 0 : 1
	changeHeight := isBottomHalf ? 1 : -1

	loop {
		GetKeyState buttonState, RButton, P
		if buttonState = U
			break

		MouseGetPos newMouseX, newMouseY
		WinGetPos windowX, windowY, windowWidth, windowHeight, ahk_id %windowUnderCursor%

		WinMove ahk_id %windowUnderCursor%,
			, windowX      + changeX      * (newMouseX - mouseX)
			, windowY      + changeY      * (newMouseY - mouseY)
			, windowWidth  + changeWidth  * (newMouseX - mouseX)
			, windowHeight + changeHeight * (newMouseY - mouseY)

		mouseX := newMouseX
		mouseY := newMouseY
	}

LWin & LButton::
	MouseGetPos, , , windowUnderCursor

	WinSet Top, , ahk_id %windowUnderCursor%
	WinGet isMaximised, MinMax, ahk_id %windowUnderCursor%
	if isMaximised
		WinRestore ahk_id %windowUnderCursor%

	MouseGetPos mouseX, mouseY

	loop {
		GetKeyState buttonstate, LButton, P
		if buttonstate = U
			break

		MouseGetPos newMouseX, newMouseY
		WinGetPos windowX, windowY, , , ahk_id %windowUnderCursor%
		WinMove ahk_id %windowUnderCursor%,
			, windowX + (newMouseX - mouseX)
			, windowY + (newMouseY - mouseY)

		mouseX := newMouseX
		mouseY := newMouseY
	}


	push -11
	call GetStdHandle@4
	mov hOutputHandle, eax
	
	push 0
	push 0
	push 30
	push offset message
	push hOutputHandle
	call WriteConsoleA@20
	
	push 0
	call ExitProcess@4

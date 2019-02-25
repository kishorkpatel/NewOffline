Option Explicit

Dim strSendKeys

strSendKeys = WScript.Arguments(0) 'Framework Path

Call FunSendKey (strSendKeys)

Function FunSendKey (byval strKey)

	On error resume next
	'Variable Section Begin
	Dim WshShell
	'Variable Section End

	If Isnull(strKey) or Isempty(strKey) or strKey="" Then
		FunSendKey = 1
	Else
		Set WshShell = CreateObject("WScript.Shell")
		WshShell.SendKeys lcase(strKey)
		If err.number = 0 Then
			FunSendKey = 0
		Else
			FunSendKey = 1
		End If
	End if
	On error goto 0
End Function


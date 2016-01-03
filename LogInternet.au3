#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <File.au3>

If FileExists("C:\FTPP\LogInternet.txt") = 0 Then
   _FileCreate("C:\FTPP\LogInternet.txt")
EndIf

While 1
   $ms=""
   if Ping("ya.ru") Then
   ElseIf Ping ("google.com") Then
   ElseIf Ping ("mail.ru") Then
   else
	  $LogFile = FileOpen ( "C:\FTPP\LogInternet.txt", 1 )
	  if $LogFile = -1 Then
		 Exit
	  EndIf
	  FileWrite($LogFile, "> " & @MDAY & '.' & @MON & '.' & @YEAR & "__" & @HOUR & ':' & @MIN & ':' & @SEC & @TAB & "Нет интернета!" & @CRLF )
	  FileClose($LogFile)
	  $ms=">>> Интернета нет с " & @HOUR & ':' & @MIN & ':' & @SEC & " По "
	  $Flag = 1
	  While $Flag
		 if Ping("ya.ru") = 0 Then
		 ElseIf Ping ("google.com") = 0 Then
		 ElseIf Ping ("mail.ru") = 0 Then
		 Else
			$Flag = 0
			$LogFile = FileOpen ( "C:\FTPP\LogInternet.txt", 1 )
			if $LogFile = -1 Then
			   Exit
			EndIf
			FileWrite($LogFile, $ms & @HOUR & ':' & @MIN & ':' & @SEC & @CRLF)
			FileClose($LogFile)
		 EndIf
		 Sleep(5000)
	  WEnd
   EndIf
   Sleep(10000)
WEnd


;===>>> Добавить цикл


;===>>> Добавить цикл
#cs



#ce
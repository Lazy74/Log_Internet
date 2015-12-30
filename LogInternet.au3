#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <File.au3>


If FileExists("Сам файл.") Then
   _FileCreate("C:\FTPP\LogInternet.txt")
EndIf
;===>>> Добавить цикл
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
EndIf

;===>>> Добавить цикл

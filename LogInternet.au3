#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
; Запуск скрипта только с параметром. Один входной параметр, в котором указывается номер торговой точки в Яндекс диске

#include <File.au3>

$numberTT = $CmdLine[1]		; Номер торговой точки
$PathToFile = "C:\YandexDisk\TT_" & $CmdLine[1] & "\LogInternet.txt"		; Путь к лог файлу

If FileExists($PathToFile) = 0 Then		; Проверка существует ли файл, Соднание файла, открытие и запись
   _FileCreate($PathToFile)
   $LogFile = FileOpen ($PathToFile, 1 )
   FileWrite($LogFile, TimeMs() & "Старт программы" & @CRLF)
   FileClose($LogFile)
Else
   $LogFile = FileOpen ($PathToFile)
   $len = StringLen (FileReadLine ($LogFile,-1))
   FileClose($LogFile)

   $LogFile = FileOpen ($PathToFile,1)
   if ($len <> 52) Then
	  FileWrite($LogFile, @CRLF & TimeMs() & "Старт программы" & @CRLF)
   Else
	  FileWrite($LogFile, @CRLF & @CRLF & TimeMs() & "Старт программы" & @CRLF)
   EndIf
   FileClose($LogFile)
EndIf

While 1		; Основной цикл
   if Ping("ya.ru") Then		; Пинг серверов
   ElseIf Ping ("google.com") Then
   ElseIf Ping ("mail.ru") Then
   else		; Действия, если пинг не прошел
	  $LogFile = FileOpen ($PathToFile, 1 )
	  if $LogFile = -1 Then		; если не получилось получить доступк к файлу
		 ContinueLoop		;  Переход к следующей итерации
	  EndIf
	  FileWrite($LogFile, TimeMs() & "Интернета нет с " & @HOUR & ':' & @MIN & ':' & @SEC & " По ")
	  FileClose($LogFile)
	  $Flag = 1
	  While $Flag		; цикл отслеживающий как долго не было интернета и формирование информационного сообщения
		 if Ping("ya.ru") = 0 Then
		 ElseIf Ping ("google.com") = 0 Then
		 ElseIf Ping ("mail.ru") = 0 Then
		 Else
			$Flag = 0
			$LogFile = FileOpen ($PathToFile, 1 )
			if $LogFile = -1 Then
			   ContinueLoop
			EndIf
			FileWrite($LogFile, @HOUR & ':' & @MIN & ':' & @SEC & @CRLF)
			FileClose($LogFile)
		 EndIf
		 Sleep(2000)
	  WEnd
   EndIf
   Sleep(10000)
WEnd

Func TimeMs()
   Return ">  " & @MDAY & '.' & @MON & '.' & @YEAR & "  " & @HOUR & ':' & @MIN & ':' & @SEC & @TAB
EndFunc

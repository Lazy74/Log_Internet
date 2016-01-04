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
   FileWrite($LogFile,"> " & @MDAY & '.' & @MON & '.' & @YEAR & "__" & @HOUR & ':' & @MIN & ':' & @SEC & @TAB & "Старт программы" & @CRLF )
   FileClose($LogFile)
Else
   $LogFile = FileOpen ($PathToFile, 1 )
   FileWrite($LogFile,@CRLF & "> " & @MDAY & '.' & @MON & '.' & @YEAR & "__" & @HOUR & ':' & @MIN & ':' & @SEC & @TAB & "Старт программы" & @CRLF )
   FileClose($LogFile)
   EndIf

While 1		; Основной цикл
   $ms=""		; Переменная для формирования сообщения о периоде отсутствия интернета
   if Ping("ya.ru") Then		; Пинг серверов
   ElseIf Ping ("google.com") Then
   ElseIf Ping ("mail.ru") Then
   else		; Действия, если пинг не прошел
	  if $LogFile = -1 Then		; если не получилось получить доступк к файлу
		 Exit		;  выход
	  EndIf
	  FileWrite($LogFile, "> " & @MDAY & '.' & @MON & '.' & @YEAR & "__" & @HOUR & ':' & @MIN & ':' & @SEC & @TAB & "Нет интернета!" & @CRLF )
	  FileClose($LogFile)
	  $ms=">>> Интернета нет с " & @HOUR & ':' & @MIN & ':' & @SEC & " По "
	  $Flag = 1
	  While $Flag		; цикл отслеживающий как долго не было интернета и формирование информационного сообщения
		 if Ping("ya.ru") = 0 Then
		 ElseIf Ping ("google.com") = 0 Then
		 ElseIf Ping ("mail.ru") = 0 Then
		 Else
			$Flag = 0
			if $LogFile = -1 Then
			   Exit
			EndIf
			FileWrite($LogFile, $ms & @HOUR & ':' & @MIN & ':' & @SEC & @CRLF)
			FileClose($LogFile)
		 EndIf
		 Sleep(2000)
	  WEnd
   EndIf
   Sleep(10000)
WEnd
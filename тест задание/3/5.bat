
@Echo Off
 cls
For /F "Skip=1" %%i In ('WMIC Path Win32_LocalTime Get DayOfWeek') Do Set /A $DayOfWeek=%%i&GoTo DayOfWeek
:DayOfWeek


If "%$DayOfWeek%" EQU "4" goto akcept
If "%$DayOfWeek%" NEQ "4" goto exit

:akcept
ECHO Нужен дополнительный акцепт, продолжить установку? 


:exit
Pause>nul
Exit
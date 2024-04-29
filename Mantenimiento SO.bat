@echo off
color 2

REM Mantenimiento al sistema operativo
echo Realizando mantenimiento al sistema operativo...
sfc /scannow
dism /online /cleanup-image /restorehealth
chkdsk c: /f /r /x

REM Eliminar archivos temporales
echo Eliminando archivos temporales...
del /s /q %temp%\*.*
del /s /q %systemroot%\Temp\*.*

REM Eliminar registros basura
echo Eliminando registros basura...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f

REM Eliminar archivos volcados de memoria
echo Eliminando archivos volcados de memoria...
del /s /q %systemroot%\Memory.dmp

REM Deshabilitar procesos innecesarios
echo Deshabilitando procesos innecesarios...

net stop "GameInputSvc"
net stop "dmwappushservice"
net stop "WerSvc"
net stop "XblAuthManager"
net stop "XblAuthManager"


echo Proceso de mantenimiento completo.
pause

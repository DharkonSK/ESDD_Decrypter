@echo off
title System File Fixer
color a
if /i %cd% == C:\Windows\System32 (goto Msg)
cls
echo.
echo.  Si el Componente ADZP 20 Complex Falta o esta Corrupto, Puede Usar este programa para Restaurarlo
echo.
echo.
if exist "ADZP 20 Complex.sys" (echo.  No se han Detectado Problemas) else (echo.  El Componente Necesario para el Funcionamiento de la Aplicacion Falta)
echo.
echo.
set /p option=". Desea Reinstalar el Archivo de Sistema? (S - N): "
if %option% == S (goto Restore)
if %option% == N (exit)

:Restore
if exist DATA.SK (
certutil -decode "DATA.SK" "1.tmp" >nul
certutil -decode "1.tmp" "ADZP 20 Complex.sys" >nul
del /f /q /s 1.tmp >nul
) else (goto Error) >nul
cls
echo.
echo.
echo  El Componente del Sistema se ha Instalado Correctamente.
echo.
echo.
echo  Presione una Tecla para Continuar . . .
pause >nul
exit

:Msg
color f
echo.
echo.
echo.
echo. [Este Script no Necesita Privilegios de Administrador]
echo.
echo.
echo. Presione una Tecla para Continuar...
pause >nul
exit

:Error
echo.
echo.
echo. Error, Falta el Archivo DATA.SK
pause >nul
exit
@echo off
title ESDD Decryptor
cd DecryptorESDD >nul
cls
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico)
set wimlibbootfunction=Create_Boot_File_For_ESDD_Decryptor
:Verificaciones
cls
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
if exist "Yshell.dll" (RunDll32 "YShell.dll") else (goto ErrorCritico6)
if exist "Libcrypto-1_1 Simplex.dll" (RunDll32 "Libcrypto-1_1 Simplex.dll") else (goto ErrorCritico4)
if exist "ZLibRunner.dll" (RunDll32 "ZLibRunner.dll") else (goto ErrorCritico5)
if exist "Control Panel.dll" (RunDll32 "Control Panel.dll" & goto Menu) else (goto ErrorCritico3)

:ErrorCritico
color c
cls
echo.
echo La Herramienta no a Arrancado porque el Siguiente Archivo Falta o
echo esta Corrupto: [-Ubicacion-]\DecryptorESDD\ADZP 20 Complex.sys
pause >nul
exit

:ErrorCritico2
cls
timeout /t 2 >nul
color f
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                           !
echo.
echo                                      El Programa se ha Cerrado Debido a un Error
echo.
pause >nul
exit

:ErrorCritico3
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
color 1a
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
goto ErrorCritico3

:ErrorCritico5
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
color 70
echo.
echo.
echo. El Sistema no se ha Podido Iniciar Debido a un Error Grave
echo.
echo. Problema: Falta el Archivo ZLibRunner.dll
echo.
echo. Este Archivo DLL se Encarga de Arrancar Parte del Sistema, Al no Ser Encontrado El Sistema no puede Arrancar
echo.
echo. Solucion: Reinstalar el Archivo
pause >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
exit

:ErrorCritico6
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
color 70
echo.
echo.
echo. El Sistema no ha Iniciado Debido a Que No se encuentra El 
echo. Archivo YShell.dll el Cual es el Archivo de la Configuacion de Arranque
echo.
echo. Para Poder Solucionar este Problema Reinstale una Copia del Archivo
pause >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
exit

:Menu
cls
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
if exist "Control Panel.dll" (RunDll32 "Control Panel.dll") else (goto ErrorCritico3)
color 1f
echo ===============================================================
echo.                 DECRIPTADOR DE ARCHIVOS ESDD
echo ===============================================================
echo.            1 - Crear ISO Completa de Archivo ESDD
echo.            2 - Crear ISO Comprimida de Archivo ESDD
echo.            3 - Crear Archivo ESDD Comprimido
echo.            4 - Cifrar Archivo ISO
echo.            5 - Copiar la Carpeta System32
echo ===============================================================
echo.            Presione "0" para Cerrar la Herramienta
echo ===============================================================
set /p opcion= ^> Ingrese el Numero de Opcion: 
if %opcion% == 1 (goto Convert)
if %opcion% == 2 (goto ConvertZip)
if %opcion% == 3 (goto Zip)
if %opcion% == 4 (goto Encrypt)
if %opcion% == 5 (goto System32copy)
if %opcion% == 0 (exit)
goto Menu

:Convert
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
echo =========================================================
echo. Crear ISO de Archivo ESDD
echo =========================================================
echo. La Desencriptacion del Archivo puede tardar mas tiempo
echo. Dependiendo del Peso del Archivo ESDD
echo =========================================================
set /p name="> Ingrese el Nombre del Archivo ESDD: "
if exist "%name%.esdd" (goto CheckESDDFile) else (goto Error)

:Error
msg * El Archivo Mencionado no Existe
goto Convert

:CheckESDDFile
set TAG=DecryptionPhase1
cls
goto VerifyFile

:DecryptionPhase1
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo.
echo ============================================================
echo. Creando Copia del Archivo
echo ============================================================
echo.
echo. Copiando el Archivo %name%.esdd...
echo.
timeout /t 3 >nul
if not exist ISO_FOLDER (md ISO_FOLDER) >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
copy "%name%.esdd" ISO_FOLDER >nul
goto DecryptionPhase2

:DecryptionPhase2
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo ============================================================
echo. Desencriptando el Archivo
echo ============================================================
echo.  
echo. Desencriptando el Archivo %name%.esdd
echo. Creando Archivo ISO...
echo.
certutil -decodehex "ISO_FOLDER\%name%.esdd" "ISO_FOLDER\1.tmp" >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -decode "ISO_FOLDER\1.tmp" "ISO_FOLDER\2.tmp" >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -decodehex "ISO_FOLDER\2.tmp" "ISO_FOLDER\3.tmp" >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -decode "ISO_FOLDER\3.tmp" "ISO_FOLDER\%name%.iso" >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
del /f /q /s ISO_FOLDER\1.tmp >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
del /f /q /s ISO_FOLDER\2.tmp >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
del /f /q /s ISO_FOLDER\3.tmp >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
del /f /q /s "ISO_FOLDER\%name%.esdd" >nul
goto Finish

:Finish
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo ============================================================
echo. Desencripcion Finalizada
echo ============================================================
echo.
echo. Presione una Tecla para Volver al Menu de Inicio
pause >nul
goto Menu

:ConvertZip
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
echo =========================================================
echo. Crear ISO Comprimida de Archivo ESDD
echo =========================================================
echo. La Compresion de los Archivos ISO facilitan sus Usos
echo. y Ademas Minimiza el Tiempo de Descarga de una ISO
echo =========================================================
set /p name="> Ingrese el Nombre del Archivo ESDD: "
if exist "%name%.esdd" (goto CheckESDDFile2) else (goto Error2)

:Error2
msg * El Archivo Mencionado no Existe
goto ConvertZip

:CheckESDDFile2
set TAG=WZip1
cls
goto VerifyFile

:WZip1
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo.
echo ============================================================
echo. Creando Copia del Archivo
echo ============================================================
echo.
echo. Copiando el Archivo %name%.esdd...
echo.
timeout /t 3 >nul
if not exist COMPRESED_ISO (md COMPRESED_ISO) >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
copy "%name%.esdd" COMPRESED_ISO >nul
goto WZip2

:WZip2
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo ============================================================
echo. Desencriptando el Archivo
echo ============================================================
echo.
echo. Desencriptando el Archivo %name%.esdd
echo. Creando Archivo ISO...
echo.
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -decodehex "COMPRESED_ISO\%name%.esdd" "COMPRESED_ISO\1.tmp" >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -decode "COMPRESED_ISO\1.tmp" "COMPRESED_ISO\2.tmp" >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -decodehex "COMPRESED_ISO\2.tmp" "COMPRESED_ISO\3.tmp" >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -decode "COMPRESED_ISO\3.tmp" "COMPRESED_ISO\%name%.iso" >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
del /f /q /s COMPRESED_ISO\1.tmp >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
del /f /q /s COMPRESED_ISO\2.tmp >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
del /f /q /s COMPRESED_ISO\3.tmp >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
del /f /q /s "COMPRESED_ISO\%name%.esdd" >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
goto WZip3

:WZip3
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo ============================================================
echo. Comprimiendo Archivo
echo ============================================================
echo.
echo. Comprimiendo el Archivo %name%.iso...
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
compact /c /s:COMPRESED_ISO >nul
goto Finish1

:Finish1
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo.
echo ============================================================
echo. Compresion Finalizada
echo ============================================================
echo.
echo. Presione una Tecla para Volver al Menu de Inicio
pause >nul
goto Menu

:Zip
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
echo =========================================================
echo. Comprimir Archivo ESDD
echo =========================================================
echo. La Compresion de Archivos ESDD Facilita sus Usos o
echo. tambien los Procesos de esta o otras Aplicaciones
echo =========================================================
set /p name="> Ingrese el Nombre del Archivo ESDD: "
if exist "%name%.esdd" (goto Zip1) else (goto Error3)

:Error3
msg * El Archivo Mencionado no Existe
goto Zip

:Zip1
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
echo.
echo ============================================================
echo. Creando Copia del Archivo
echo ============================================================
echo.
echo. Copiando el Archivo %name%.esdd...
echo.
timeout /t 2 >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
if not exist COMPRESED_ESDD (md COMPRESED_ESDD) >nul
copy "%name%.esdd" COMPRESED_ESDD >nul
goto Zip2

:Zip2
echo ============================================================
echo. Comprimiendo el Archivo
echo ============================================================
echo.
echo. Comprimiendo el Archivo %name%.esdd...
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
compact /c /s:COMPRESED_ESDD >nul
goto Finish3

:Finish3
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo.
echo ============================================================
echo. Compresion Finalizada
echo ============================================================
echo.
echo. Presione una Tecla para Volver al Menu de Inicio
pause >nul
goto Menu

:Encrypt
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
echo =========================================================
echo. Esta Seguro que Desea Cifrar un Archivo ISO?
echo =========================================================
echo. Si Encripta el Archivo, No volvera a poder Abrirse de
echo. Ninguna Forma ¿Esta Seguro que Desea Continuar?
echo =========================================================
set /p select="> Opcion (S - N): "
if %select% == S (goto CryptingISO)
if %select% == N (goto Menu)

:CryptingISO
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
echo =========================================================
echo. Cifrar Archivo ISO a ESDD
echo =========================================================
echo. El Programa Cifrara una ISO a modo de que el Archivo
echo. No Pueda ser Abierto incluso cambiando la extencion
echo =========================================================
set /p name="> Ingrese el Nombre del Archivo ISO: "
if exist "%name%.iso" (goto CryptingIso1) else (goto Error4)
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
goto CryptingIso1

:Error4
msg * El Archivo Mencionado no Existe
goto CryptingISO

:CryptingIso1
cls
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo.
echo ============================================================
echo. Cifrando ISO
echo ============================================================
echo.
echo. Encriptando el Archivo %name%.iso...
echo.
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -encode "%name%.iso" 1.tmp >nul 2>nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -encodehex 1.tmp 2.tmp >nul 2>nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -encode 2.tmp 3.tmp >nul 2>nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
certutil -encodehex 3.tmp "%name%.esdd" >nul 2>nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
del /f /q /s "%name%.iso" >nul 2>nul
del /f /q /s 1.tmp >nul 2>nul
del /f /q /s 2.tmp >nul 2>nul
del /f /q /s 3.tmp >nul 2>nul
goto Finish4

:Finish4
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo ============================================================
echo. Encriptacion Finalizada
echo ============================================================
echo.
echo. Presione una Tecla para Volver al Menu de Inicio
pause >nul
goto Menu

:System32copy
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
echo ==========================================================
echo. Esta Seguro que desea Copiar esta Carpeta?
echo ==========================================================
echo. Si usted Posee una Computadora con un Procesador de baja
echo. Calidad, Su PC posiblemente se apague por los procesos
echo ==========================================================
set /p copyoptions="> Opcion (S - N): " 
if %copyoptions% == S (goto System32)
if %copyoptions% == N (exit)

:System32
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
cls
echo =================================================================================================
echo. Preparando procesos de Copia de System32...
echo =================================================================================================
md System32_Copy
timeout /t 3 >nul
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo  ADZP 20 Complex.sys esta Copiando la Carpeta System32 (0%% Completado)
echo =================================================================================================
timeout /t 2 >nul
copy "C:\Windows\System32" "System32_Copy"
goto Finish5

:Finish5
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
echo =================================================================================================
echo. ADZP 20 Complex.sys esta Copiando la Carpeta System32 (100%% Completado)
echo =================================================================================================
echo. Procesos de Copia Finalizados
echo =================================================================================================
echo. Presione una Tecla para Volver al Menu de Inicio
pause >nul
goto Menu

:VerifyFile
if exist "ADZP 20 Complex.sys" (RunDll32 "ADZP 20 Complex.sys") else (goto ErrorCritico2)
set RANDOM_FILE_NAME=%random%_%random%
echo.
echo ============================================================
echo. Verificando Datos
echo ============================================================
echo.
echo. Verificando los Datos del Archivo %name%.esdd...
certutil -decodehex "%name%.esdd" "%RANDOM_FILE_NAME%" >nul 2>nul
if %errorlevel% == -2147024883 (
:FileError
del /f /q /s "%RANDOM_FILE_NAME%" >nul 2>nul
echo.
echo. ERROR: El Archivo es Demasiado Grande o
echo. Tiene un Formato Desconocido
echo.
echo. Presione una Tecla para Volver al Menu
pause >nul
goto Menu
)
if %errorlevel% == -2147024362 (goto FileError)
echo. COMPLETADO: El Archivo es Valido
del /f /q /s "%RANDOM_FILE_NAME%" >nul 2>nul
goto %TAG%
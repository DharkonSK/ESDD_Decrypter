' ESDD Decryptor System File

Const TemporaryFolder = 2

Dim fso: Set fso = CreateObject("Scripting.FileSystemObject")

Dim tempFolder: tempFolder = fso.GetSpecialFolder(TemporaryFolder)

set b=createobject("wscript.shell")
Set objfso = createobject("scripting.filesystemobject")
Set ar= objfso.createtextfile(tempFolder & "Verifications.vbs.bat",true)
ar.writeline " @echo off "
ar.writeline " set systemfileerrorlevel=Indefined "
ar.writeline " color a "
ar.writeline " call Check_Modules.bat "
ar.writeline " if %systemfileerrorlevel% == Critical (goto CriticalError) "
ar.writeline " if %systemfileerrorlevel% == SevereErrorLevel3 (goto SevereErrorLevel3) "
ar.writeline " if %systemfileerrorlevel% == SevereErrorLevel4 (goto SevereErrorLevel4) "
ar.writeline " if %systemfileerrorlevel% == SevereErrorLevel5 (goto SevereErrorLevel5) "
ar.writeline " cls "
ar.writeline " echo. "
ar.writeline " echo. Verificacion de Archivos del Sistema del Decriptador de ESDD "
ar.writeline " echo. "
ar.writeline " echo. No se Ha Encontrado Ningun Problema "
ar.writeline " pause >nul "
ar.writeline " exit "
ar.writeline " :CriticalError "
ar.writeline " cls "
ar.writeline " echo. "
ar.writeline " echo. Error Critico Encontrado: "
ar.writeline " echo. "
ar.writeline " echo. El Archivo de Sistema ADZP 20 Complex.sys Falta o esta Corrrupto "
ar.writeline " echo. "
ar.writeline " echo. Nivel de Error: Critico "
ar.writeline " echo. "
ar.writeline " echo. Solucion: Reinstalar el Archivo Critico del Sistema "
ar.writeline " pause >nul "
ar.writeline " exit "
ar.writeline " :SevereErrorLevel3 "
ar.writeline " cls "
ar.writeline " echo. "
ar.writeline " echo. Error Grave Encontrado: "
ar.writeline " echo. "
ar.writeline " echo. El Archivo Control Panel.dll Falta o esta Corrupto "
ar.writeline " echo. "
ar.writeline " echo. Nivel de Error: Grave "
ar.writeline " echo. "
ar.writeline " echo. Solucion: Reinstalar el Archivo Critico del Sistema "
ar.writeline " pause >nul "
ar.writeline " exit "
ar.writeline " :SevereErrorLevel4 "
ar.writeline " cls "
ar.writeline " echo. "
ar.writeline " echo. Error Grave Encontrado: "
ar.writeline " echo. "
ar.writeline " echo. El Archivo ZLibRunner.dll Falta o esta Corrupto "
ar.writeline " echo. "
ar.writeline " echo. Nivel de Error: Grave "
ar.writeline " echo. "
ar.writeline " echo. Solucion: Reinstalar el Archivo Critico del Sistema "
ar.writeline " pause >nul "
ar.writeline " exit "
ar.writeline " :SevereErrorLevel5 "
ar.writeline " cls "
ar.writeline " echo. "
ar.writeline " echo. Error Grave Encontrado: "
ar.writeline " echo. "
ar.writeline " echo. El Archivo YShell.dll Falta o esta Corrupto "
ar.writeline " echo. "
ar.writeline " echo. Nivel de Error: Grave "
ar.writeline " echo. "
ar.writeline " echo. Solucion: Reinstalar el Archivo Critico del Sistema "
ar.writeline " pause >nul "
ar.writeline " exit "
ar.close
b.run tempFolder & "Verifications.vbs.bat", 1, true
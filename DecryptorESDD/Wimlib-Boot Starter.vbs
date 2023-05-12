' ESDD Decryptor System File

Const TemporaryFolder = 2

Dim fso: Set fso = CreateObject("Scripting.FileSystemObject")

Dim tempFolder: tempFolder = fso.GetSpecialFolder(TemporaryFolder)

set b=createobject("wscript.shell")
Set objfso = createobject("scripting.filesystemobject")
Set ar= objfso.createtextfile(tempFolder & "archivo.bat",true)
ar.writeline " @echo off "
ar.writeline " color a "
ar.writeline " if exist SystemBoot.ini (exit) else (goto CreateBootFile) "
ar.writeline " :CreateBootFile "
ar.writeline " set wimlibbootfunction=Create_Boot_File_For_ESDD_Decryptor "
ar.writeline " call Wimlib-Boot.exe "
ar.writeline " exit "

ar.close
b.run tempFolder & "archivo.bat", 1, true
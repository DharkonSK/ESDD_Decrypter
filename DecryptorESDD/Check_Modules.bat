:: ESDD Decryptor System File
@echo off
if exist "Control Panel.dll" (echo.) else (set systemfileerrorlevel=SevereErrorLevel3)
if exist "ZLibRunner.dll" (echo.) else (set systemfileerrorlevel=SevereErrorLevel4)
if exist "YShell.dll" (echo.) else (set systemfileerrorlevel=SevereErrorLevel5)
if exist "ADZP 20 Complex.sys" (echo.) else (set systemfileerrorlevel=Critical)
goto :eof
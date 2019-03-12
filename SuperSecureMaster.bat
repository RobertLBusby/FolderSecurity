@ECHO OFF
title Folder Private (c) 2019 Robert Busby
if EXIST SSS/SSSA.vbs goto READY
if EXIST SSS/SSSA1.vbs goto READY
if EXIST SSS/SSSA2.vbs goto READY
if EXIST SSS/SSSA3.bat goto READY
if NOT EXIST SSS/SSSA.vbs goto End
if NOT EXIST SSS/SSSA1.vbs goto End
if NOT EXIST SSS/SSSA2.vbs goto End
if NOT EXIST SSS/SSSA3.bat goto End

:READY
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Private goto SSScreate

:CONFIRM
echo Are you sure you want to lock the folder(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Invalid choice.
goto CONFIRM

:LOCK
ren Private "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
goto End

:UNLOCK
echo Enter password to unlock folder
set/p "pass=>"
if NOT %pass%== password goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Private
echo Folder Unlocked successfully
goto End

:FAIL
echo Invalid password
start SSS/SSSA.vbs
start SSS/SSSA1.vbs
start SSS/SSSA2.vbs
sleep 30
start SSS/SSSA3.bat
goto end

:SSScreate
md Private
echo Folder created successfully
goto End
:End
@echo off
cd /d "%~dp0"
copy /Y Ainkuraddo-cli.dat ..\Ainkuraddo-cli.exe >NUL
copy /Y ..\Ainkuraddo.pkg ..\Ainkuraddo-cli.pkg >NUL
..\Ainkuraddo-cli.exe  --open_browser False %*

rmdir /S /Q build
rmdir /S /Q dist
C:\Python27\scripts\pyinstaller.exe ainkuraddo_win.spec -y
rmdir /S /Q dist\Ainkuraddo\Include
mkdir dist\Ainkuraddo\core
mkdir dist\Ainkuraddo\lib
move dist\Ainkuraddo\*.pyd dist\Ainkuraddo\lib
move dist\Ainkuraddo\pywintypes27.dll dist\Ainkuraddo\lib
move dist\Ainkuraddo\sqlite*.dll dist\Ainkuraddo\lib
move dist\Ainkuraddo\lib\gevent.corecext.pyd dist\Ainkuraddo
move dist\Ainkuraddo\lib\gevent._semaphore.pyd dist\Ainkuraddo
git clone --depth 1 file://f:\Work\Ainkuraddo-git\ZeroBundle\PyInstall\..\..\Ainkuraddo\.git\ dist\Ainkuraddo\core
rmdir /S /Q dist\Ainkuraddo\core\.git
rmdir /S /Q dist\Ainkuraddo\core\src\Test\testdata
rem powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory('dist/Ainkuraddo', '../dist/Ainkuraddo-win.zip'); }"
echo Adding info to Ainkuraddo.exe...
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo.exe /va /s desc "Ainkuraddo"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo.exe /s name "Ainkuraddo client"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo.exe /s product "Ainkuraddo client"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo.exe /s copyright "2017 Ainkuraddo.io"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo.exe /s productver "0.5.1.0"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo.exe /s company "Open Source Developer, Tamas Kocsis"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo.exe 0.5.1.0
..\..\tools\ResourceHacker.exe -addoverwrite dist\Ainkuraddo\Ainkuraddo.exe, dist\Ainkuraddo\Ainkuraddo.exe, dist\Ainkuraddo\Ainkuraddo.exe.manifest,24,1,1033
del dist\Ainkuraddo\Ainkuraddo.exe.manifest
del Ainkuraddo.pkg
echo Adding info to Ainkuraddo-cli.exe...
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo-cli.exe /va /s desc "Ainkuraddo"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo-cli.exe /s name "Ainkuraddo client"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo-cli.exe /s product "Ainkuraddo client"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo-cli.exe /s copyright "2017 Ainkuraddo.io"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo-cli.exe /s productver "0.5.1.0"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo-cli.exe /s company "Open Source Developer, Tamas Kocsis"
..\..\tools\verpatch.exe dist\Ainkuraddo\Ainkuraddo-cli.exe 0.5.1.0
..\..\tools\ResourceHacker.exe -addoverwrite dist\Ainkuraddo\Ainkuraddo-cli.exe, dist\Ainkuraddo\Ainkuraddo-cli.exe, dist\Ainkuraddo\Ainkuraddo-cli.exe.manifest,24,1,1033
del dist\Ainkuraddo\Ainkuraddo-cli.exe.manifest
del Ainkuraddo-cli.pkg
del dist\Ainkuraddo\Ainkuraddo-cli.pkg
copy tools\Ainkuraddo.cmd dist\Ainkuraddo\lib\Ainkuraddo.cmd
move dist\Ainkuraddo\Ainkuraddo-cli.exe dist\Ainkuraddo\lib\Ainkuraddo-cli.dat
echo Signing
set INPUT=
set /P INPUT=PVK password: %=%
..\..\tools\signtool sign /f ..\..\cert.pfx /p %INPUT% /t http://timestamp.verisign.com/scripts/timstamp.dll /v dist\Ainkuraddo\Ainkuraddo.exe
..\..\tools\signtool sign /f ..\..\cert.pfx /p %INPUT% /tr http://timestamp.digicert.com /fd sha256 /as /v dist\Ainkuraddo\Ainkuraddo.exe
..\..\tools\signtool sign /f ..\..\cert.pfx /p %INPUT% /t http://timestamp.verisign.com/scripts/timstamp.dll /v dist\Ainkuraddo\lib\Ainkuraddo-cli.dat
..\..\tools\signtool sign /f ..\..\cert.pfx /p %INPUT% /tr http://timestamp.digicert.com /fd sha256 /as /v dist\Ainkuraddo\lib\Ainkuraddo-cli.dat
pause
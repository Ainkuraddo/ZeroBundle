@echo off
cd /d "%~dp0"
if not exist Ainkuraddo (
	if "%1" == "" (
		Python\python.exe -m zerobundle.run_win https://github.com/Ainkuraddo/Ainkuraddo;https://gitlab.com/Ainkuraddo/Ainkuraddo;https://try.gogs.io/Ainkuraddo/Ainkuraddo start.py
	) else (
		Python\python.exe -m zerobundle.run_win https://github.com/Ainkuraddo/Ainkuraddo;https://gitlab.com/Ainkuraddo/Ainkuraddo;https://try.gogs.io/Ainkuraddo/Ainkuraddo ainkuraddo.py %*
	)
) else (
	cd Ainkuraddo
	if "%1" == "" (
		..\Python\python.exe start.py
	) else (
		..\Python\python.exe ainkuraddo.py %*
	)
	cd ..
)

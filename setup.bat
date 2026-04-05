@echo off
setlocal

title Flux.py Setup
echo Flux.py Environment Setup

python --version >nul 2>&1
if %errorlevel%==0 (
    echo [Flux.py] Python is already installed.
) else (
    echo [Flux.py] Python is not installed.
    echo [Flux.py] Installing Python 3.10...

    set "PYTHON_INSTALLER=python-3.10.5-amd64.exe"

    if not exist "%PYTHON_INSTALLER%" (
        echo [Flux.py] Downloading Python installer...
        powershell -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.10.5/python-3.10.5-amd64.exe -OutFile %PYTHON_INSTALLER%"
    )

    echo [Flux.py] Running installer...
    "%PYTHON_INSTALLER%" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

    echo [Flux.py] Python installation complete.
)

if exist requirements.txt (
    python -m pip install -r requirements.txt
)

cls
echo [Flux.py] Setup Complete!
pause

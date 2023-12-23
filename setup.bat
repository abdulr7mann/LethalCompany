@echo off
echo Lethal Company Mod Setup
echo -------------------------

:: Step 1: Navigate to Lethal Company Directory
echo Step 1: Navigating to Lethal Company Directory...
cd "C:\Program Files (x86)\Steam\steamapps\common\Lethal Company"

:: Check if files already exist
if exist "BepInEx" (
    echo.
    set /p choice=Some files already exist. Do you want to overwrite them? (Y/N):
    if /I "%choice%" EQU "Y" (
        echo Overwriting existing files...
        call :DownloadAndExtract
    ) else (
        echo Exiting setup. No files were modified.
        goto :EOF
    )
) else (
    echo Files do not exist. Proceeding with download and extraction.
    call :DownloadAndExtract
)

:: List of Mods
echo.
echo Mods List:
echo - More Emotes
echo - More Suits
echo - LateCompany
echo - MoreCompany
echo - BepInExPack
echo - LC_API
echo - Skinwalkers
echo - Helmet Cameras
echo - Mimics
echo - HDLethalCompany
echo - PushCompany
echo - HornMoan
echo - Brutal Company Plus
echo - BetterItemScan

:: Final Step: Instructions
echo.
echo For more info on the mods, refer to the README file.
echo Once done, launch Lethal Company through Steam to enjoy your mods!
echo.
pause
goto :EOF

:DownloadAndExtract
:: Download and Extract Files
echo Step 2: Downloading and Extracting Files...
curl -o 1.zip -L https://github.com/abdulr7mann/LethalCompany/archive/refs/tags/1.zip
powershell Expand-Archive -Path "1.zip" -DestinationPath .

:: Copy required files
echo Copying required files...
copy ".\LethalCompany-1\BepInEx" ".\"
copy ".\LethalCompany-1\doorstop_config.ini" ".\"
copy ".\LethalCompany-1\winhttp.dll" "."

:: Cleanup
echo Cleaning up...
rmdir /Q /S "LethalCompany-1"
del /Q "1.zip"
goto :EOF

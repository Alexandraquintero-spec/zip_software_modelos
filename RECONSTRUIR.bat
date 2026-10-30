@echo off
setlocal
rem ==========================================================================
rem  Une las partes del .zip de Software Matematico IA, comprueba que el archivo
rem  quedo identico al original y lo descomprime en la carpeta SoftwareMatematicoIA.
rem  Uso: doble clic en este archivo (despues de descargar o clonar el repositorio).
rem ==========================================================================
cd /d "%~dp0"

set "ZIP=SoftwareMatematicoIA-v1.0-windows.zip"
set "HASH_ESPERADO=FA46352953EC9F136CCD78245D07424EF2C3B7CC79638382AECC36B359E7105F"

if not exist "partes\%ZIP%.001" (
    echo No se encontraron las partes en la carpeta "partes".
    echo Si clono el repositorio, revise que la descarga haya terminado.
    pause
    exit /b 1
)

echo [1/3] Uniendo las partes...
copy /b "partes\%ZIP%.001" + "partes\%ZIP%.002" + "partes\%ZIP%.003" + "partes\%ZIP%.004" "%ZIP%" >nul
if errorlevel 1 (
    echo Error al unir las partes.
    pause
    exit /b 1
)

echo [2/3] Comprobando que el archivo este completo...
for /f "skip=1 tokens=* delims=" %%H in ('certutil -hashfile "%ZIP%" SHA256 ^| findstr /v "CertUtil"') do (
    set "HASH=%%H"
    goto :comparar
)
:comparar
set "HASH=%HASH: =%"
if /i not "%HASH%"=="%HASH_ESPERADO%" (
    echo El archivo unido no coincide con el original. Vuelva a descargar el repositorio.
    pause
    exit /b 1
)

echo [3/3] Descomprimiendo...
tar -x -f "%ZIP%"
if errorlevel 1 (
    echo Error al descomprimir.
    pause
    exit /b 1
)
del "%ZIP%"

echo.
echo Listo. Abra la carpeta SoftwareMatematicoIA y ejecute SoftwareMatematicoIA.exe
echo (Opcional) Copie su archivo .env en esa carpeta para usar la IA.
echo.
pause

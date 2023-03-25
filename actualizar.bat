@echo off
@set scriptver=1.3
echo [-] Iniciando script v%scriptver%
echo [-] Activando extensiones de cmd...
@setlocal enableextensions
echo [-] Haciendo cd al directorio original...
@cd /d "%~dp0"
cls

title Actualizar PCs
echo.
echo SCRIPT DE ACTUALIZACION DE PCs
echo             v%scriptver%
echo     Programado por Raul M.
echo.
echo Mas te vale haber ejecutado esto como administrador...
echo Si no lo has hecho, tienes 10 segundos para cerrar esta ventana.
timeout 10
echo COMENZAMOS en 3 segundos...
timeout 3 /NOBREAK >NUL
cls
echo SCRIPT DE ACTUALIZACION DE PCs
echo [+] COMENZAMOS!
echo.

echo  [+] Comprobando si hay actualizaciones de Firefox
REM start "" "firefox.bat"
echo [i] El sistema de actualizacion automatica de Firefox esta desactivado. He abierto Firefox por ti para que lo actualices manualmente.
start "" "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"

echo [+] Instalando todos los Visual C++ Redistributable
start /wait "" "visualc\install_all.bat"

echo [+] Actualizando WinRAR
start /wait "" "winrar-x64-591es.exe" /S

echo [+] Actualizando VLC (manual)
start /wait "" "vlc.exe"

echo [+] Actualizando Audacity
start /wait "" "C:\Program Files (x86)\Audacity\unins000.exe" /SILENT
start /wait "" "audacity-win-2.3.3.exe" /SILENT /LOADINF=audacity.inf

echo [+] Desinstalando 7-Zip
start /wait "" "MsiExec.exe" /I{23170F69-40C1-2701-1604-000001000000} /QN
MsiExec.exe /I{23170F69-40C1-2702-1512-000001000000} /QN
start /wait "" "C:\Program Files (x86)\7-Zip\Uninstall.exe"
echo [!] He intentado desinstalar todas las versiones de 7-Zip que conozco. Recuerda revisar el panel de control mas tarde para comprobar que no haya ninguna mas.

echo [+] Actualizando GeoGebra 5 (manual)
start /wait "" "GeoGebra5.exe"

echo [+] Actualizando GeoGebra 6
start /wait "" "GeoGebra6.exe"

echo [+] Actualizando Java (manual)
start /wait "" "MsiExec.exe" /X{26A24AE4-039D-4CA4-87B4-2F64180151F0} /QN
start /wait "" "MsiExec.exe" /X{26A24AE4-039D-4CA4-87B4-2F64180221F0} /QN
start /wait "" "jre-8u271-windows-x64.exe"

echo [+] Actualizando Scribus (manual)
start /wait "" "C:\Program Files\Scribus 1.4.6\uninst.exe"
start /wait "" "scribus-1.4.8-windows-x64.exe"

echo [+] Actualizando LibreOffice (manual)
start /wait "" "MsiExec.exe" /I{3C4801FF-3D7B-4804-877E-3A322C00524C} /QN
echo ES PROBABLE QUE LIBREOFFICE NO SE HAYA DESINSTALADO. Si el instalador te da un error, cierralo y espera a que termine el script, y despues desinstala LibreOffice manualmente y lo vuelves a instalar usando el archivo "LibreOffice_6.4.7_Win_x64.msi".
start /wait "" "LibreOffice_6.4.7_Win_x64.msi"

echo [+] Actualizando Adobe Acrobat Reader (semimanual)
start /wait "" "MsiExec.exe" /I{AC76BA86-7AD7-1027-7B44-AC0F074E4100} /QN
start /wait "" "readerdc_es_xa_crd_install.exe"

echo [+] Actualizando mBlock
start /wait "" "C:\Program Files (x86)\mBlock\unins000.exe" /SILENT
start /wait "" "mBlock.exe" /SILENT /LOADINF=mblock.inf

echo [+] Actualizando pCon.planner (manual)
start /wait "" "pCon.planner_setup.exe"

echo [+] Actualizando Snap4Arduino
start /wait "" "Snap4Arduino-6.2-32.exe" /SILENT /LOADINF=snap4arduino.inf

echo [+] Actualizando GIMP 2
start /wait "" "gimp-2.10.22-setup.exe" /SILENT /LOADINF=gimp.inf

IF exist C:\Shotcut\ (
	echo [+] Actualizando Shotcut
	rmdir C:\shotcut\Shotcut\ /s /q >NUL
 	start /wait "" "%ProgramFiles%\WinRAR\winrar.exe" x shotcut.zip *.* C:\shotcut\
) ELSE (
	echo [i] Shotcut no esta instalado, saltando.
)
echo [-] LA EJECUCION DEL SCRIPT HA FINALIZADO. Pulsa cualquier tecla para salir.
pause >NUL
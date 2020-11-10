@echo off
@setlocal enableextensions
@cd /d "%~dp0"
title Actualizar PCs
echo.
echo SCRIPT DE ACTUALIZACIÓN DE PCs
echo Programado por Raúl M.
echo.
echo Más te vale haber ejecutado esto como administrador...
echo Si no lo has hecho, tienes 10 segundos para cerrar esta ventana.
timeout 10
echo COMENZAMOS.
timeout 3 /NOBREAK >NUL
cls

echo Comprobando si hay actualizaciones de Firefox
start /wait "" "firefox.bat"

echo Instalando todos los Visual C++ Redistributable
start /wait "" "visualc\install_all.bat"

echo Actualizando WinRAR
start /wait "" "winrar-x64-591es.exe" /S

echo Actualizando VLC
start /wait "" "vlc-3.0.11-win64.exe" /L=es /S

echo Actualizando Audacity
start /wait "" "C:\Program Files (x86)\Audacity\unins000.exe" /SILENT
start /wait "" "audacity-win-2.3.3.exe" /SILENT /LOADINF=audacity.inf

echo Desinstalando 7-Zip
start /wait "" "MsiExec.exe" /I{23170F69-40C1-2701-1604-000001000000} /QN
start /wait "" "C:\Program Files (x86)\7-Zip\Uninstall.exe"

echo Actualizando GeoGebra 5
start /wait "" "GeoGebra-Windows-Installer-5-0-609-0.exe"

echo Actualizando GeoGebra 6
start /wait "" "GeoGebra-Windows-Installer-6-0-609-0.exe"

echo Actualizando Java
start /wait "" "MsiExec.exe" /X{26A24AE4-039D-4CA4-87B4-2F64180151F0} /QN
start /wait "" "MsiExec.exe" /X{26A24AE4-039D-4CA4-87B4-2F64180221F0} /QN
start /wait "" "jre-8u271-windows-x64.exe"

echo Actualizando Scribus
start /wait "" "C:\Program Files\Scribus 1.4.6\uninst.exe"
start /wait "" "scribus-1.4.8-windows-x64.exe"

echo Actualizando LibreOffice
start /wait "" "LibreOffice_6.4.7_Win_x64.msi"

echo Actualizando Adobe Acrobat Reader
start /wait "" "MsiExec.exe" /I{AC76BA86-7AD7-1027-7B44-AC0F074E4100} /QN
start /wait "" "readerdc_es_xa_crd_install.exe"

echo Actualizando mBlock
start /wait "" "C:\Program Files (x86)\mBlock\unins000.exe" /SILENT
start /wait "" "mBlock_v5.2.0.exe" /SILENT /LOADINF=mblock.inf

echo Actualizando pCon.planner
start /wait "" "pCon.planner_setup.exe"

echo Actualizando Snap4Arduino
start /wait "" "Snap4Arduino-6.2-32.exe" /SILENT /LOADINF=snap4arduino.inf

echo Actualizando GIMP 2
start /wait "" "gimp-2.10.22-setup.exe" /SILENT /LOADINF=gimp.inf

IF exist C:\Shotcut\ (
	echo Actualizando Shotcut
	rmdir C:\Shotcut\ /s
 	start /wait "" "%ProgramFiles%\WinRAR\winrar.exe" x shotcut-win64-201031.zip *.* C:\
) ELSE (
	echo Shotcut no existe, saltando.
)
echo SCRIPT FINALIZADO.
pause
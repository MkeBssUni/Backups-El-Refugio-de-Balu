@echo off
for /f "tokens=2 delims==" %%i in ('wmic OS Get localdatetime /value') do set fecha=%%i
set fecha=%fecha:~0,4%-%fecha:~4,2%-%fecha:~6,2%_%fecha:~8,2%_%fecha:~10,2%

:: Asume que la copia completa más reciente se realizó hoy y establece el inicio para los logs incrementales
set full_backup_date=%fecha:~0,4%-%fecha:~4,2%-%fecha:~6,2%

:: La ubicación del archivo de estado para rastrear el último log binario procesado
set log_status=D:\School\BackupsBalu\backups\log_status.txt

:: Chequea si el archivo de estado existe para determinar la última copia incremental
if not exist "%log_status%" (
    echo La copia de seguridad completa más reciente fue %full_backup_date% > "%log_status%"
)

:: Leer el nombre del último archivo binario y la posición desde el archivo de estado
for /f "tokens=*" %%a in ('type "%log_status%"') do set last_binlog=%%a

:: Poner el nombre del archivo incremental
set nombreArchivoIncremental=D:\School\BackupsBalu\backups\incremental_copies\inc_backup_%fecha%.sql

:: Crear una copia de seguridad incremental
docker exec ecc3338f9726 mysqldump -u balu -ps2nd0b4lu --single-transaction --flush-logs --master-data=2 refugio_balu > "%nombreArchivoIncremental%"

:: Actualiza el archivo de estado con la nueva posición
for /f "tokens=2 delims=, " %%a in ('findstr /c:"CHANGE MASTER" "%nombreArchivoIncremental%"') do set new_binlog=%%a
echo %new_binlog% > "%log_status%"

git add backups/
git commit -m "Incremental Backup %fecha%"
git push

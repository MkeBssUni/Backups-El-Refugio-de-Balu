@echo off

:: Log file
:: set logFile=D:\School\BackupsBalu\backups\backup_log.txt
:: Ensure the Docker container is running before executing the dump
docker start ecc3338f9726

timeout /t 120 /nobreak

for /f "tokens=2 delims==" %%i in ('wmic OS Get localdatetime /value') do set fecha=%%i
set fecha=%fecha:~0,4%-%fecha:~4,2%-%fecha:~6,2%_%fecha:~8,2%_%fecha:~10,2%

set nombreArchivo=D:\School\BackupsBalu\backups\fullcopies\backup_%fecha%.sql

docker exec ecc3338f9726 mysqldump -u balu -ps2nd0b4lu refugio_balu > "%nombreArchivo%"

cd /d D:\School\BackupsBalu\backups\

git add fullcopies/
git commit -m "Backup %fecha%"
git push

:: Script to backup a MySQL database running in a Docker container
@echo off

:: Variables
set containerId=72410bca8cce
set user=balu
set password=s2nd0b4lu
set dbName=refugio_balu

:: Start Docker container
docker start %containerId%

:: Wait for the container to start
timeout /t 120 /nobreak

:: Get current datetime
for /f "tokens=2 delims==" %%i in ('wmic OS Get localdatetime /value') do set fecha=%%i
set fecha=%fecha:~0,4%-%fecha:~4,2%-%fecha:~6,2%_%fecha:~8,2%_%fecha:~10,2%

:: Set filename for the dump
set nombreArchivo=D:\School\BackupsBalu\backups\fullcopies\backup_%fecha%.sql

:: Dump the database and redirect stderr to stdout
docker exec %containerId% mysqldump -u %user% -p%password% %dbName% > "%nombreArchivo%" 2>nul


:: Git operations
cd /d D:\School\BackupsBalu\backups\
git add fullcopies/
git commit -m "Backup %fecha%"
git push

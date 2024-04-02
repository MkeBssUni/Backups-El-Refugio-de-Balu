:: Script to backup a MySQL database running in a Docker container
@echo off

:: Variables
set containerId=b1c662fccb4d2327c8fd7576ef9b357a7c60783c1c3cb28d244167b2e99177b3 
set user=balu
set password=s2nd0b4lu
set dbName=refugio_balu

set repositoryFolder=D:\School\BackupsBalu\backups

:: Get current datetime
for /f "tokens=2 delims==" %%i in ('wmic OS Get localdatetime /value') do set fecha=%%i
set fecha=%fecha:~0,4%-%fecha:~4,2%-%fecha:~6,2%_%fecha:~8,2%_%fecha:~10,2%

set rarPath=D:\Work\
set rarName=backup_%fecha%.rar
set rarDestination=%repositoryFolder%\fullcopies\
set rarPassword=s3nd0b4lu

:: Start Docker container
docker start %containerId%

:: Wait for the container to start
::timeout /t 120 /nobreak

:: Set filename for the dump
set nombreArchivo=%repositoryFolder%\fullcopies\backup_%fecha%.sql

:: Dump the database and redirect stderr to stdout
docker exec %containerId% mysqldump -u %user% -p%password% %dbName% > "%nombreArchivo%" 2>nul

%rarPath%Rar.exe a -r -ep1 -hp%rarPassword% %repositoryFolder%\fullcopies\%rarName% %nombreArchivo%

:: Delete the dump
del %nombreArchivo%

:: Git operations
cd /d %repositoryFolder%
git add fullcopies/
git commit -m "Backup %fecha%"
git push

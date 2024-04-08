:: Script for restoring the most recent full copy of a MySQL database from a .sql file
@echo off

:: Variables
set containerId=d8451c4c6497
set user=balu
set password=s2nd0b4lu

set dbName=refugio_balu
set repositoryFolder=D:\School\BackupsBalu\backups
:: donde busca
set backupFolder=%repositoryFolder%\fullcopies

set rarPath=D:\Work\
set rarPassword=s3nd0b4lu
set rarDestination=%repositoryFolder%\temp\

:: Start the MySQL container
docker start %containerId%
:: Wait for the container to start
::timeout /t 120 /nobreak

cd /d %repositoryFolder%

git pull

for /f "delims=" %%I in ('dir "%backupFolder%\*.rar" /b /a-d /o-d') do (
    set "newestBackup=%%I"
    goto :breakLoop
)
:breakLoop

:: crear un archivo .txt con el nombre del archivo más reciente
echo %newestBackup% > "%backupFolder%\latestBackup.txt"

if defined newestBackup (
    echo Encontrado el archivo de backup más reciente: %newestBackup%

    ::Extract the .sql file
    %rarPath%UnRAR.exe x -p%rarPassword% %backupFolder%\%newestBackup% %rarDestination%

    ::Create database if it doesn't exist
    docker exec -i %containerId% mysql -u %user% -p%password% -e "CREATE DATABASE IF NOT EXISTS %dbName%;"
    
    :: Restore the database, chose the .sql file with the same name as the .rar file (without extension)
    docker exec -i %containerId% mysql -u %user% -p%password% %dbName% < "%rarDestination%\%newestBackup:.rar=.sql%"
    
    if errorlevel 1 (
        :: guardar el error en un archivo .txt
        echo error: %errorlevel% > "%backupFolder%\restoreError.txt"
    ) else (
        echo Restauración completada exitosamente. > "%backupFolder%\restoreSuccess.txt"
    )
) else (
    echo No se encontraron archivos .sql en la carpeta especificada.
)

del %rarDestination%\%newestBackup:.rar=.sql%

timeout /t 20 /nobreak
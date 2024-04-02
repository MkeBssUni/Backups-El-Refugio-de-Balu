:: Script for restoring the most recent full copy of a MySQL database from a .sql file
@echo off

:: Variables
set containerId=b1c662fccb4d2327c8fd7576ef9b357a7c60783c1c3cb28d244167b2e99177b3
set user=balu
set password=s2nd0b4lu

set dbName=refugio_balu
set repositoryFolder=D:\School\BackupsBalu\backups
:: donde busca
set backupFolder=%repositoryFolder%\fullcopies

:: Start the MySQL container
docker start %containerId%
:: Wait for the container to start
::timeout /t 120 /nobreak

cd /d %repositoryFolder%

git pull

for /f "delims=" %%I in ('dir "%backupFolder%\*.sql" /b /a-d /o-d') do (
    set "newestBackup=%%I"
    goto :breakLoop
)
:breakLoop

:: crear un archivo .txt con el nombre del archivo más reciente
echo %newestBackup% > "%backupFolder%\latestBackup.txt"

if defined newestBackup (
    echo Encontrado el archivo de backup más reciente: %newestBackup%
    docker exec -i %containerId% mysql -u %user% -p%password% %dbName% < "%backupFolder%\%newestBackup%"
    
    if errorlevel 1 (
        :: guardar el error en un archivo .txt
        echo error: %errorlevel% > "%backupFolder%\restoreError.txt"
    ) else (
        echo Restauración completada exitosamente. > "%backupFolder%\restoreSuccess.txt"
    )
) else (
    echo No se encontraron archivos .sql en la carpeta especificada.
)

timeout /t 20 /nobreak
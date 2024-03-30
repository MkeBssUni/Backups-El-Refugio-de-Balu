@echo off

set containerId=72410bca8cce
set user=balu
set password=s2nd0b4lu

set backupFolder=D:\School\BackupsBalu\backups\fullcopies
set dbName=refugio_balu

docker start %containerId%
:: Wait for the container to start
::timeout /t 120 /nobreak

cd /d D:\School\BackupsBalu\backups\

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

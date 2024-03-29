$folder = 'D:\School\BackupsBalu\backups'
$filter = '*.*'

$fsw = New-Object IO.FileSystemWatcher $folder, $filter -Property @{
    IncludeSubdirectories = $false
    NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'
}

Register-ObjectEvent $fsw Created -SourceIdentifier FileCreated -Action {
    $path = $Event.SourceEventArgs.FullPath
    $name = $Event.SourceEventArgs.Name
    $changeType = $Event.SourceEventArgs.ChangeType
    $timeStamp = $Event.TimeGenerated
    Write-Host "File $name was $changeType at $timeStamp"
    
    $fecha = Get-Date -Format "yyyy-MM-dd_HH_mm"
    $nombreArchivo = "D:\School\BackupsBalu\backups\backup_" + $fecha + ".sql"
    docker exec -i ecc3338f9726 mysqldump -u balu -ps2nd0b4lu refugio_balu > $nombreArchivo

    git add .
    git commit -m "Backup $fecha"
    git push
}
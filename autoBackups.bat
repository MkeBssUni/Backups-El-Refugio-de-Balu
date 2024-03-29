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
    
    # ejecutar un git add .
    # ejecutar un git commit -m "mensaje"
    # ejecutar un git push

    git add .
    git commit -m "Auto backup"
    git push
}
$folder = 'D:\School\BackupsBalu\backups'
$filter = '*.*'
$fecha = Get-Date -Format "yyyy-MM-dd_HH_mm"
$nombreArchivo = "D:\School\BackupsBalu\backups\backup_" + $fecha + ".sql"

docker exec -i ecc3338f9726 mysqldump -u balu -ps2nd0b4lu refugio_balu > $nombreArchivo

git add .
git commit -m "Backup " + $fecha
git push


    function getDSK {
      Get-CimInstance CIM_DiskDrive  | ForEach-Object {
    
      $disk = $_
      $partitions = "ASSOCIATORS OF " +
                    "{Win32_DiskDrive.DeviceID='$($disk.DeviceID)'} " +
                    "WHERE AssocClass = Win32_DiskDriveToDiskPartition"
    
        Get-CimInstance -Query $partitions | ForEach-Object {
        $partition = $_
        $drives = "ASSOCIATORS OF " +
                  "{Win32_DiskPartition.DeviceID='$($partition.DeviceID)'} " +
                  "WHERE AssocClass = Win32_LogicalDiskToPartition"
    
        Get-CimInstance -Query $drives | ForEach-Object   {
          New-Object -Type PSCustomObject -Property @{
#vARIABLE NAME = Object EXPRESSION
            DiskPartition = $partition.Name
            DriveLetter = $_.DeviceID
            FileSystem = $_.FileSystem
            Description = $_.Description
            DiskSizeGB = ($_.Size/1GB) -as [float]
            FreeSpaceGB = ($_.FreeSpace/1GB) -as [float]
            VolumeName  = $_.VolumeName
            DiskModel = $disk.Model
            PercentageFree= ($_.FreeSpace/$_.Size*100 ) -as [float] 
            Status = $disk.Status
          }
        }
      }
    }
}

$DSK= (getDSK | Select-object -Property DriveLetter, DiskPartition, FileSystem, Status, VolumeName, Description, DiskSizeGB, FreeSpaceGB , PercentageFree, DiskModel);
    
Write-Host($DSK | Out-GridView );
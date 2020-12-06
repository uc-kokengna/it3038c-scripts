#INLINE CSS TEXT, ALTER TO PERSONALIZE YOUR GENERATED RESULTS HTML PRESENTATION

$header = @"
<style>
    body {
    text-align:center;
    }

    h1 {
        font-family: Arial, Helvetica, sans-serif;
        color: #008000;
        font-size: 30px;
    }

    h2 {
        font-family: Arial, Helvetica, sans-serif;
        color: #000099;
        font-size: 23px;
        text-align: center;
        padding-top: 23px;
    }

   table {
   	border: 0px; 
        font-family: Arial, Helvetica, sans-serif;
        display: inline-block; 
        vertical-align: middle;
	} 
	
    td {
	padding: 4px;
	margin: 0px;
        border: 0;
        width: 400px;   
    }
    
    td:nth-child(odd) {
        background: #395870;
        background: linear-gradient(#49708f, #293f50);
        color: #fff;
        text-transform: uppercase;
        padding: 10px 15px;
        font-size: 16px;
	}

    tbody tr:nth-child(even) {
        background: #f0f0f2;
        font-size: 16px;
    }

    #DateGenerated {
        font-family: Arial, Helvetica, sans-serif;
        color: #ff3300;
        font-size: 16px;
        text-align: center
    }

</style>
"@

# FOLLOWING CODE ADDS MORE CLASSES. LOOK AT README.md FOR INSTRUCTIONS
#  "Get-CimClass -ClassName *Win32*" in powershell fetches list of all cim win32 classes

# OBTAIN NAME OF COMPUTER NAME
$ComputerName = "<h1>Computer Name: $env:computername</h1>"

#LIST OF WIN32 CREATION CLASS/CLASSNAMES VARIABLES
#REMOVE VARIABLES BETWEEN "-Property" AND "-Fragment" TO FILTER DISPLAYED INFORMATION

$BiosInfo = Get-CimInstance -ClassName Win32_BIOS | ConvertTo-Html -As List -Property SMBIOSBIOSVersion, Manufacturer, Name, SerialNumber -Fragment -PreContent "<h2>Bios Information</h2>"

$OperatingSystem = Get-CimInstance -Class Win32_OperatingSystem | ConvertTo-Html -As List -Property Caption, Version, BuildNumber, Manufacturer -Fragment -PreContent "<h2>Operating System (OS) Information</h2>"

$Processor = Get-CimInstance -Class Win32_Processor | ConvertTo-Html -As List -Property DeviceID, Name, Manufacturer, MaxClockSpeed, Caption -Fragment -PreContent "<h2>Processor (CPU) Information</h2>"

$VideoController = Get-CimInstance -Class Win32_VideoController | ConvertTo-Html -As List -Property DeviceID, Status, Name, AdapterCompatibility, VideoModeDescription, AdapterDACType, DriverVersion -Fragment -PreContent "<h2>Graphics (GPU) Information</h2>"

$Ram = Get-CimInstance -ClassName Win32_PhysicalMemory | ConvertTo-Html -As List -property Tag,Description, Capactiy, Speed, ConfiguredClockSpeed, DeviceLocator -Fragment -PreContent "<h2>Physical Memory (RAM) Information</h2>"

#COLLECTS DATA OF PHYSCAL AND LOGICAL DISK DRIVES, INCLUDING PARTITIONS
#NOT ADVISABLE TO ALTER "funciton getDSK" UNLESS EXPERIENCED.
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
          DiskPartition = $partition.Name
          DriveLetter = $_.DeviceID
          FileSystem = $_.FileSystem
          Description = $_.Description
          DiskSizeGB  = "{0:N2}" -f ($_.Size/1gb) -as [float]
          FreeSpaceGB = "{0:N2}" -f ($_.FreeSpace/1gb) -as [float] 
          VolumeName = $_.VolumeName
          DiskModel = $disk.Model
          PercentageFree= "{0:N2}" -f ($_.FreeSpace/$_.Size*100) -as [float] 
          Status = $disk.Status
        }
      }
    }
  }
}

# REMOVE OBJECTS AFTER "-Property" TO FILTER FINDINGS
$DSK= (getDSK | Select-object -Property DriveLetter, DiskPartition, FileSystem, Status, VolumeName, Description, DiskSizeGB, FreeSpaceGB , PercentageFree, DiskModel);
$DiskDrive = ($DSK | ConvertTo-Html -As List -Fragment -PreContent "<h2 >Disk Drive Information</h2>");

#COMBINES ALL PREVIOUS WIN32 CREATIED CLASS/CLASSNAMES VARIABLES INTO ONE GENERATED HTML REPORT
$Report = ConvertTo-HTML -Body "$ComputerName $BiosInfo $OperatingSystem $Processor $VideoController $Ram $DiskDrive" -Title "Systems Report" -Head $header -PostContent "<p id='DateGenerated'>Date Generated: $(Get-Date)<p>"

#GENERATE REPORT AS HTML FILE TO DESIRED PATH (OPENS VIA BROWSER)
$Report | Out-File -FilePath C:\Users\spiri\Desktop\Computer-Information-Report.html


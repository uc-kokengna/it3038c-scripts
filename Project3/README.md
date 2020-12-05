# Project3
## Collects and displays detailed information of your system.
##### 1. Bios: _SMBIOS BIOS Version, Manufacturer, Name, SerialNumber_
#### 2. Operating System:  Caption, Version, Build Number, Manufacturer
#### 3. Processor:  DeviceID, Name, Manufacturer, Max ClockSpeed, Caption
#### 4. Video Controller: DeviceID, Status, Name, Adapter Compatibility, VideoMode Description, AdapterType, Driver Version
#### 5. RAM: Tag, Description, Capactiy, Speed, Configured ClockSpeed, Device Slot 
## Getting Started
### This script gathers specific detailed information of system and requires minimal user input.

#### Prerequisites
###### To run this program, make sure you're running Windows PowerShell ISE or an equivalent program (e.g. Visual Studio Code). 
###### User will need to change "-FilePath" paramater to properly generate HTML report (e.g. Desktop). 
```Powershell
$Report | Out-File -FilePath .\Desktop\Computer-Information-Report.html
```

#### Execution
###### 1. Either manually copy and paste the entire code in ISE and run.
###### 2. Or: Use an ISE terminal, navigate to the directory where the script resides and execute.
```Powershell
cd C:\it3038c-scripts\Project2 (enter)
```
```Powershell
.\Project2.ps1 (enter)
```
###### Because this script is written with an *Out-GridView*, your results will display in a secondary window!

###### If wish to keep this program for future use but want to minimize results, you can remove objects within the coding, AFTER *-Property*, and narrow the amount of information you wish to recieve.
```PowerShell
$DSK= (getDSK | Select-object -Property DriveLetter, DiskPartition, FileSystem, Status, VolumeName, Description, DiskSizeGB, FreeSpaceGB , PercentageFree, DiskModel);
``` 
###### NOTE: The order in which the objects are organized will dislay in the same manner of the window grid.


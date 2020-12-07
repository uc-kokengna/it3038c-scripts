# Project3
## Collects detailed information of your system and outputs results in your web browser as an HTML.
#### 1. BIOS: _SMBIOS BIOS Version, Manufacturer, Name, SerialNumber_
#### 2. OPERATING SYTEM:  _Caption, Version, Build Number, Manufacturer_
#### 3. PROCESSOR:  _DeviceID, Name, Manufacturer, Max ClockSpeed, Caption_
#### 4. VIDEO CONTROLLER(S): _DeviceID, Status, Name, Adapter Compatibility, VideoMode Description, AdapterType, Driver Version_
#### 5. PHYSICAL MEMORY: _Tag, Description, Capactiy, Speed, Configured ClockSpeed, Device Slot_ 
#### 6. DISK DRIVE(S): _Disk Paritions, Drive Letter(s), File System, Description, Disk Size (GB), Free Space (GB), Volume Name(s), Disk Model(s), Percentage Free, Working Status_

## Getting Started
### This script gathers specific detailed information of system and requires minimal user input.

### Prerequisites!
##### 1. To run this program, make sure you're running Windows PowerShell ISE or an equivalent program (e.g. Visual Studio Code). 
##### 2. User will need to change "-FilePath" paramater to generate HTML report in another folder/directory (e.g. Desktop). 

## Execution
##### Method 1: Manually copy and paste the entire code in ISE. Change the "-FilePath" parameter (bottom in script) to a more accessible friendly area, such as your desktop, and execute.
```Powershell
$Report | Out-File -FilePath .\Desktop\Computer-Information-Report.html
```
##### Method 2: Use ISE terminal WITH ADMIN PERMISSIONS, navigate to the directory where the script resides and execute.
##### Default location is C:\
```Powershell
cd C:\it3038c-scripts\Project3 (enter)
```
```Powershell
.\Project3.ps1 (enter)
```
##### An HTML link will generate in "-FilePath" location. Select to auto open in your web browser.

## Minimize Search Results!

##### To minimize -Class and -ClassNames results, you can remove objects from variables within: 
```PowerShell
$BiosInfo $OperatingSystem $Processor $VideoController $Ram 
``` 
##### For example: Only find and output $Processor Name and Clock Speed:
```PowerShell
$Processor = Get-CimInstance -Class Win32_Processor | ConvertTo-Html -As List -Property Name, MaxClockSpeed -Fragment -PreContent "<h2>Processor (CPU) Information</h2>"
```

#### Additionally, you can remove objects within "$DSK" to minimize findings:
```PowerShell
$DSK= (... DriveLetter, DiskPartition, FileSystem, Status, VolumeName, Description, DiskSizeGB, FreeSpaceGB , PercentageFree, DiskModel) 
``` 

## Maximize Search Results! 

#### To add additional classes for larger results, use Powershell and enter: 
```PowerShell
Get-CimClass -ClassName *Win32*
``` 
#### This will display all Win32 classes, for which to search and add to the script. For Example:
```PowerShell
Get-CimInstance -ClassName Win32_BaseBoard
``` 
##### Displaying results similar to this:
```PowerShell
Manufacturer : Acer
Model        :
Name         : Base Board
SerialNumber : NBGD8110056390B89A7600
SKU          :
Product      : Ironman_SK
``` 
#### Add the objects desired (Manufacturer, Name, etc.) and the line of code similar to that of the application script!

### You can personalize the results and change the inscript CSS as desired! Enjoy!



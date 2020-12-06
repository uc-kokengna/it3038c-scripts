# Project3
## Collects and displays detailed information of your system.
#### 1. BIOS: _SMBIOS BIOS Version, Manufacturer, Name, SerialNumber_
#### 2. OPERATING SYTEM:  _Caption, Version, Build Number, Manufacturer_
#### 3. PROCESSOR:  _DeviceID, Name, Manufacturer, Max ClockSpeed, Caption_
#### 4. VIDEO CONTROLLER(S): _DeviceID, Status, Name, Adapter Compatibility, VideoMode Description, AdapterType, Driver Version_
#### 5. PHYSICAL MEMORY: _Tag, Description, Capactiy, Speed, Configured ClockSpeed, Device Slot_ 
#### 6. DISK DRIVE(S): _Disk Paritions, Drive Letter(s), File System, Description, Disk Size (GB), Free Space (GB), Volume Name(s), Disk Model(s), Percentage Free, Working Status_

## Getting Started
### This script gathers specific detailed information of system and requires minimal user input.

#### Prerequisites
###### To run this program, make sure you're running Windows PowerShell ISE or an equivalent program (e.g. Visual Studio Code). 
###### User will need to change "-FilePath" paramater to generate HTML report in another folder/directory (e.g. Desktop). 

#### Execution
###### Method 1: Manually copy and paste the entire code in ISE. Change the "-FilePath" parameter to a more accessible friendly area and execute.
```Powershell
$Report | Out-File -FilePath .\Desktop\Computer-Information-Report.html
```
###### Method 2: Use Administrator ISE terminal, navigate to the directory where the script resides and execute.
```Powershell
cd C:\it3038c-scripts\Project3 (enter)
```
```Powershell
.\Project3.ps1 (enter)
```
###### An HTML will generate in "-FilePath" location

###### To minimize filter results, you can remove objects (from '-Property' to "-Fragment) within: 
```PowerShell
$BiosInfo $OperatingSystem $Processor $VideoController $Ram 
``` 
###### NOTE: The order in which the objects are organized will dislay in the same manner of the window grid.


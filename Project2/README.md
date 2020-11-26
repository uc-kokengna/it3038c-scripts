# Project2
### Identify information of locally connected physical disks and other storage devices.

## Getting Started
### This script was written to run and gather physically connected storage without any user input.

#### Prerequisites
###### To run this program, make sure you're running Windows PowerShell ISE or an equivalent program (e.g. Visual Studio Code). 

#### Execution
###### 1. You can either manually copy, paste the entire code in ISE and run.
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

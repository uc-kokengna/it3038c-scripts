# Project2
### Identify information of locally connected physical disks and other storage devices.

## Getting Started
### This script was written to run and gather physically connected storage without any user input.

#### Prerequisites
###### To run this program, make sure Windows PowerShell ISE or an equivalent program (e.g. Visual Studio Code) is installed and working. 

#### Execution
###### You can either copy, paste the entire code in ISE and run.
###### Or: Using an ISE terminal, navigate to the directory where the script lives and execute
```Powershell
cd C:\it3038c-scripts\Project2 (enter)
```
```Powershell
.\Project2.ps1 (enter)
```
###### Because this script is written with an *Out-GridView*, your results will display in a secondary window!

###### If wish to keep this program for future use but want to minimize results, you can remove objects within the coding, after *-Property*, to narrow the amount of information you wish to recieve.
```PowerShell
$DSK= (getDSK | Select-object -Property DriveLetter, DiskPartition, FileSystem, Status, VolumeName, Description, DiskSizeGB, FreeSpaceGB , PercentageFree, DiskModel);
``` 

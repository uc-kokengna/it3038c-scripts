# Project 

### Identify information of locally connected physical disks.

#### Prerequisites
##### To run this program, make sure Windows PowerShell ISE or an equivalent program (e.g. Visual Studio Code) is installed and working. 

#### Execution
##### You can either copy, paste the entire code in ISE and run.
##### Or: navigate to the directory where the script lives and execute
```Powershell
cd C:\it3038c-scripts\Project2 (enter)
```
```Powershell
.\Project2.ps1 (enter)
```

##### You can remove any objects after "-Property" to narrow the amount of information you wish to recieve.
```PowerShell
$DSK= (getDSK | Select-object -Property DriveLetter, DiskPartition, FileSystem, Status, VolumeName, Description, DiskSizeGB, FreeSpaceGB , PercentageFree, DiskModel);
``` 
#### 

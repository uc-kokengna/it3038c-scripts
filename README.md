# it3038c-scripts
```
READ ME For: Project1.ps1

PowerShell script to detect logical storaage space on local system
Outputs detection using gridview.

INLINE CODE W/ COMMENTS:
  
 #SET VARIABLE TO DISPLAY COLUMN NAME (TOTAL SIZE AMOUNT)
 #EXPRESSION CONVERTS DETECTED INT SPACE TO GB WHILE KEEPING DECIMAL FORMAT AS "XX.XX"
$size = @{
    Name="Size(GB)";
    Expression={ "{0,15:n2}" -f($_.size/1gb)}
};

#SET VARIABLE TO DISPLAY COLUMN NAME (CURRENT FREE SPACE)
#EXPRESSION CONVERTS DETECTED INT FREE SPACE TO GB WHILE KEEPING DECIMAL FORMAT AS "XX.XX"
$Freespace = @{
    Name="Free Space(GB)";
    Expression={ "{0,15:n2}" -f($_.freespace/1gb)}
};

#SET VARIABLE TO DISPLAY COLUMN NAME (FREE SPACE %)
#EXPRESSION DIVIDES FREE SPACE AMOUNT BY TOTAL SIZE AMOUNT
#CONVERTS DETECTED FREE SPACE AVAILABLE INTO PERCENTAGE
$Free = @{
    Name="Free(%)";
    Expression={"{0,6:P0}" -f(($_.freespace/1gb) / ($_.size/1gb))}
}

#CIM USED FOR PS CORE
#CREATE FUNCTION TO OBTAIN INSTANCE OF LOGICAL DISK ON LOCAL SYSTEM
#'SELECT-OBJECT -PROPERTY' FETCHES SET VARIABLES
#Sort-Object 'Size(GB)' -Descending |  SORTS RESULTS VIA OBJECT 'Size(GB)' DESCENDING ORDER
#'Out-GridView' DISPLAY RESULTS VIA GRIDVIEW
#'DeviceID' OBTAINS LOGICAL DISK VOLUMES DETECTED

function getDSK
{
Get-CimInstance -Class CIM_LogicalDisk | Select-Object -Property DeviceID, $size, $Freespace, $Free | Sort-Object 'Size(GB)' -Descending | Out-GridView
}
    $DSK = getDSK

 Write-Host($DSK)


```




$size = @{
    Name="Size(GB)";
    Expression={ "{0,15:n2}" -f($_.size/1gb)}
};

$Freespace = @{
    Name="Free Space(GB)";
    Expression={ "{0,15:n2}" -f($_.freespace/1gb)}
};

$Free = @{
    Name="Free(%)";
    Expression={"{0,6:P0}" -f(($_.freespace/1gb) / ($_.size/1gb))}
}

#Get-CimInstance -Class CIM_LogicalDisk => Retrieves Logical disk data only
# CIM NEEDS TO BE USED IN PS CORE AS OPPOSED TO WMI

function getDSK
{

Get-CimInstance -Class CIM_LogicalDisk | Select-Object -Property DeviceID, $size, $Freespace, $Free | Sort-Object 'Size(GB)' -Descending | Out-GridView

}

    $DSK = getDSK

 Write-Host($DSK)




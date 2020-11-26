$Machines = ‘Laptop’
#Foreach ($machine in $Machines) 
#{
#$RCounters = Get-Counter -ListSet * -ComputerName $machine
#write-host(“There are {0} counters on {1}” -f $RCounters.count, $machine)
#}

# for each machine get list of cpu % usage over 10secs 
Foreach ($machine in $Machines) {

$pt = (Get-Counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 1 -MaxSamples 3).CounterSamples.CookedValue
    $sample = 1
    foreach ($p in $pt) {
        "Sample {2}: CPU is at {0}% on {1}" -f [int]$p, $machine, $sample | out-file C:\output.txt
        $sample++
    }


}
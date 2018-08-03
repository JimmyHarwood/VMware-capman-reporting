# VMware-capman-reporting
Advanced function that runs a Capacity management report based on any metric specified in the run
## test
[google](https://www.google.com)

~~test~~
__test__

*this is an example*

```PowerShell
foreach ($vm_host in $gethost)
	{
get-stat -entity $vm_host -stat mem.c*, mem.o*, mem.s*, mem.u*, mem.v*, cpu.r*, cpu.u* -start ([system.datetime]::now.adddays(-1)) -finish ([system.datetime]::now) -intervalmins 5 | select @{E={$_.entity};l="Server"}, @{e={$_.timestamp.TOSHORTDATESTRING()} ;l="Date"}, @{e={$_.timestamp.TOSHORTTIMESTRING()} ;l="Time"}, value, @{e={$_.metricid} ;l="Metric"}, description | convertto-csv -notypeinformation | out-file \\UKSTR1JP00002\VMware_reporting\$date" VMwareHostReport".csv -append
	};
```

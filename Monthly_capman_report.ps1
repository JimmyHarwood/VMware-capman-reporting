#	script for monthly Capman report in Tyco
#	
#	Synopsis:
#	This report will run on the first of every month against
#	all ESX hosts on the UCS chassis and create the ESX file 
#	in the shared location on \\UKSTR1JP00002.After every
#	six months the oldest report file will be removed.
#
#	Requires PSVersion 2.0
#	Requires PowerCLI 4.1
# 	below is original code used on another client so is bespoke
	foreach ($vm_host in $gethost)
	{
get-stat -entity $vm_host -stat mem.c*, mem.o*, mem.s*, mem.u*, mem.v*, cpu.r*, cpu.u* -start ([system.datetime]::now.adddays(-1)) -finish ([system.datetime]::now) -intervalmins 5 | select @{E={$_.entity};l="Server"}, @{e={$_.timestamp.TOSHORTDATESTRING()} ;l="Date"}, @{e={$_.timestamp.TOSHORTTIMESTRING()} ;l="Time"}, value, @{e={$_.metricid} ;l="Metric"}, description | convertto-csv -notypeinformation | out-file \\UKSTR1JP00002\VMware_reporting\$date" VMwareHostReport".csv -append
	};
    
#get last months filename 
    
$filename = (get-item C:\Temp\tempagain\20180719 VMwareHostReport.csv).name

#trim non numeric characters

$olddate = $filename -replace " .*$",""

#get date difference between old and new file to be created

#change file naming convention to have names split by spaces
#change the datetime generation to include forward slashes
#first need to test the slashes in setting custom datetime variable

$olddate = $date -replace " .*$",""

Use this code to calculate day difference
#$d1 = '2017-01-01'
#$d2 = '2017-05-01'
#$ts = New-TimeSpan -Start $d1 -End $d2
#$ts.Days # Check results
#120
#testcomment

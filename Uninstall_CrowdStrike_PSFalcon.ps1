<# Author(s)    : Matthew R. Wyenandt, BSEET, GSIF, GSEC, GABM
   Created On   : 20240930
   Purpose      : PowerShell script created to use PSFalcon module for remotely uninstalling CrowdStrike Sensors.
   Last Modified: 20241004
#>
## NOTE: You must first install the PSFalcon module and request a token.
## Requesting a token requires that an API be setup and the proper client ID and client secret be available to you.
## The API must have the appropriate privileges for the actions you are using within this script.
## Reference the proper use of PSFalcon here:  https://github.com/CrowdStrike/psfalcon/wiki

$hostnameFile = "<Uninstall_CrowdStrike_hostnames_filepath>"

$hostnames = Get-Content -Path $hostnameFile

foreach ($hostname in $hostnames) {
    Get-FalconHost -Filter "hostname: '$hostname'" | Uninstall-FalconSensor -QueueOffline $true
}
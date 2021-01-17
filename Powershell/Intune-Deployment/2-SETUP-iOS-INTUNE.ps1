##
## This script leverages Microsoft Graph scripts in order to import the JSON files which deploy the baseline policies
## Before running the script, ensure all scripts and JSON files are present in the same working directory
## 
## Enter your admin username (e.g. intuneadmin@itpromentor.com); if the variable is not specified the script will prompt
## E.g. .\Setup-Intune.ps1 -User intuneadmin@itpromentor.com
##
## NOTE: No assignments will be made (policies will be imported but not deployed)
## To deploy the polices simply assign them to groups
##

Param (
    $User   
)
if($null -eq $User -or $User -eq ""){

    $User = Read-Host -Prompt "Please specify your user principal name for Intune administration"
    Write-Host
}


## Import enrollment restrictions - currently this just blocks Windows mobile platform
#.\Import-EnrollmentRestrictions.ps1 -User $User

## Import the iOS MDM policies
.\Import-Compliance.ps1 -ImportPath .\Compliance-iOS.json -User $User
.\Import-DeviceConfig.ps1 -ImportPath .\Config-iOS.json -User $User

## Import the MAM policies for iOS and Android
.\Import-MAMPolicy.ps1 -ImportPath .\Android-MAM-withPIN.json -User $User
.\Import-MAMPolicy.ps1 -ImportPath .\iOS-MAM-withPIN.json -User $User

<#

DLP IMPORT SCRIPT V1.0 - R.Thomas 2021
---------------------------------------

* This script is used to import DLP policies for Valto Security Harden implementations

* The Script used the newer Security & comliance powershell modules. You will need to ensure these modules are installed on your workstation.

* Follow link to find required EXO v2 modules: https://docs.microsoft.com/en-us/powershell/exchange/connect-to-scc-powershell?view=exchange-ps

* Microsoft Docs link for powershell commands: https://docs.microsoft.com/en-us/powershell/module/exchange/new-dlpcompliancepolicy?view=exchange-ps
----------------------------------------

SENSITIVE INFO TYPES:
+ UK Drivers License
+ UK National Insurance
+ EU Debit/Credit card

#>

#import the module
Import-Module ExchangeOnlineManagement

#Connect to the Security & Compliance Powershell with Modern Auth
Connect-IPPSSession

#Create Paramters for the DLP commmand
$params = @{
    Name = 'UK DATA PROTECTION';
    ExchangeLocation ='All';
    OneDriveLocation = 'All';
    SharePointLocation = 'All';
    Mode = 'TestWithoutNotifications'
    }

#Pass Paramaters to the new policy comman
new-dlpcompliancepolicy @params

Write-Output "Policy and the location now established in O365"

#Add the rule for Low volume to the policy
New-DlpComplianceRule -Name 'Low Volume UK Drivers License Number' -Policy 'UK DATA PROTECTION' -ContentContainsSensitiveInformation @{Name ="f93de4be-d94c-40df-a8be-461738047551"; minCount = "10"} -BlockAccess $false -AccessScope 'NotInOrganization' #-GenerateAlert "SiteAdmin"
New-DlpComplianceRule -Name 'Low Volume UK National Insurance Number' -Policy 'UK DATA PROTECTION' -ContentContainsSensitiveInformation @{Name ="16c07343-c26f-49d2-a987-3daf717e94cc"; minCount = "10"} -BlockAccess $false -AccessScope 'NotInOrganization' #-NotifyAllowOverride 'WithoutJustification'
New-DlpComplianceRule -Name 'Low Volume UK debit & Credit Card Numbers' -Policy 'UK DATA PROTECTION' -ContentContainsSensitiveInformation @{Name ="0e9b3178-9678-47dd-a509-37222ca96b42"; minCount = "10"} -BlockAccess $false -AccessScope 'NotInOrganization' #-NotifyAllowOverride 'WithoutJustification'
Write-Output "Low Volume Rule Added"

#Add the rule for High volume to the policy
# RUn this cript in Windows PowerShell for Azure Active Directory

Connect-MsolService

$ServiceName = "00000002-0000-0ff1-ce00-000000000000";
$x = Get-MsolServicePrincipal -AppPrincipalId $ServiceName;
$x.ServicePrincipalnames.Add("https://webmail.rcsed.ac.uk");
$x.ServicePrincipalnames.Add("https://autodiscover.surgeonsquarter.com/");
Set-MSOLServicePrincipal -AppPrincipalId $ServiceName -ServicePrincipalNames $x.ServicePrincipalNames;

Get-MsolServicePrincipal -AppPrincipalId 00000002-0000-0ff1-ce00-000000000000 | Select-Object -ExpandProperty ServicePrincipalNames


#Create the authorization server objects for your Exchange Online organization - run this in Exchange Management Shell
New-AuthServer -Name "WindowsAzureACS" -AuthMetadataUrl "https://accounts.accesscontrol.windows.net/surgeonsquarter.com/metadata/json/1"
New-AuthServer -Name "evoSTS" -Type AzureAD -AuthMetadataUrl "https://login.windows.net/rcsedacuk.onmicrosoft.com/federationmetadata/2007-06/federationmetadata.xml"





#From o365 - on-prem
Test-OAuthConnectivity -Service EWS -TargetUri https://webmail.rcsed.ac.uk -Mailbox e.brown@surgeonsquarter.com -Verbose | Format-List

#from Exchnage Server - O365
Test-OAuthConnectivity -Service EWS -TargetUri https://outlook.office365.com/ews/exchange.asmx -Mailbox e.brown@surgeonsquarter.com -Verbose | Format-List

#RCSE DOMAINS
# sqtravel.co.uk
# frrh.rcsed.ac.uk
# movingmedicine.ac.uk
# surgeonsquarter.com TEST THIS ONE 
# jcie.org.uk
# fsem.ac.uk
# tenhillplace.com







Set-User T.Chan@rcsed.ac.uk -PermanentlyClearPreviousMailboxInfo


Get-User T.Chan@rcsed.ac.uk | Select name,*Recipient*
Name PreviousRecipientTypeDetails RecipientType RecipientTypeDetails
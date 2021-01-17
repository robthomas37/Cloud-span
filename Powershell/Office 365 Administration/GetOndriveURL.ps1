#Robert Thomas
#Collect URL for OneDrive Accounts


#THIS SCRIPT MUST BE RUN FROM THE SHAREPOINT MANAGEMENT SHELL ONLY! OTHER POWERSHELL APPS WONT WORK. 


$TenantUrl = Read-Host "Enter the SharePoint Online Tenant Admin Url"
 $LogFile = [Environment]::GetFolderPath("Desktop") + "\OneDriveSites.log"
 Connect-SPOService -Url $TenantUrl
 Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "Url -like '-my.sharepoint.com/personal/" |Select-Object Url | Out-File $LogFile -Force
 Write-Host "Done! File saved as $($LogFile)."
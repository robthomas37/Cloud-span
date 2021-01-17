#Give Permisisons to users Calender

#connect to exchnage online in powershell
$LiveCred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange-ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
Import-PSSession $Session

#This example assigns permissions for Anna to access John's calendar mailbox folder and applies the readitems role to her access of that folder

Add-MailboxFolderPermission –Identity Philip.Maclean@auger.co.uk:\Calendar  -AccessRight Editor -User debbie.moody.bbs@bbsproperties.co.uk


#This example assigns permissions for Anna to access John's calendar mailbox folder and applies the readitems role to her access of that folder

Remove-MailboxFolderPermission –Identity Philip.Maclean@auger.co.uk:\Calendar -User debbie.moody.bbs@bbsproperties.co.uk
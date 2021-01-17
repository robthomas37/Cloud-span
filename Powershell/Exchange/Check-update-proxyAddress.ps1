#Variables
$Domain = "rcsedacuk.mail.onmicrosoft.com"
 
#Get all users in ActiveDirectory
$Users = Get-ADUser -Filter * -searchbase "OU=Users,OU=Birmingham,DC=rcs,DC=local" -Properties ProxyAddresses
 
#Some output is always nice
Write-Host "Processing $Users.Count users..." -ForegroundColor Green
 
#Go through all users
foreach ($User in $Users) {
 
#Check if <domain>.mail.onmicrosoft.com alias is present, if not add it as an alias
if ($User.Proxyaddresses -like "*$Domain*") {
Write-Host "$User.mailNickname has an alias matching $Domain..." -ForegroundColor Yellow 
}
else {
$Alias = "smtp:" + $User.mailNickname + "@" + $Domain
Set-ADUser $User -Add @{Proxyaddresses="$Alias"}
Write-Host "Alias addded to $User.mailNickname..." -ForegroundColor Green
}
}
Write-Host "Done" -ForegroundColor Green
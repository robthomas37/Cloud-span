Connect-MicrosoftTeams

$Teams = Get-Team 

#$teams
$GroupId = $Teams.GroupId
$GroupId | Out-File -FilePath .\teamsOwner.txt

Get-TeamUser -Role Owner -GroupId
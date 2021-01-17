#Robert Thomas - Create Teams based on CSV Import.

Install-Module -Name MicrosoftTeams -Scope CurrentUser
Get-TeamHelp

#Connect to Microsoft Teams
Connect-MicrosoftTeams

$Teams = import-csv "C:\Users\RobertThomas\OneDrive - Valto\Test Enviroment\TeamsImport-.csv"

ForEach ($item in $Teams) 
{
    #Asign CSV Headers to Variables

    $DisplayName = $item.Name
    $Desc = $item.Description
    $Alias = $item.MailNick
    $Access = $item.Visibility
    

    # Create a team
        #Example
        #$team = New-Team -DisplayName "Ignite demo team" -Description "This is a brand new team" -Alias "IgniteDemoTeam" -AccessType Public -AddCreatorAsMember $true
    $team = New-Team -DisplayName $DisplayName -Description $Desc -MailNickName $Alias -Visibility $Access -AllowTeamMentions $true 
    $team
    $GroupId = $team.GroupId
    $GroupId
} 


# Disconnect
Disconnect-MicrosoftTeams


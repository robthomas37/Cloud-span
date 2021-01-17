#This Script reveals who can create Office365 Groups (Teams).

#Connect to Azure AD - This must use the AzureAD Preview module
Connect-AzureAD

#https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/groups-settings-cmdlets

$GroupID = (Get-AzureADDirectorySetting).Values | Where-Object -Property Name -Value GroupCreationAllowedGroupId -EQ

Get-AzureADGroup -ObjectId $GroupID.Value

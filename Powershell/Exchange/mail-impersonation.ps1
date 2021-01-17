
#Robert Thomas 2020

#This script is used to setup user impersonation for an Admin account to migrate mailbox items using BitTitan. https://help.bittitan.com/hc/en-us/articles/115012358947

# The script performs the following:

#Connect to Exchange Online using PowerShell.
#Create a new Office 365 Group and name it in a recognizable fashion.
#Add to the new Group all of the user mailbox accounts that you intend to migrate.



#===========================================================================================
#WARNING - BEFORE YOU RUN THIS SCRIPT CHECK Enable-OrganizationCustomization HAS BEEN RUN.
#===========================================================================================




#CREATE DISTRUBTUION GROUP

New-DistributionGroup -Name "migrate"  #-Members johns@mycompany.com,brucew@mycompany.com

#RETRIEVE Distinguished Name

$DistinguishedName = Get-DistributionGroup -Identity "migrate" |fl name, dist*

#CREATE MANAGEMENT SCOPE

New-ManagementScope "Migration-Scope" -RecipientRestrictionFilter {MemberOfGroup -eq $DistinguishedName}

#Create the Management Role Assignment

$AdminAccount = Read-Host -Prompt 'Input your Admin Account name... e.g "Valo Admin"'

New-ManagementRoleAssignment -Name "MigrationProject" -Role "ApplicationImpersonation" -User $AdminAccount -CustomRecipientWriteScope "Migration-Scope"


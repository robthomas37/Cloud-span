#RUN THESE IN EXCHNAGE ON PREM POWERSHELL MODULE ONLY - TESTED ON EXCHNAGE 2013


#FULL PERMISSION
#*****************************************************
Add-MailboxPermission -Identity "Test Shared Mailbox" -User "Valto Administrator" -AccessRights FullAccess -InheritanceType All
Add-MailboxPermission -Identity "Test Shared Mailbox" -User "Neil.Wilks" -AccessRights FullAccess -InheritanceType All

Get-MailboxPermission -Identity augeradmin@auger.co.uk

Get-MailboxPermission -Identity augeradmin@auger.co.uk -User "Valto Administrator"


#SEND ON BEHALF
#************************************************************

set-mailbox -GrantSendOnbehalfto <‘Kim@contoso.com’>

set-mailbox ‘Test Shared Mailbox’ –Grantsendonbehalfto @{add=”Valto@auger.co.uk”, “Neil.wilks@auger.co.uk”}


#SEND AS
#*************************************************************************

Get-Mailbox "Test Shared Mailbox" | Add-ADPermission -User "Valto Administrator" -ExtendedRights "Send As"
Get-Mailbox "Test Shared Mailbox" | Add-ADPermission -User "Neil.Wilks" -ExtendedRights "Send As"
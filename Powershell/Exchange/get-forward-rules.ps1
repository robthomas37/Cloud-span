#RUN IN EXCHANGE ONLINE PS MODULE

#This script Generates a list of mailboxes with forwarding rules at the exchnage level and generates the outlook rules configured by users

#Get exchange level forwarding rules
Get-Mailbox -ResultSize Unlimited -Filter {(RecipientTypeDetails -ne "DiscoveryMailbox") -and ((ForwardingSmtpAddress -ne $null) -or (ForwardingAddress -ne $null))}


#Get all outlook rules 
foreach ($a in (Get-Mailbox -ResultSize Unlimited |Select-Object PrimarySMTPAddress)) {Get-InboxRule -Mailbox $a.PrimarySMTPAddress | ?{($_.ForwardTo -ne $null) -or ($_.ForwardAsAttachmentTo -ne $null) -or ($_.DeleteMessage -eq $true) -or ($_.RedirectTo -ne $null)} |Select-Object Name,Identity,ForwardTo,ForwardAsAttachmentTo, RedirectTo, DeleteMessage | Export-Csv c:\temp\InboxRules.csv -append }

#REMOVE INBOX RULES
#  Get-InboxRule -Mailbox "user@company-domain.com" | Remove-InboxRule
#This Script must be run with the Exchange Powershell Module (V2 recommended) 

#https://docs.microsoft.com/en-us/exchange/policy-and-compliance/mail-flow-rules/mail-flow-rule-procedures?view=exchserver-2019#use-the-exchange-management-shell-to-import-a-mail-flow-rule-collection

###--POLICIES CREATED--####
# Mail FLow Rule to block Auto Forward


$rejectMessageText = "Auto-forwarding rules to external addresses has been disabled."

New-TransportRule -name "Block AutoForward" -Priority 0 -SentToScope NotInOrganization -FromScope InOrganization -MessageTypeMatches AutoForward -RejectMessageEnhancedStatusCode 5.7.1 -RejectMessageReasonText $rejectMessageText


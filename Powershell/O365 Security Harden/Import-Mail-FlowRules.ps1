#This Script must be run with the Exchange Powershell Module (V2 recommended) 

#https://docs.microsoft.com/en-us/exchange/policy-and-compliance/mail-flow-rules/mail-flow-rule-procedures?view=exchserver-2019#use-the-exchange-management-shell-to-import-a-mail-flow-rule-collection

###--POLICIES CREATED--####
# Mail FLow Rule to block Auto Forward


[Byte[]]$Data = Get-Content -Path "C:\Users\RobertThomas\OneDrive - Valto\Script\O365 Security Harden\Exported Rules.xml" -Encoding Byte -ReadCount 0; Import-TransportRuleCollection -FileData $Data
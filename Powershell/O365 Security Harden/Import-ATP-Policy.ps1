#This Script must be run with the Exchange Powershell Module (V2 recommended) 

#https://docs.microsoft.com/en-us/powershell/module/exchange/new-safeattachmentpolicy?view=exchange-ps

###--POLICIES CREATED--####
#ATP Safe Links
#ATP Safe Attachemnt
#ATP Anti Phishing

$COMPANY = "Enola Gaye"

$DOMAIN1 = "enolagaye.com"
$DOMAIN2
$DOMAIN3


#------SAFE-LINKS-------

New-SafeLinksPolicy -Name "$COMPANY Base Block URL" -IsEnabled $true -TrackClicks $true -ScanUrls $true
New-SafeLinksRule -Name "Global URL Rule" -SafeLinksPolicy "$COMPANY Base Block URL" -RecipientDomainIs $DOMAIN1
#Set-SafeLinksPolicy -Identity "SCIBITE Base Block URL" -EnableSafeLinksForTeams $true



#------SAFE-ATTACHMENTS-------

New-SafeAttachmentPolicy -Name "$COMPANY Dynamic Delivery" -Action DynamicDelivery -Enable $true 
New-SafeAttachmentRule -Name "Global Attachment Rule" -SafeAttachmentPolicy "$COMPANY Dynamic Delivery" -RecipientDomainIs $DOMAIN1


#------ANTI-PHISHING-------
# uncomment end of command to enable impersonation for specifi users

New-AntiPhishPolicy -Name "$COMPANY Antiphish policy" -AdminDisplayName "Global Policy" -EnableOrganizationDomainsProtection $true -EnableTargetedDomainsProtection $true -TargetedDomainsToProtect $DOMAIN1 -TargetedDomainProtectionAction Quarantine #-EnableTargetedUserProtection $true -TargetedUsersToProtect "Mai Fujito;mfujito@fabrikam.com" -TargetedUserProtectionAction Quarantine -EnableMailboxIntelligence $true -EnableMailboxIntelligenceProtection $true -MailboxIntelligenceProtectionAction Quarantine -EnableSimilarUsersSafetyTips $true -EnableSimilarDomainsSafetyTips $true -EnableUnusualCharactersSafetyTips $true
New-AntiPhishRule -Name "Global Antiphish Rule" -AntiPhishPolicy "$COMPANY Antiphish policy" -RecipientDomainIs $DOMAIN1
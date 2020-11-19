Connect-AzAccount

New-AzResourceGroup -Name "DEMO-RG-1"

Get-AzResourceGroup -Name "DEMO-RG-1"

Remove-AzResourceGroup -Name "Sage-Drive"

Get-AzVM -Verbose

$Myvault = Get-AzRecoveryServicesVault 

Write-Output $Myvault.ID

Set-AzRecoveryServicesVaultProperty -VaultId $Myvault.ID -SoftDeleteFeatureState Disable

Remove-AzRecoveryServicesVault -Vault 
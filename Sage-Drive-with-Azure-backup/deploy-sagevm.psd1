Connect-AZAccount

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"

New-AzResourceGroup -Name $resourceGroupName -Location $location
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile /Users/robert/Documents/GitHub/Cloud-span/Sage-Drive-with-Azure-backup/azuredeploy.json


Remove-AzResourceGroup -Name "Sage-Drive-RG"

New-AzResourceGroupDeployment -ResourceGroupName Sage-Drive-RG -TemplateFile /Users/robert/Documents/GitHub/Cloud-span/Sage-Drive-with-Azure-backup/azuredeploy.json
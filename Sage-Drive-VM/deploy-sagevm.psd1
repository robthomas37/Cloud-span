Connect-AZAccount

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"

New-AzResourceGroup -Name $resourceGroupName -Location $location
New-AzResourceGroupDeployment -ResourceGroupName Test-VM-ARM -TemplateFile /Users/robert/Documents/GitHub/Cloud-span/Sage-Drive-VM/azuredeploy.json
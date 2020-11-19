# Log in first with Connect-AzAccount if you're not using Cloud Shell
#Connect-AzAccount
# Deploy Azure Resource Manager template using template and parameter file locally
New-AzSubscriptionDeployment -Name AzureLightHouse-Valto -Location uksouth -TemplateFile "C:\Users\RobertThomas\OneDrive - Valto\Script\ARM Templates\delegatedResourceManagement.json" -Verbose
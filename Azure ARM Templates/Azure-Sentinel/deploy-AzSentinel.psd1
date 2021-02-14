Connect-AZAccount

New-AzResourceGroupDeployment -ResourceGroupName "uks-monitor-rg" 
                              -TemplateParameterFile .\azuredeploy.parameters.json 
                              -TemplateFile .\azuredeploy.json 
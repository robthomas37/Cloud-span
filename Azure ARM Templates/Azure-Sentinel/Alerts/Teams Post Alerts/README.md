#  Post-Message-Teams


This playbook will post a message in a Microsoft Teams channel when an Alert is created in Azure Sentinel

## Prerequisites

MS teams Account that allow to post messages


**Deploy with alert trigger**

After deployment, you can run this playbook manually on an alert or attach it to an **analytics rule** so it will rune when an alert is created.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FPost-Message-Teams%2Falert-trigger%2Fazuredeploy.json)
[![Deploy to Azure Gov](https://aka.ms/deploytoazuregovbutton)](https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FPost-Message-Teams%2Falert-trigger%2Fazuredeploy.json)

## Screenshots
**Incident Trigger**
![Incident TriggerL](./incident-trigger/images/designerLight.png)
![Incident TriggerD](./incident-trigger/images/designerDark.png)

**Alert Trigger**
![Alert Trigger](./alert-trigger/images/designerAlertLight.png)

**Microsoft Teams**
![Teams](./images/TeamsDark.png)
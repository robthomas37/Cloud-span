#Robert Thomas - This Script will add users to an Office 365 as a member and then as an owner. The list of Groups will be pulled from a CSV.
#SCRIPT MUST BE RUN IN EXCHANGE POWERSHELL ODULE

#Connect to customer tenant
Connect-EXOPSSession

#get the CSV File
$Groups = import-csv "C:\Users\RobertThomas\OneDrive - Valto\Test Enviroment\TheGroups.csv"

ForEach ($item in $Groups)
{

    #assign headeds to variables
    $GroupName = $item.Name

#add user as memeber first
Add-UnifiedGroupLinks -Identity $GroupName -LinkType Members -Links Robert@valto.co.uk

#Now you can add as Owner
Add-UnifiedGroupLinks -Identity $GroupName -LinkType Owners -Links Robert@valto.co.uk
}
$users = Get-Content "insert file location here"
$users | foreach {Set-User -Identity $_ -RemotePowerShellEnabled $false}
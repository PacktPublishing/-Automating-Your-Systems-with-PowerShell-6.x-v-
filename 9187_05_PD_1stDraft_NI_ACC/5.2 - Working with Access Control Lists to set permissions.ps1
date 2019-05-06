Set-Location C:\
Clear-Host

Get-Command *acl*

NET USER StandardUser StandardPassword /ADD
$tempacl = get-acl C:\temp
$tempacl | Get-Member

$tempacl.AddAccessRule


[System.Security.AccessControl.FileSystemAccessRule]::new
$Identity = "$ENV:Computername\StandardUser"
$Rights = [System.Security.AccessControl.FileSystemRights]::Modify
$Type = [System.Security.AccessControl.AccessControlType]::Allow
$NewRule = [System.Security.AccessControl.FileSystemAccessRule]::new($Identity,$Rights,$Type)

$tempAcl.AddAccessRule($NewRule)
$tempAcl.SetAccessRule($NewRule)

Set-Acl C:\temp -AclObject $tempacl
icacls.exe /?

Get-Acl C:\temp | Set-Acl C:\temp3
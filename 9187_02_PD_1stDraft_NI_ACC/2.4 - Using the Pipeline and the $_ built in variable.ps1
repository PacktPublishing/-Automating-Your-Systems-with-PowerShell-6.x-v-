# Use the Pipeline to use the output of one cmdlet as the
# start of the next cmdlet
Set-Location C:\temp
Get-Content MyFile.txt
Get-Content MyFile.txt | Select-String "Co"

# Using with the pipeline to manage services
Get-Service | Get-Member
Get-Service | Select-Object ServiceName, Displayname, StartType, Status -First 10
Get-Service | Where-Object Name -eq Spooler | Select-Object ServiceName, Displayname, StartType, Status 
Get-Service -Name Spooler | Start-Service -Verbose

# Using the $_ variable
Get-Service | Where-Object {$_.Name -eq "Spooler"}
Get-Service | Where-Object {$_.StartType -eq "Automatic"}
Get-Service | Where-Object {$_.StartType -eq "Automatic" -and $_.Status -ne "Running"}

Help About_*operators

# A familiar pattern starts to develop
Get-SomeObjects | Perform-SomeOperation
Get-SomeObjects | Filter-TheObjects | Perform-SomeOperation




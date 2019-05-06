#Working with objects
Set-Location C:\
Clear-Host

#Finding type of object with Get-Member and GetType()
$PSObject = New-Object -TypeName psobject
$PSObject | Get-Member

$PSObject.GetType()

#Looking at properties
Clear-Host
$Spooler = Get-Service -Name Spooler
$Spooler
$Spooler | Get-Member -MemberType Property
$Spooler.StartType
$Spooler.StartType.GetType()
$Spooler.Status


$Spooler | Get-Member -MemberType Method 
$Spooler.Start
$Spooler.Stop
$Spooler.Stop()

#As of the time that I saved this variable
$Spooler

#Current status
Get-Service -ServiceName Spooler
$Spooler.Start()

Get-Service -ServiceName Spooler

# Don't forget - there are often commands that already help you with starting and stopping services
# Use the pattern we've already discussed to help find them:
Get-Command -Noun Service
Get-Help -Name Start-Service -Online

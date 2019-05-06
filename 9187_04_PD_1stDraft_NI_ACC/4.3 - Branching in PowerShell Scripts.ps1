Set-Location C:\
Clear-Host


if  ($True) {
  Write-Host -ForegroundColor Green "Hello from the IF statement"
}

$AutomaticFile = Get-Item C:\temp\Automatic
if ($AutomaticFile) {"$AutomaticFile exists"}


Clear-Host
if ($false) {
  Write-Host -ForegroundColor Green "Hello from the IF statement"
} else {
  Write-Host -ForegroundColor Green "Hello from the ELSE statement"
}

Clear-Host
IF (-not $true) { "DO THIS" } ELSE { "DO THAT" }

Clear-Host
IF (-not $true) {"If"} ELSEIF ($true) { "Else if" } ELSE {"What else could it be?"}

#SWITCH STATEMENT
$SpoolerService = Get-Service -Name "Spooler"
Switch ($SpoolerService.Status) {

}

Clear-Host
$SpoolerService | Stop-Service
switch ((Get-Service Spooler).Status) {
  "Running" { "Service is already running"  }
  "Starting" { "Wait for service to complete starting"  }
  Default { $SpoolerService | Start-Service; Write-Host "Starting Print Spooler Service" }
}

#Functions
Function DoSomething { "Something"}
Function ShipOldLogs {
  Param( $Date )
  Get-Childitem C:\temp\*.log | Where-Object {$_.lastwritetime -lt $Date} | Move-Item -Destination C:\Logs
}

Function Move-OldLogs {
  <#
  .SYNOPSIS
    moves old log files
  .DESCRIPTION
    moves *.log files that are older than the specified date to the logs directory
  .EXAMPLE
    Move-OldLogs -Date (Get-Date).AddDays(-7)
    Moves log files more than 7 days old
  #>
    [CmdletBinding()]
    Param( $Date )
    Get-Childitem C:\temp\*.log | Where-Object {$_.lastwritetime -lt $Date} | Move-Item -Destination C:\Logs
  }

Get-Help about_Functions*

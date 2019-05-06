Set-Location C:\
Clear-Host
$Trace = @()

$Trace += "Checking spooler service"
$SpoolerService = Get-Service -Name Spooler 

$Trace += "Spooler Status: $($SpoolerService.Status)"

If ($SpoolerService.StartType.ToString() -eq "Automatic") {
  While ((Get-Service spooler).Status -ne "Running") {
    Switch ((Get-Service Spooler).Status) {
      "Stopped" {
        $Trace += "Attempting Service Start: $($SpoolerService.Name)"
        $SpoolerService | Start-Service
      }
      "Starting" {
        $Trace += "Waiting for service to start"
      }
      Default {
        $Trace += "No action required"
      }
    } #End SWITCH 
  } #End WHILE
} #End IF
$Trace

$Trace | Out-File C:\temp\trace.log

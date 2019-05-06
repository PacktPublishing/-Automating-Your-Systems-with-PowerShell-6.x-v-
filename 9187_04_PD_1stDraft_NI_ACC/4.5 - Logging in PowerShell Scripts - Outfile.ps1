Set-Location C:\
Clear-Host
$Logfile = New-Item c:\temp\logfile.log -Force

"Checking spooler service" | Out-File $Logfile -Append

$SpoolerService = Get-Service -Name Spooler

"Spooler Status: $($SpoolerService.Status)" | Out-File $Logfile -Append

If ($SpoolerService.StartType.ToString() -eq "Automatic") {
  While ((Get-Service spooler).Status -ne "Running") {
    Switch ((Get-Service Spooler).Status) {
      "Stopped" {
        "Attempting Service Start: $($SpoolerService.Name)" | Out-File $Logfile -Append
        $SpoolerService | Start-Service
      }
      "Starting" {
        "Waiting for service to start" | Out-File $Logfile -Append
      }
      Default {
        "No action required" | Tee-Object -FilePath $Logfile -Append
      }
    } #End SWITCH 
  } #End WHILE
} #End IF
Get-Content $Logfile

Code $Logfile

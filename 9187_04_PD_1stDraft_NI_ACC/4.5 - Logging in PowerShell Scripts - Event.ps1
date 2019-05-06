Set-Location C:\
Clear-Host

Function Write-MyInfoEvent {
  [CmdletBinding()]
  Param(
  [String]$Message,
  [Int]$Id
  )
  eventcreate.exe /T INFORMATION /ID $ID /SO "Demo4.5-Events" /L APPLICATION /D $Message | Out-Null
}


$SpoolerService = Get-Service -Name Spooler
Write-MyInfoEvent -ID 100 -Message "Spooler Status: $($SpoolerService.Status)"

If ($SpoolerService.StartType.ToString() -eq "Automatic") {
  While ((Get-Service spooler).Status -ne "Running") {
    Switch ((Get-Service Spooler).Status) {
      "Stopped" {
        Write-MyInfoEvent -ID 100 -Message "Attempting Service Start: $($SpoolerService.Name)"
        $SpoolerService | Start-Service
      }
      "Starting" {
        Write-MyInfoEvent -ID 100 -Message "Waiting for service to start" 
      }
      Default {
        Write-MyInfoEvent -Id 100 -Message "No action required"
      }
    } #End SWITCH 
  } #End WHILE
} #End IF
Get-WinEvent -ProviderName "Demo4.5-Events"

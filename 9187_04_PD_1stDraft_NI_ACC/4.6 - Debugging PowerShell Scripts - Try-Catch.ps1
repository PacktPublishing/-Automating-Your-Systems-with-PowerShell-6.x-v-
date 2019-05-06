Set-Location C:\
Clear-Host


Try {
  Clear-Host
  $ServiceTimesProcess = (Get-Service | Get-Random) * 2
}
Catch {
  Write-Host "There is an error.  Error message:"
  $Error[0]
  Write-Host "Contact script author to report a bug"
}
Finally {
  "Even though there was an error, the FINALLY scripblock processes"
}

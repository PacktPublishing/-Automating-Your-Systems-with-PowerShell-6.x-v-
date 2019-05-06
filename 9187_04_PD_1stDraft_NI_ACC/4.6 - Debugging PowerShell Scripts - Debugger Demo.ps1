function GetRandomProcess {
  Get-Process | Get-Random
}

Clear-Host
Do {
  $ARandomProcess = GetRandomProcess
  $ARandomProcess
} Until ($ARandomProcess.Name -eq "svchost")
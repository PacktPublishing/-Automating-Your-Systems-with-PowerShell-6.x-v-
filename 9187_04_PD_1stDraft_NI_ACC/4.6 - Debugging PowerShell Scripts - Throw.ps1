Set-Location C:\
Clear-Host

#Using a TRAP to invoke functions, cmdlets or external programs in response to an error.
Trap {
  $Time = Get-Date -Format "hh:mm:ss"
  "At $Time, an error occurred."
  "The error was:"
  "$_"
}



#THROW 
Throw
Throw "This was not expected."

$Error[0]

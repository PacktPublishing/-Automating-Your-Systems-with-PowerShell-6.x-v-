Set-Location C:\
Clear-Host

#DO loop
Clear-Host
$a = 0
Do {
  $a += 25
  "This time through the loop, A is: $a"
} While ($a -lt 100)
 
Clear-Host
$B = $a 
Do {
  $b -= 25
  "This time through the loop, B is: $b"
} Until ($b -le 0)

#WHILE loop
$StartTime = Get-Date
$StopTime = $StartTime.AddSeconds(3)
Clear-Host 

While ((get-date) -lt $stoptime) {
  Write-Host "Waiting..."
  Start-Sleep -Seconds 1
}
Write-Host "Done"

#FOR loop - uses a variable as a counter
# needs 3 things: 
#  - Starting value
#  - Continue condition
#  - How to adjust the value each pass through the loop

For ($a = 0; $a -lt 10; $a++) { $a }

Clear-Host
$Files = Get-Childitem C:\temp | Select-Object -First 5
For ($a = 0; $a -lt 5; $a++) { "{0} is {1} bytes" -f $Files[$a].BaseName, $Files[$a].Length}

#Foreach
Clear-Host
Foreach ($file in $files) { "{0} is {1} bytes" -f $file.basename, $file.length }

Clear-Host
$Files | Foreach-Object {"{0} is {1} bytes" -f $_.basename, $_.length}

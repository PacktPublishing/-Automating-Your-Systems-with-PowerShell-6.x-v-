Set-Location c:\
Clear-Host

#Where-Object
Get-Command Get-Process -Syntax 
Get-Process | Get-Member -MemberType Properties 


Get-Process | Where-Object {$_.Path -like  "C:\Users\*"}  
Get-Process | Where-Object Path -like "C:\Users\*"  

Clear-Host

#Select-Object
Get-Process -Name "Code"
Get-Process -Name "Code" | Get-Member -Membertype Property
Get-Process -Name "Code" | Select-Object Name, Path
Get-Process -Name "Code" | Select-Object Name, Path | Get-Member 
Get-Process -Id 4 | Select-Object *

Get-Process | Select-Object Name -First 1
Get-Process | Select-Object Name -Skip 20

Get-ComputerInfo | Select-Object OsHotFixes
Get-ComputerInfo | Select-Object -ExpandProperty OsHotFixes


#Sort-Object
Get-Process | Select-Object -First 20
Get-Process | Select-Object -First 20 | Sort-Object ID
Get-Process | Select-Object -First 20 | Sort-Object name, ID

#Group-Object
Get-Service | Get-Member -MemberType Property
Get-Service | Group-Object StartType

#Measure-Object
Get-Process | Measure-Object 
Get-Process | Measure-Object WorkingSet -Average -Sum -Maximum -Minimum

#Foreach-Object
Set-Location C:\Temp
Get-Service | Group-Object StartType | Foreach-Object { $_.Group.DisplayName | Out-File -FilePath $_.Name }


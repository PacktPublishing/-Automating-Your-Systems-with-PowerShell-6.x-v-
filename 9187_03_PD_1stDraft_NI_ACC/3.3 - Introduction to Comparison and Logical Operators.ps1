#Comparison Operators
Set-Location C:\ 
Clear-Host 

# Equal, Like, Greater-Than, Less-Than 
1 + 2 -eq 3
4 -eq "four"
"4" -eq 4

#Like requires a wildcard.
"Hello World" -like "Hello*"
"Hello World" -like "World*"
"Hello World" -like "*ell*"

"One","Two","Three" -contains "One" 
"One" -in "One","Two","Three" 

#Greater Than
(Get-Process).Length -gt 100
1 -ge 1
1 -lt 0
0 -le 1

#Logical operators 
# perform evaluations on multiple True/False conditions

# $True is always true
$True 
# $False is always false 
$False 
$False -eq $True 

# These could be anything that evaluates to True/False
# Filename -eq "Something", Fileversion less than 3
#
# AND - ALL of the evaluated conditions are true
$True -and $True  
$True -and $True -and $True -and $False 

# OR - ANY of the evaluated conditions are true
$False -or $False 
$False -or $False -or $False -or $True 

# NOT Returns the opposite of the condition
# Just like math, use parenthesis to group logically and to evaluate those items first
$True -and $True -and $True -and (-not $True) 

Get-Help About_*Operators
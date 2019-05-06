Set-Location C:\
Clear-Host

# Syntax for creating a hashtable is the at-sign (@) followed by curly brackets {}.
# Keys and values are inside the curly brackets. 
# Use a semicolon to separate multiple key/value sets entered on the same line
$Hashtable = @{FirstName = "Michael"; LastName = "Simmons"}
$Hashtable

#Using the object reference operator (.) to access the keys - just like a property.
$Hashtable.FirstName

#But using Select-Object on a hashtable doesn't work the way you expect.
$Hashtable | Select-Object Firstname

$Hashtable

#Creating the PSCustomObject from the hashtable is easy. Place the object typename
# into square brackets and PowerShell will attempt to convert an object to that type 
$Object = [PSCustomObject]$hashtable
$AnotherWay = [PSCustomObject]@{FirstName = "Michael"; LastName = "Simmons"}

$Object
$AnotherWay
$Hashtable

$Object | Select-Object Firstname

$Object | Add-Member -MemberType NoteProperty -Name Initial -Value "T"

$Object




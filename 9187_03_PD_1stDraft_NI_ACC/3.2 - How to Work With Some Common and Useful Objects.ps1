#How to Work With Some Common and Useful Objects
Set-Location C:\
Clear-Host
$ErrorText = @"
Method invocation failed because [System.Diagnostics.Process] does not contain a method named 'op_Addition'.
At line:1 char:1
+ $NotAnArray += Get-Process | Get-Random
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (op_Addition:String) [], RuntimeException
    + FullyQualifiedErrorId : MethodNotFound
"@

#Strings
"Hello World"
$Hi = "Hello, World"

#String Properties
$Hi | Get-Member -MemberType Property
$Hi.Length

#String Methods
$Hi | Get-Member -MemberType Method
Clear-Host

$Hi.Contains("Earth")
$Hi.IndexOf(",")
$Hi.Insert($Hi.IndexOf(","),"There")
$Hi.Remove(0,7)
$Hi.Replace("World","Earthlings")
$Hi.Split(",")


$SimpleCredential = Get-Credential

$SimpleCredential | Get-Member -MemberType Property
$SimpleCredential.Password

$SimpleCredential.GetNetworkCredential()

$SimpleCredential.GetNetworkCredential().Password


#Arrays
$Array = Get-Childitem C:\temp

#The output of $Array is used as an input to Get-Member.
# Why doesn't Get-Member give the properties of an array?
# Because it's more likely you want to get the properties of what's IN the array.
$Array | Get-Member

# But it does have an object type all of its own.
$Array.GetType()

# Here's what you need to know about working with Arrays...
# Getting how many items are in an array
$Array.Length

# Looking at one object in the array
$Array[0]

# Looking at a few objects in the array... like items 1 through 3
$Array[1..3]

#Looking at the last object in the array, whatever that number is...
$Array[-1]

#How to get an error when you're adding another item to the array
$NotAnArray = Get-Process | Get-Random
$NotAnArray
$NotAnArray.GetType()
#A process doesn't "ADD" to another process... Strings can add, numbers can, but not processes.
$NotAnArray += Get-Process | Get-Random
$ErrorText


#And how to create the array first so that adding a second item works
$YesAnArray = @()
$YesAnArray.GetType()
$YesAnArray += Get-Process | Get-Random
$YesAnArray
$YesAnArray += Get-Process | Get-Random
$YesAnArray

#File and Directory info:
$Array

#How big is the file?
$Array[3].Length

#What is the files name
$Array[3].Name                #Filename with extension
$Array[3].Directory           #Directory that the file is in
$Array[3].Directory.FullName  #Directory that the file is in
$Array[3].FullName            #Path to the file

#Timestamps on files
$Array[3].CreationTime        # When file was created. 
$Array[3].LastWriteTime       # Last time the file was saved to

#Version information
$Array[3].VersionInfo | Get-Member

#Scriptblocks
$Scriptblock = { Get-Process PowerShell, Code;  Write-Host -ForegroundColor Green "Complete" }
$Scriptblock
& $Scriptblock
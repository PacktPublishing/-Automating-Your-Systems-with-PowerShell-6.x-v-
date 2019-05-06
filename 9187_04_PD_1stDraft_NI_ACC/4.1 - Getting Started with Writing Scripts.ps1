Set-Location C:\
Clear-Host

Get-Process | Select-Object Name, Path -First 5

Clear-Host; Write-Host "First Command"; Write-Host "Second Command `n"; 


"1" | Foreach-Object {
  "This works"
}

"3" | ForEach-Object { "This too" } 

Clear-Host
get-process | select-object -first 1  #All lowercase

#Capitalization doesn't matter in cmdlets or variables.
Clear-Host
$lowercasevariable = Get-Process | Select-Object -first 1
$LOWERCASEVARIABLE 


#Intellisense examples - tab complete on variables
$CreateAVariable = ""
$CreateAVariable

#Alias suggestions
CLS 
Clear-Host

Get-ComputerInfo
Get-ComputerInfo -Property
Get-CimClass

function FunctionName (OptionalParameters) {
<#
.SYNOPSIS
  Short description
.DESCRIPTION
  Long description
.EXAMPLE
  PS C:\> <example usage>
  Explanation of what the example does
.INPUTS
  Inputs (if any)
.OUTPUTS
  Output (if any)
.NOTES
  General notes
#>  
}

function Verb-Noun {
  [CmdletBinding()]
  param (
    
  )
  
  begin {
  }
  
  process {
  }
  
  end {
  }
}

https://msdn.microsoft.com/en-us/library/dn896648.aspx

clear-host
Get-Help About_*PS1*

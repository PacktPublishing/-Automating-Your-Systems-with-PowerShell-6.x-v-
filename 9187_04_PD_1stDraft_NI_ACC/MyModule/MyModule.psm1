function Get-ModFile {
<#
.SYNOPSIS
  Gets all mod files
.DESCRIPTION
  Returns all files in the C:\Temp directory with a .MOD file extension
.EXAMPLE
  Get-ModFile
  Returns *.MOD files in the C:\Temp directory
#>
  Get-Childitem C:\temp\*.mod
}

function New-ModFile {
[string]$Name

  New-Item C:\Temp\$Name.MOD
}
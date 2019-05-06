Set-Location C:\
Clear-Host

#Creating a file
New-Item -ItemType File -Path "C:\temp\newfile.txt" -Value "Contents of the file" -Force
$tempFile = New-TemporaryFile 
$tempFile


#Copy a file
Copy-Item C:\temp\newfile.txt -Destination c:\temp2\newfile.txt -Force 
Copy-Item C:\temp -Destination C:\temp2 -Container -Recurse
#When copying folders, use the -Include or -Exclude to skip some files or only copy some files

#Moving a file
Move-Item C:\temp2 -Destination c:\temp3 -Force

#	- Checking if a file exists
Test-Path C:\temp2\newfile.txt 
$file = "C:\temp3\newfile.txt"
if (Test-Path $file) {"Set some great content" | Out-File $file -Append}

# - Getting content in and writing to a file
$dism = Get-Content C:\Windows\Logs\DISM\dism.log 
Get-Process | Select-Object -ExpandProperty Name | Set-Content C:\temp\processlist.txt
# - Append to an existing file with Tee-Object or Out-File
"Extra line of text" | Tee-Object -FilePath C:\temp\newfile.txt -Append
"Another line of text" | Out-File C:\temp\newfile.txt -Append
#Insert text into the currently opened file in the editor
Get-Service Spooler | Out-CurrentFile


# - Getting a file hash to verify consistency
$Hash = Get-FileHash C:\temp\logfile.log
"Add more content to change file" | Out-File C:\temp\logfile.log -Append
if ((Get-FileHash C:\temp\logfile.log).Hash -eq $Hash.Hash) { Write-Host "File is the same" -foregroundcolor Green }
else { Write-Host "File has changed" -ForegroundColor Green  }



# Use Get-Command to find commands that are installed and available
# Filter by name, or use -Noun, -Verb, or -Module parameters to find
# what you're looking for.
Get-Command 
Get-Command –Noun Process
Get-Command –Verb Start
Get-Command –Module PowerShellGet
Get-Command –Module PowerShellGet -Verb find

# Use Get-Help for information on how to use a command
# Use the -Online parameter to open the latest version in a browser
Get-Help  Find-Module 
# And use Update-Help occassionally to download the latest versions

# Use Get-Member to explore the properties and methods of an object
Get-Process 
Get-Process | Get-Member
Get-Process | Select-Object StartTime, Name, FileVersion, Path

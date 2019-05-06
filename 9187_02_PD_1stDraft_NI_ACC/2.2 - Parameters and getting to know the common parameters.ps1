# Create a few files
New-Item C:\temp\older.txt -Force –ItemType File
New-Item C:\temp\old.txt -Force –ItemType File
New-Item C:\temp\new.txt -Force –ItemType File

# How to keep the newest file and delete the older files

# A simple mistake - deleting the wrong files
Get-ChildItem C:\Temp | Sort-Object CreationTime | Select-Object -Skip 1 | Remove-Item -Whatif

# All fixed by sorting them correctly
Get-ChildItem C:\Temp | Sort-Object CreationTime -Descending | Select-Object -Skip 1 | Remove-Item -Whatif

# Using -Confirm to prompt before deletion
Get-ChildItem C:\Temp | Sort-Object CreationTime –Descending | Select-Object -Skip 1 | Remove-Item -Confirm

# Get details from the output by using the -Verbose command
Get-ChildItem C:\Temp | Sort-Object CreationTime –Descending | Select-Object -Skip 1 | Remove-Item -Verbose


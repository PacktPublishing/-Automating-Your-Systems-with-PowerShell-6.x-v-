Set-Location c:\
Clear-Host

$Spooler = Get-Service Spooler 
$Spooler

#Export object data as JSON file
$Spooler | ConvertTo-Json -Depth 1 | Out-File C:\temp\spooler.json 
CODE C:\temp\spooler.json 

 # More depth is more details but also longer running time to process.
$Spooler | ConvertTo-Json -Depth 6 | Out-File c:\temp\spooler-deep.json
CODE C:\temp\spooler-deep.json

# Converting back from JSON is also possible. If you've got JSON in a file, just use
$JsonContent = Get-Content C:\temp\spooler-deep.json -Raw
$PoShObjectFromJson = $JsonContent | ConvertFrom-Json
$PoShObjectFromJson | Select-Object Name, Description


# CSV files
$SomeServices = Get-Service -Exclude "TokenBroker" | Select-Object -first 3
$SomeServices | Export-Csv -Path C:\temp\services.csv 

CODE C:\temp\services.csv

# Importing from CSV is also possible
  $ImportedServices = Import-CSV C:\temp\services.csv
  $ImportedServices | Select-Object -First 1
  $SomeServices | Select-Object -First 1



# Another useful conversion is to HTML: 
$HTML = $SomeServices | ConvertTo-Html -Property "StartType", "Status", "DisplayName" -As "Table" -Title "Some Services" 
$HTML | Out-File C:\temp\Services.html 
Invoke-Item C:\temp\Services.html 

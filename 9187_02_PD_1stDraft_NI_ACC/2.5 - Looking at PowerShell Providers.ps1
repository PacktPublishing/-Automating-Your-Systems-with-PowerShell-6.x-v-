# A PSProvider is a higher level object type that has a heirchical structure
Get-PSProvider

# PSProviders can be represented as a drive, with familiar commands between them
Get-PSDrive 
Set-Location 'D:\'
Set-Location 'HKCU:\'

# Looking at the registry is easy
CD 'HKCU:\Control Panel\Colors'
Get-Item -Path .\
Get-ItemPropertyValue -Path .\ -Name InfoWindow


# Same commands, but slightly different based on the PSProvider
New-Item -Path HKCU:\Software\MyRegKey\Favorites\Color -ItemType String -Value "Blue" -Force 
New-Item -Path C:\temp\MyFavorites -Name Color.txt -ItemType File -Value "Blue" -Verbose -Force
 
New-PSDrive -Name MyRegKey -PSProvider Registry -Root HKCU:\Software\MyRegKey
New-PSDrive -Name Temp -PSProvider FileSystem -Root C:\Temp 

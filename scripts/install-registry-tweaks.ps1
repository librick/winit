$PersonalizePath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize'
# Use dark theme by default
New-ItemProperty -Path $PersonalizePath -Name SystemUsesLightTheme -Value 0 -Type Dword -Force
# Disable lockscreen picture (go right to login screen)
New-ItemProperty -Path $PersonalizePath -Name NoLockScreen -Value 1 -Type Dword -Force

# Show hidden files and folders
# See: https://devblogs.microsoft.com/powershell-community/how-to-update-or-add-a-registry-key-value-with-powershell/
# Set variables to indicate value and key to set
$HideFileExt_Path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
$HideFileExt_Name    = 'HideFileExt'
$Hidden_Name         = 'Hidden'
# Create the key if it does not exist
If (-NOT (Test-Path $HideFileExt_Path)) {
  New-Item -Path $HideFileExt_Path -Force | Out-Null
}
# Now set the values
New-ItemProperty -Path $HideFileExt_Path -Name $HideFileExt_Name -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path $HideFileExt_Path -Name $Hidden_Name -Value 1 -PropertyType DWORD -Force

# Disable dynamic search
$DynamicSearch_Path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings'
$DynamicSearch_Name = 'IsDynamicSearchBoxEnabled'
New-ItemProperty -Path $DynamicSearch_Path -Name $DynamicSearch_Name -Value 0 -Type Dword -Force

# Delete the recycle bin desktop shortcut
$RecycleBin_Path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\645FF040-5081-101B-9F08-00AA002F954E'
Remove-Item -Path $RecycleBin_Path –Recurse -Force

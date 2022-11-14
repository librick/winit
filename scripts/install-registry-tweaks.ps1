$PersonalizePath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize'
# Use dark theme by default
New-ItemProperty -Path $PersonalizePath -Name SystemUsesLightTheme -Value 0 -Type Dword -Force
# Disable lockscreen picture (go right to login screen)
New-ItemProperty -Path $PersonalizePath -Name NoLockScreen -Value 1 -Type Dword -Force

# Show hidden files and folders
# See: https://devblogs.microsoft.com/powershell-community/how-to-update-or-add-a-registry-key-value-with-powershell/
# Set variables to indicate value and key to set
$RegistryPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
$HideFileExt_Name    = 'HideFileExt'
$HideFileExt_Value   = '00000000'
$Hidden_Name         = 'Hidden'
$Hidden_Value        = '00000001'
# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}
# Now set the values
New-ItemProperty -Path $RegistryPath -Name $HideFileExt_Name -Value $HideFileExt_Value -PropertyType DWORD -Force
New-ItemProperty -Path $RegistryPath -Name $Hidden_Name -Value $Hidden_Value -PropertyType DWORD -Force
New-ItemProperty -Path $PersonalizePath -Name SystemUsesLightTheme -Value 0 -Type Dword -Force
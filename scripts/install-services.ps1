# Disable any services that we installed
$OpenVPNServiceName = 'OpenVPNServiceInteractive'
Stop-Service -Name $OpenVPNServiceName
Set-Service -Name $OpenVPNServiceName -StartupType Disabled
# Delete KeePassXC startup key
$KeepassXC_Path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'
$KeepassXC_Name = 'KeePassXC'
Remove-ItemProperty -Path $KeepassXC_Path -Name $KeepassXC_Name -Force

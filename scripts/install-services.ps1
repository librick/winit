# Disable any services that we installed
$OpenVPNServiceName = 'OpenVPNServiceInteractive'
$service = Get-Service -Name W32Time -ErrorAction SilentlyContinue
if ($service.Length -gt 0) {
    Stop-Service -Name $OpenVPNServiceName
    Set-Service -Name $OpenVPNServiceName -StartupType Disabled
}
# Delete OpenVPN-GUI startup key
$OpenVPN_Path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'
$OpenVPN_Name = 'OpenVPN-GUI'
$OpenVPN_Exists = Get-ItemProperty $OpenVPN_Path $OpenVPN_Name -ErrorAction SilentlyContinue
if (-NOT ($OpenVPN_Exists -eq $null) -or ($OpenVPN_Exists.Length -eq 0)) {
    Remove-ItemProperty -Path $OpenVPN_Path -Name $OpenVPN_Name -Force
}
# Delete KeePassXC startup key
$KeepassXC_Path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'
$KeepassXC_Name = 'KeePassXC'
$KeepassXC_Exists = Get-ItemProperty $KeepassXC_Path $KeepassXC_Name -ErrorAction SilentlyContinue
if (-NOT ($KeepassXC_Exists -eq $null) -or ($KeepassXC_Exists.Length -eq 0)) {
    Remove-ItemProperty -Path $KeepassXC_Path -Name $KeepassXC_Name -Force
}

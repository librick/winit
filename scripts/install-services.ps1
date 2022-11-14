# Disable any services that we installed
$OpenVPNServiceName = 'OpenVPNServiceInteractive'
$service = Get-Service -Name W32Time -ErrorAction SilentlyContinue
if ($service.Length -gt 0) {
    Stop-Service -Name $OpenVPNServiceName
    Set-Service -Name $OpenVPNServiceName -StartupType Disabled
}

# Delete KeePassXC startup key
$KeepassXC_Path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'
$KeepassXC_Name = 'KeePassXC'
Remove-ItemProperty -Path $KeepassXC_Path -Name $KeepassXC_Name -Force

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
if ((Get-Item -Path $OpenVPN_Path).GetValue($OpenVPN_Name) -ne $null) {
    Remove-ItemProperty -Path $OpenVPN_Path -Name $OpenVPN_Name -Force
}
# Delete KeePassXC startup key
$KeepassXC_Path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'
$KeepassXC_Name = 'KeePassXC'
if ((Get-Item -Path $KeepassXC_Path).GetValue($KeepassXC_Name) -ne $null) {
    Remove-ItemProperty -Path $KeepassXC_Path -Name $KeepassXC_Name -Force
}
# Add shortcut for syncthing
cp "C:\winit\res\syncthing.exe.lnk" "${home}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

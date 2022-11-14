# Disable any services that we installed
$OpenVPNServiceName = 'OpenVPNServiceInteractive'
$service = Get-Service -Name W32Time -ErrorAction SilentlyContinue
if ($service.Length -gt 0) {
    Stop-Service -Name $OpenVPNServiceName
    Set-Service -Name $OpenVPNServiceName -StartupType Disabled
}
# Add shortcut for syncthing
$src = "C:\winit\res\syncthing.exe.lnk"
$dst = "${home}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
Copy-Item -Force $src $dst

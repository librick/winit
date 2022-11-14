# Disable any services that we installed
$OpenVPNServiceName = 'OpenVPNServiceInteractive'
Stop-Service -Name $OpenVPNServiceName
Set-Service -Name $OpenVPNServiceName -StartupType Disabled

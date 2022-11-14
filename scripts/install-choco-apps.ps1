function ChocoInstall() {
  [CmdletBinding()]
  param (
      [Parameter(Mandatory=$true, Position=0)]
      [string] $PackageName
  )
  $existing = choco search -r --local-only --id-only --exact $PackageName
  if ($existing -ne $null and $existing.Length -gt 0) {
    Write-Host "choco package ${existing} is already installed, skipping (searched for ${PackageName})"
        -ForegroundColor green -BackgroundColor black;
  } else {
    choco install -r -y $PackageName
  }
}
# Sysinternals
choco install -r -y sysinternals --params "/InstallDir:C:\Tools\sysinternals"
# Miscellaneous
ChocoInstall brave
ChocoInstall 7zip
ChocoInstall bleachbit
ChocoInstall blender
ChocoInstall chocolateygui
ChocoInstall cmder
ChocoInstall deluge
ChocoInstall gimp
ChocoInstall keepassxc
ChocoInstall libreoffice-still
ChocoInstall openvpn
ChocoInstall putty
ChocoInstall rufus
ChocoInstall sumatrapdf
ChocoInstall syncthing
ChocoInstall vlc
ChocoInstall winscp

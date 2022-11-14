class ChocoHelper {
    static [bool]IsInstalled([string]$PackageName) {
        $existing = choco search -r --local-only --id-only --exact $PackageName;
        return $existing -ne $null -and $existing.Length -gt 0;
    }
    static LogInstalled([string]$PackageName) {
        Write-Host "choco package ${PackageName} is already installed, skipping" `
            -ForegroundColor green -BackgroundColor black;
    }
}

function ChocoInstall() {
  [CmdletBinding()]
  param (
      [Parameter(Mandatory=$true, Position=0)]
      [string] $PackageName
  )
  if ([ChocoHelper]::IsInstalled($PackageName)) {
    [ChocoHelper]::LogInstalled($PackageName);
  } else {
    choco install -r -y $PackageName
  }
}

function InstallSysInternals() {
    $PackageName = "sysinternals"
    if ([ChocoHelper]::IsInstalled($PackageName)) {
        [ChocoHelper]::LogInstalled($PackageName);
    } else {
      choco install -r -y $PackageName --params "/InstallDir:C:\Tools\sysinternals"
    }
}

# Sysinternals
InstallSysInternals
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

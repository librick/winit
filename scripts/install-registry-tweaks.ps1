# Set common registry keys/values
# See: https://devblogs.microsoft.com/powershell-community/how-to-update-or-add-a-registry-key-value-with-powershell/

function RegPropIfItemExists() {
  [CmdletBinding()]
  param (
      [Parameter(Mandatory=$true, Position=0)]
      [string] $Path,
      [Parameter(Mandatory=$true, Position=1)]
      [string] $Name,
      [Parameter(Mandatory=$true, Position=2)]
      $Value
  )
  if ((Get-Item -Path $Path).GetValue($Value) -ne $null) {
    Write-Host "wrote value ${Value} to ${Path} under ${Name}" -ForegroundColor green -BackgroundColor black
    New-ItemProperty -Path $Path -Name $Name -Value $Value -Type Dword -Force
  } else {
    Write-Host "found existing ItemProperty in ${Path} under ${Name}, skipped New-ItemProperty call" -ForegroundColor yellow -BackgroundColor black
    Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type Dword -Force
    Write-Host "wrote value ${Value} to ${Path} under ${Name}" -ForegroundColor green -BackgroundColor black
  }
}

function DelPropIfItemExists() {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$true, Position=0)]
    [string] $Path,
    [Parameter(Mandatory=$true, Position=1)]
    [string] $Name
  )
  if ((Get-Item -Path $Path).GetValue($Name) -ne $null) {
    Remove-ItemProperty -Path $Path -Name $Name -Force
    Write-Host "removed ItemProperty at path ${Path} under ${Name}" -ForegroundColor green -BackgroundColor black
  } else {
    Write-Host "no ItemProperty at ${Path} under ${Name}, skipped Remove-ItemProperty call" -ForegroundColor yellow -BackgroundColor black
  }
}

function RegProp() {
  [CmdletBinding()]
  param (
      [Parameter(Mandatory=$true, Position=0)]
      [string] $Path,
      [Parameter(Mandatory=$true, Position=1)]
      [string] $Name,
      [Parameter(Mandatory=$true, Position=2)]
      $Value
  )
  If (-NOT (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
  }
  RegPropIfItemExists $Path $Name $Value
}

function DelItemIfItemExists() {
  [CmdletBinding()]
  param (
      [Parameter(Mandatory=$true, Position=0)]
      [string] $Path
  )
  If (Test-Path $Path) {
    Remove-Item -Path $Path -Recurse -Force
    Write-Host "removed item at path ${Path}" -ForegroundColor green -BackgroundColor black
  } else {
    Write-Host "no item at path ${Path}, skipped Remove-Item call" -ForegroundColor green -BackgroundColor black
  }
}

RegPropIfItemExists 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' 'SystemUsesLightTheme' 0; # Force dark theme
RegPropIfItemExists 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' 'NoLockScreen' 1; # Disable lock screen, go right to login
RegProp 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' 'HideFileExt' 0; # Show hidden files and folders
RegProp 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' 'Hidden' 1;
RegPropIfItemExists 'HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings' 'IsDynamicSearchBoxEnabled' 0; # Disable dynamic search
RegPropIfItemExists 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Start\HideTaskViewButton' 'value' 1; # Hide the task view button in the taskbar
RegPropIfItemExists 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' 'TaskbarMn' 0; # Hide the chat/teams icon in the taskbar
RegPropIfItemExists 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' 'TaskbarDa' 0; # Hide widgets in the taskbar
DelItemIfItemExists 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}'; # Delete recycle bin desktop shortcut
RegPropIfItemExists 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' 'SearchboxTaskbarMode' 0; # Hide the search input in the taskbar
# Delete startup keys
DelPropIfItemExists 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' 'OpenVPN-GUI'
DelPropIfItemExists 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' 'KeePassXC'

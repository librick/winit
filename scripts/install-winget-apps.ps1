# Install important software with winget

function WingetInstall() {
  [CmdletBinding()]
  param (
      [Parameter(Mandatory=$true, Position=0)]
      [string] $PackageName
  )
  winget install `
    --exact `
    --accept-package-agreements `
    --accept-source-agreements `
    --source winget `
    --id $PackageName;
}

winget source update
# Use the--source option to prevent
# winget from trying to use the "msstore" source.
WingetInstall 'Git.Git'
WingetInstall 'OpenVPNTechnologies.OpenVPN'
WingetInstall 'Microsoft.VisualStudioCode'
WingetInstall 'Mozilla.Firefox'
WingetInstall 'Google.Chrome'
WingetInstall 'Valve.Steam'
WingetInstall 'Spotify.Spotify'
WingetInstall 'OO-Software.ShutUp10'

# Run other scripts
C:\winit\scripts\install-registry-tweaks.ps1
#C:\winit\scripts\install-quick-access.ps1
C:\winit\scripts\install-wallpapers.ps1

# Disable chocolatey confirmation prompts
choco feature enable -n=allowGlobalConfirmation
# Remove existing choco packages that might cause conflicts
# TODO: Check if these exist first
#choco uninstall -y openvpn
#choco uninstall -y vscode vscode.installer
#choco uninstall -y firefox
#choco uninstall -y chrome
#choco uninstall -y steam-client
#choco uninstall -y sysinternals
# Install important software with winget
winget source update
winget install -e --id Git.Git
winget install -e --id OpenVPNTechnologies.OpenVPN
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Mozilla.Firefox
winget install -e --id Google.Chrome
winget install -e --id Valve.Steam
winget install -e --id Spotify.Spotify
winget install -e --id OO-Software.ShutUp10
# Install toolsroot
mkdir C:\Tools
choco install -r -y toolsroot
# Sysinternals
choco install -r -y sysinternals --params "/InstallDir:C:\Tools\sysinternals"
# Miscellaneous
choco install -r -y brave
choco install -r -y 7zip
choco install -r -y 7zip.install
choco install -r -y bleachbit
choco install -r -y bleachbit.install
choco install -r -y blender
choco install -r -y chocolateygui
choco install -r -y cmder
choco install -r -y deluge
choco install -r -y gimp
choco install -r -y keepassxc
choco install -r -y libreoffice-still
choco install -r -y openvpn
choco install -r -y putty
choco install -r -y rufus
choco install -r -y sumatrapdf
choco install -r -y sumatrapdf.install
choco install -r -y syncthing
choco install -r -y vlc
choco install -r -y vlc.install
choco install -r -y winscp
choco install -r -y winscp.install

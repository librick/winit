

# Allow scripts:
# Set-ExecutionPolicy Bypass -Scope Process
# Install git with winget:
# winget install --id Git.Git -e --source winget

# Install important software with winget
winget install -e --id BraveSoftware.BraveBrowser
winget install -e --id OpenVPNTechnologies.OpenVPN
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Mozilla.Firefox
winget install -e --id Google.Chrome

# Disable confirmation prompts
choco feature enable -n=allowGlobalConfirmation
# Install toolsroot
mkdir C:\Tools
choco install toolsroot
# Sysinternals
choco install sysinternals --params "/InstallDir:C:\Tools\sysinternals"
# Miscellaneous
choco install 7zip
choco install 7zip.install
choco install bleachbit
choco install bleachbit.install
choco install blender
choco install chocolatelygui
choco install cmder
choco install deluge
choco install gimp
choco install keepassxc
choco install libreoffice-still
choco install openvpn
choco install putty
choco install rufus
choco install sumatrapdf
choco install sumatrapdf.install
choco install syncthing
choco install vlc
choco install vlc.install
choco install winscp
choco install winscp.install

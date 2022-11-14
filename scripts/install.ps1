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


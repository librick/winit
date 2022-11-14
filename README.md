## Installation scripts for Windows 11

Install "App Installer" from Microsoft Store


Run Powershell as admin, CD into C:\  
`cd C:\`  
Install git with native package manager winget  
`winget install --id Git.Git -e --source winget`  
Install chocolatey  
`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`  
Clone this repo  
`git clone https://github.com/librick/winit.git`  
Change directories into the repo  
`cd winit`  
Run the scripts

### Additional steps
- Change default apps
    - Settings > Apps > Brave
    - Settings > Apps > VLC media player

## Misc. Notes
Use sysinternals `Procmon.exe` to check which registry keys a program is accessing.  
Use sysinternals `Autoruns.exe` to get info about startup programs.  

# Install software packages
winget install --id Git.Git --exact --silent
winget install --id JanDeDobbeleer.OhMyPosh --exact --silent
winget install --id Microsoft.VisualStudioCode --exact --silent
winget install --id Microsoft.WindowsTerminal --exact --silent
winget install --id Microsoft.PowerShell --exact --silent
winget install --id Microsoft.WSL --exact --silent
winget install --id Canva.Affinity --exact --silent
winget install --id Anthropic.Claude --exact --silent

# Install VSCode extensions
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode-remote.remote-containers

# Copy configuration files for OhMyPosh
$documentsFolder = [System.Environment]::GetFolderPath('MyDocuments')
$powerShellProfilePath = Join-Path $documentsFolder "/PowerShell"
New-Item -ItemType Directory -Path $powerShellProfilePath -Force | Out-Null
Copy-Item -Path "configuration/profile.ps1" -Destination $powerShellProfilePath

# Copy the default git configuration
Copy-Item -Path "configuration/.gitconfig" -Destination $env:userprofile

# Copy the default windows terminal configuration
$windowsTerminalConfig = (Get-ChildItem "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal*\LocalState\settings.json").FullName
Copy-Item "configuration/windows-terminal/settings.json" $windowsTerminalConfig

# Copy the default vscode config
Copy-Item "configuration/vs-code/settings.json" "$env:APPDATA\Code\User\settings.json"
# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Enable WSL support
Enable-WindowsOptionalFeature -Online -FeatureName $("VirtualMachinePlatform", "Microsoft-Windows-Subsystem-Linux")

# Install software packages
winget install --id Docker.DockerDesktop --silent
winget install --id DominikReichl.KeePass --silent
winget install --id Git.Git --silent
winget install --id JanDeDobbeleer.OhMyPosh --silent
winget install --id Microsoft.VisualStudioCode --silent
winget install --id Microsoft.WindowsTerminal --silent
winget install --id Microsoft.WindowsPowershell --silent
winget install --id TransIP.STACK --silent
winget install --id OpenJS.NodeJS --silent

# Install VSCode extensions
code --install-extension ms-vscode.PowerShell
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension dbaeumer.vscode-eslint
code --install-extension ritwickdey.liveserver

# Copy configuration files for OhMyPosh
Copy-Item -Path "configuration/.rfverbruggen.omp.json" -Destination $env:userprofile
Copy-Item -Path "configuration/profile.ps1" -Destination "$($env:userprofile)\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

# Copy the default git configuration
Copy-Item -Path "configuration/.gitconfig" -Destination $env:userprofile

# Ensure the script can run with elevated privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as an Administrator!"
    break
}

# Function to test internet connectivity
function Test-InternetConnection {
    try {
        # $testConnection = 
        Test-Connection -ComputerName www.google.com -Count 1 -ErrorAction Stop
        return $true
    }
    catch {
        Write-Warning "Internet connection is required but not available. Please check your connection."
        return $false
    }
}

# Check for internet connectivity before proceeding
if (-not (Test-InternetConnection)) {
    break
}

### ------ SECTION TO TEST -------- ###

# Define the program name
$programName = "Visual Studio Code"
$wingetPackageName = "Microsoft.VisualStudioCode"

# Check if the program is installed
$programInstalled = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*$programName*" }

if ($programInstalled) {
    Write-Host "$programName is already installed."
} else {
    Write-Host "$programName is not installed. Attempting to install..."
    winget install $wingetPackageName
}

# USING ARRAYS
# Define an array of program names and their corresponding winget package names
$programs = @(
    @{Name = "Visual Studio Code"; WingetName = "Microsoft.VisualStudioCode"},
    @{Name = "Google Chrome"; WingetName = "Google.Chrome"}
    # Add more programs as needed
)

foreach ($program in $programs) {
    # Check if the program is installed
    $programInstalled = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*$($program.Name)*" }

    if ($programInstalled) {
        Write-Host "$($program.Name) is already installed."
    } else {
        Write-Host "$($program.Name) is not installed. Attempting to install..."
        winget install $($program.WingetName)
    }
}


# CREATING shortcuts and pin to start menu
$TargetFile = "C:\Path\To\Application.exe"
$ShortcutFile = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\YourApplicationName.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()


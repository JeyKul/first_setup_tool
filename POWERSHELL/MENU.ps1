# Codepage UTF-8 für Umlaute
chcp 65001

# Farben
$bgColor = "Black"
$menuColor = "DarkGray"
$titleColor = "Gray"
$highlightColor = "White"

# Pfad zu BAT-Skripten


$scriptPath = ".\BAT"
$PSscriptPath = ".\POWERSHELL"

Set-Location -Path $PSScriptRoot\..

function Show-Menu {
    Clear-Host
    $host.UI.RawUI.BackgroundColor = $bgColor
    $host.UI.RawUI.ForegroundColor = $titleColor
    Clear-Host


    Write-Host "                                             " -ForegroundColor DarkBlue
    Write-Host "                                             " -ForegroundColor DarkBlue
    Write-Host "                                             " -ForegroundColor DarkBlue
    Write-Host "               Placeholder :)                " -ForegroundColor DarkBlue
    Write-Host "                                             " -ForegroundColor DarkBlue
    Write-Host "                                             " -ForegroundColor DarkBlue
    Write-Host "                                             " -ForegroundColor DarkBlue
    Write-Host ""
    Write-Host ""
    Write-Host ""              
    Write-Host "---------------Ersteinrichtung---------------" -ForegroundColor $titleColor
    Write-Host "1. Business customer (execs 3, 4, 5, 6 and 8)" -ForegroundColor $menuColor
    Write-Host "2. Private customer (execs 3, 4, 5, 7 and 8)" -ForegroundColor $menuColor
    Write-Host "---------------------------------------------" -ForegroundColor $titleColor
    Write-Host "3. Rename PC" -ForegroundColor $menuColor
    Write-Host "4. Update Winget" -ForegroundColor $menuColor
    Write-Host "5. Install Default Programs" -ForegroundColor $menuColor
    Write-Host "6. Install TeamViewer Business customer " -ForegroundColor $menuColor
    Write-Host "7. Install TeamViewer Private customer" -ForegroundColor $menuColor
    Write-Host "8. Search for Updates (Windows 11)" -ForegroundColor $menuColor
    Write-Host "9. Useful Tools" -ForegroundColor $menuColor
    Write-Host "19. Sysprep Setup OOBE" -ForegroundColor $menuColor
    Write-Host "-----------------------------------------------" -ForegroundColor $titleColor
    Write-Host "0. Exit" -ForegroundColor $highlightColor
    Write-Host
}

function Handle-Choice {
    param($choice)
    switch ($choice) {
        "1" {
            # Geschäftskunde: Umbenennen, Standardprogramme, TV GK, Updates
            powercfg -change -standby-timeout-ac 0
            powercfg -change -standby-timeout-dc 0
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\WINGET_UPDATE.ps1"
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\RENAME.ps1"
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\STANDARTPROGRAMME.ps1"
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\TV_GK.ps1"
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\CHECK_UPDATE.ps1"
        }
        "2" {
            # Privatkunde: Umbenennen, Standardprogramme, TV PK, Updates
            powercfg -change -standby-timeout-ac 180
            powercfg -change -standby-timeout-dc 180
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\WINGET_UPDATE.ps1"
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\RENAME.ps1"
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\STANDARTPROGRAMME.ps1"
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\TV_PK.ps1"
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\CHECK_UPDATE.ps1"
        }
        "4" {
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\WINGET_UPDATE.ps1"
        }
        "5" {
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\STANDARTPROGRAMME.ps1"
        }
        "3" {
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\RENAME.ps1"
        }
        "6" {
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\TV_GK.ps1"
        }
        "7" {
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\TV_PK.ps1"
        }
        "8" {
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\CHECK_UPDATE.ps1"
        }
        "9" {
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\TOOLS.ps1"
        }
        "19"{
            powershell.exe -command "$env:windir\System32\Sysprep\sysprep.exe /oobe /reboot /unattend:$PSScriptPath\unattend.xml"
        }
        "0" {
            exit
        }
        default {
            Write-Host "`nInvalid selection. Try again." -ForegroundColor "Red"
            Start-Sleep -Seconds 2
        }
    }
}

# Hauptloop
do {
    Show-Menu
    $choice = Read-Host "Please Select a Option (1-9)"
    Handle-Choice $choice
} while ($true)

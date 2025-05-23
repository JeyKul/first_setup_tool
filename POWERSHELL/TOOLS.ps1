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
    Write-Host "---------------------TOOLS---------------------" -ForegroundColor $titleColor
    Write-Host "1. Delete Explorer Cache" -ForegroundColor $menuColor
    Write-Host "2. Delete Iconthumb Cache" -ForegroundColor $menuColor
    Write-Host "3. Delete Task Cache" -ForegroundColor $menuColor
    Write-Host "4. WinDirStat" -ForegroundColor $menuColor
    Write-Host "5. AdvancedIPScanner" -ForegroundColor $menuColor
    Write-Host "6. Lenovo Treiber stuff" -ForegroundColor $menuColor
    Write-Host "7. " -ForegroundColor $menuColor
    Write-Host "8. Search Updates (Windows 11)" -ForegroundColor $menuColor
    Write-Host "9. Chris Titus Script" -ForegroundColor $menuColor
    Write-Host "-----------------------------------------------" -ForegroundColor $titleColor
    Write-Host "0. Exit" -ForegroundColor $highlightColor
    Write-Host
}

function Handle-Choice {
    param($choice)
    switch ($choice) {
        "1" {
            cmd.exe "$scriptPath\explorercachelöschen.bat"
        }
        "2" {
            cmd.exe "$scriptPath\iconthumbcachelöschen.bat"
        }
        "3" {
            cmd.exe "$scriptPath\Taskcachelöschen.bat"
        }
        "4" {
            start ".\EXE\WinDirStat.exe"
        }
        "5" {
            start ".\EXE\AdvancedIPScanner\advanced_ip_scanner.exe"
        }
        "6" {
            start ".\EXE\LENOVO\"
        }
        "7" {
            
        }
        "8" {
            powershell.exe -ExecutionPolicy Bypass -File "$PSScriptPath\CHECK_UPDATE.ps1"
        }
        "9" {
            irm "https://christitus.com/win" | iex
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

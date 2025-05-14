param (
    [string]$NewName
)

if (-not $NewName) {
    $NewName = Read-Host "Enter the new computer name"
}

$currentName = $env:COMPUTERNAME

if ($currentName -eq $NewName) {
    Write-Host "The computer is already named '$NewName'." -ForegroundColor Yellow
    exit
}

Rename-Computer -NewName $NewName -Force
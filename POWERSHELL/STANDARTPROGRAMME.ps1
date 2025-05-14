$apps = @(
    @{ Name = "VLC Media Player"; Id = "VideoLAN.VLC" },
    @{ Name = "7-Zip Zstandard";  Id = "mcmilk.7zip-zstd" },
    @{ Name = "Mozilla Firefox";  Id = "Mozilla.Firefox" }
)

foreach ($app in $apps) {
    Write-Host "Installing $($app.Name)..." -ForegroundColor Cyan
    $result = winget install --id=$($app.Id) --accept-package-agreements --accept-source-agreements

    if ($LASTEXITCODE -eq 0) {
        Write-Host "$($app.Name) installed successfully.`n" -ForegroundColor Green
    } else {
        Write-Host "Failed to install $($app.Name). Error details:" -ForegroundColor Red
        Write-Host $result -ForegroundColor DarkRed
        Write-Host ""
    }
}

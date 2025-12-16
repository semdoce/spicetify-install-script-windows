# $Path = [Environment]::GetFolderPath('ApplicationData') + '\spicetify'
# if (Test-Path -Path $Path) {

$Path = Join-Path $env:APPDATA 'Spotify'
if (!(Test-Path -Path $Path)) {
    Write-Host "Spotify is not installed on this system." -ForegroundColor Red
    Write-Host "Downloading Official Spotify..." -ForegroundColor Cyan
    $spotifyInstaller = "$env:TEMP\SpotifyFullSetup.exe"
    Invoke-WebRequest -Uri "https://download.scdn.co/SpotifyFullSetup.exe" -OutFile $spotifyInstaller
    Write-Host "Installing Spotify..." -ForegroundColor Cyan
    Start-Process -FilePath $spotifyInstaller -Wait
    Write-Host "Spotify installed!" -ForegroundColor Green
    exit
}

Write-Host "Closing Spotify..." -ForegroundColor Yellow
Stop-Process -Name spotify -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2
if (Get-Command spicetify -ErrorAction SilentlyContinue) {
    # if exists "spicetify" on windows binary files, then upgrade and restore backup
    Write-Host " [script success]" -ForegroundColor Green -NoNewline
    Write-Host "  Spicetify exists. Upgrading and applying backup. " 
    Start-Sleep -Seconds 2
    spicetify upgrade

    Write-Host " [script success]" -ForegroundColor Green -NoNewline
    Write-Host "  Spicetify was upgraded, now it is restarting. Please wait! ~" 
    Start-Sleep -Seconds 2
    spicetify restore

    if ($LASTEXITCODE -eq 0) {
        Write-Host " [script success]" -ForegroundColor Green -NoNewline
        Write-Host "  Spotify will now restart with your previous settings!" 
        Start-Sleep -Seconds 2
    }
    else {
        Write-Host " [script attention]" -ForegroundColor Yellow -NoNewline 
        Write-Host "  An error occurred during restore. Clearing Spicetify installation and applying backup again."
        Start-Sleep -Seconds 2
        spicetify clear
    }
    spicetify backup apply
}
else {
    Write-Host " [script attention]" -ForegroundColor Yellow -NoNewline 
    Write-Host "  Spicetify does not exist. Installing Spicetify..." -ForegroundColor Yellow
    Start-Sleep -Seconds 2
    iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex
}

Write-Host "[script end]  See ya! ~" -ForegroundColor Cyan
Start-Sleep -Seconds 4
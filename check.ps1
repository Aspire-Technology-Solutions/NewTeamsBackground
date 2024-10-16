if (test-path "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads\TeamsBackground.png") {
Write-Host "Teams Background Found"
exit 0
}
else {
    exit 1
}
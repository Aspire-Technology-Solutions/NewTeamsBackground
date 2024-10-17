if (test-path "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads\66053900-762a-4251-869b-44288c4a276f.png") {
Write-Host "Teams Background Found"
exit 0
}
else {
    exit 1
}

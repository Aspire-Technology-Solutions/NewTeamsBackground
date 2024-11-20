Param(
[Parameter(Mandatory=$true)]
[ValidateSet("Install", "Uninstall")]
[String[]]
$Mode
)
# Author: Warren Sherwen
# Verison: 1.3

# Defines the log file location.
$Logfile = "$env:windir\Temp\Logs\TeamsBackground.log"
# LogWrite Function.
Function LogWrite{
   Param ([string]$logstring)
   Add-content $Logfile -value $logstring
   write-output $logstring
}

function Get-TimeStamp {
	return "[{0:dd/MM/yy} {0:HH:mm:ss}]" -f (Get-Date)
}

if (!(Test-Path "$env:LOCALAPPDATA\Temp\Logs\")){
	   mkdir $env:LOCALAPPDATA\Temp\Logs
	   LogWrite "$(Get-TimeStamp): Teams background script has started."
	   LogWrite "$(Get-TimeStamp): Log directory created."
	}
	else{
		LogWrite "$(Get-TimeStamp): Teams background script has started."
		LogWrite "$(Get-TimeStamp): Log directory exists."
	}

If ($Mode -eq "Install") {
	if (!(Test-Path "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds")){
	   mkdir $env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds
	   LogWrite "$(Get-TimeStamp): Backgrounds folder created."
	}
	if (!(Test-Path "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads")){
	   mkdir $env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads
	   LogWrite "$(Get-TimeStamp): Uploads folder created."
	}

LogWrite "$(Get-TimeStamp): Teams Image file is copying."
copy ".\data\66053900-762a-4251-869b-44288c4a276f.png" "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads\66053900-762a-4251-869b-44288c4a276f.png" -Force
copy ".\data\66053900-762a-4251-869b-44288c4a276f_thumb.png" "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads\66053900-762a-4251-869b-44288c4a276f_thumb.png" -Force
LogWrite "$(Get-TimeStamp): Teams Image file has copied."
LogWrite "$(Get-TimeStamp): Teams background script exiting."
Exit
}

If ($Mode -eq "Uninstall") {
LogWrite "$(Get-TimeStamp): Teams Image file is deleting."
del "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads\66053900-762a-4251-869b-44288c4a276f.png"  -Force
del "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads\66053900-762a-4251-869b-44288c4a276f_thumb.png"  -Force
LogWrite "$(Get-TimeStamp): Teams Image file has been deleted."
LogWrite "$(Get-TimeStamp): Teams background script exiting."
Exit
}

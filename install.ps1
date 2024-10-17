	Param(
	[Parameter(Mandatory=$true)]
	[ValidateSet("Install", "Uninstall")]
	[String[]]
	$Mode
	)
	# Author: Warren Sherwen
	# Verison: 1.1

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

	if (!(Test-Path "$env:windir\Temp\Logs\"))
	{
	   mkdir $env:windir\Temp\Logs
	   LogWrite "$(Get-TimeStamp): Teams background script has started."
	   LogWrite "$(Get-TimeStamp): Log directory created."
	}
	else
	{
		LogWrite "$(Get-TimeStamp): Teams background script has started."
		LogWrite "$(Get-TimeStamp): Log directory exists."
	}


If ($Mode -eq "Install") {
LogWrite "$(Get-TimeStamp): Teams Image file is copying."
copy ".\data\Teams Background.png" "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads\66053900-762a-4251-869b-44288c4a276f.png" -Force
copy ".\data\Teams Background.png" "$env:LOCALAPPDATA\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads\66053900-762a-4251-869b-44288c4a276f_thumb.png" -Force
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

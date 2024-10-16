# New Teams Background Image
Application designed, to allow the creation and setting of backgrounds for New Teams where Teams Premium is not used, via Microsoft Intune. 

## Background
As Micorosoft Teams, does not support defining the background images via policy unless you have Teams Premium based licensing; you can either:
- Define the images via Intune Script,
- Win32 App

The drawback to using a script, is:
- they only run once, (remedidiation scripts can rerun, but require enhanced licneses)
- the offer poor reporting vs Intune Apps,
- the offer no verison controlling,
- the images have to be saved in a shared location, often Azure files leading to costs,
- As the script runs once, and often results in a copy to the local drive; simply updating the image isn't enough and the script needs rerun,
- or you could use remote load, but loss of internet connectivty conuld impact this,
- MS may change the upload folder location, and a script limits our abiliity to move this with ease while a Win32 app allows verison change.

The benefits to use a Win32 App, is that it addresses the above chllanges and offers greater control around delivery. 

## Requirements
- Windows 10 +
- 10MB of Disk Space
- Microsoft Intune
- New Microsost Teams

## Instructions

1. Extract the powershell script and assests folder for the background app to the C:\TeamsBackgroundApp\
2. Open the Assets folder,
3. Replace the current Teams Background image with your preferred image (retaining the name) with your coporate background using the .jpg format as well the same names,
4. Package the application via the Microsoft Win32 Content Prep from https://go.microsoft.com/fwlink/?linkid=2065730
5. Extract the Microsoft Win32 Content Prep tool,
6. Open CMD using Administrator elevation
7. Open the Microsoft Win32 Content Prep tool via CMD,
8. Define the setup folder as "C:\TeamsBackgroundApp",
9. Define the setup file as "C:\TeamsBackgroundApp\install.ps1",
10. Define the output location to "C:\TeamsBackgroundApp",
11. Open, intune.microsoft.com
12. Select Apps | Windows
13. Select add
14. Select Windows App (win32)
15. Select the intune package just created under C:\TeamsBackgroundApp\
16. Define the following settings:
-- Name: Teams Branding
-- Description: Teams branding deployment application.
-- Publisher: Aspire Technology Solutions
-- App Verison: 1.0 (increase by one, for each new package update) - this is important, so the app can run the uninstall and install commands correctly to apply any new updates.
-- Owner: Aspire Technology Solutions
17. Select next
18. Define the following values:
-- Install Command: powershell.exe -ExecutionPolicy Bypass -file install.ps1 -Mode Install
-- Uninstall command: powershell.exe -ExecutionPolicy Bypass -file install.ps1 -Mode Uninstall
-- Installation time required (mins): 5
-- Allow available uninstall: No
-- Install behavior: User
-- Device restart behavior: Determine behavior based on return codes
19. Select next
20. Define the following values:
-- Operating system architecture: x86,x64
-- Minimum operating system: Windows 10 1607
-- Disk space required (MB): 10MB
21. Select next
22. Define the following values:
-- Set the detection type to script, then upload the check script found with this app.
24. Select next
25. Define the scope for delivery to All Users (or amend to your requirements)
26. Review and finish

## Consideration
As a consideration for delivery, you could set New Teams (if deployed via Intune) as a dependant applicaiton, meaning this app will only attempt delivery after it has been installed; ensuring no app install failures during Autopilot/in general. We would recommend this step, for smoother deliveries.
Should the upload folder change directories in the future, the scropt may need amending to reflect this location.

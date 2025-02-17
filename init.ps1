##########
# Windows Initial Setup Script
# Author: Glowstudent
# Version: 1.0
##########

# Get elevated permissions if required
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
	Exit
}

Write-Host "Changing Power Plan..."
powercfg /X monitor-timeout-ac 30
powercfg /X monitor-timeout-dc 45
powercfg /X standby-timeout-ac 0
powercfg /X standby-timeout-dc 0

Write-Host "Uninstalling applications..."
Get-AppxPackage "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage
Get-AppxPackage “Microsoft.Office.Desktop” | Remove-AppxPackage
Get-AppxPackage "Microsoft.Office.OneNote" | Remove-AppxPackage
Get-AppxPackage "5A894077.McAfeeSecurity" | Remove-AppPackage

$taskName = "DisableWindows11Telemetry"
$actionScript = @"
reg add "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
"@

$trigger = New-ScheduledTaskTrigger -AtStartup

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -NonInteractive -Command $actionScript"

$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries

Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action -Settings $settings

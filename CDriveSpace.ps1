function Show-MainMenu {
    $Title = "C: Drive Capacity"
    $Question = "Choose your C: drive capacity."
    $UserChoices = @(
    New-Object System.Management.Automation.Host.ChoiceDescription "&1. 256 GB", "256 GB C: drive"
    New-Object System.Management.Automation.Host.ChoiceDescription "&2. 512 GB", "512 GB C: drive"
    New-Object System.Management.Automation.Host.ChoiceDescription "&3. 1 TB", "1 TB C: drive"
    New-Object System.Management.Automation.Host.ChoiceDescription "&4. Exit", "Exit"
    )
    $UserDecision = $Host.UI.PromptForChoice($Title, $Question, $UserChoices, 0)
    return $UserDecision
}

function Drive256GB {
    $Threshold = 50 
    $Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
    $UsedSpaceGB = [Math]::Round(($Disk.Size - $Disk.FreeSpace) / 1GB, 2)
    $FreeSpaceGB = [Math]::Round($Disk.FreeSpace / 1GB, 2)
    Write-Host "C: Drive used space: $UsedSpaceGB GB"

    if ($FreeSpaceGB -lt $Threshold) {
        Write-Host "Warning: Running low of disk space. Current free space is $FreeSpaceGB GB. Please consider clearing up space soon."
    } else {
        Write-Host "You still have sufficient drive space. Current free space is $FreeSpaceGB GB."
    }
}

function Drive512GB {
    $Threshold = 80
    $Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
    $UsedSpaceGB = [Math]::Round(($Disk.Size - $Disk.FreeSpace) / 1GB, 2)
    $FreeSpaceGB = [Math]::Round($Disk.FreeSpace / 1GB, 2)
    Write-Host "C: Drive used space: $UsedSpaceGB GB"

    if ($FreeSpaceGB -lt $Threshold) {
        Write-Host "Warning: Running low of disk space. Current free space is $FreeSpaceGB GB. Please consider clearing up space soon."
    } else {
        Write-Host "You still have sufficient drive space. Current free space is $FreeSpaceGB GB."
    }
}

function Drive1TB {
    $Threshold = 120 
    $Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
    $UsedSpaceGB = [Math]::Round(($Disk.Size - $Disk.FreeSpace) / 1GB, 2)
    $FreeSpaceGB = [Math]::Round($Disk.FreeSpace / 1GB, 2)
    Write-Host "C: Drive used space: $UsedSpaceGB GB"

    if ($FreeSpaceGB -lt $Threshold) {
        Write-Host "Warning: Running low of disk space. Current free space is $FreeSpaceGB GB. Please consider clearing up space soon."
    } else {
        Write-Host "You still have sufficient drive space. Current free space is $FreeSpaceGB GB."
    }
}

do {
    $UserDecision = Show-MainMenu

    switch ($UserDecision) {
        0 {
            Drive256GB
        }
        1 {
            Drive512GB
        }
        2{
            Drive1TB
        }
        3 {
            Exit
        }
    }
 } until ($UserDecision -eq 3)
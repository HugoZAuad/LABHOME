[CmdletBinding()]
param(
    [Parameter()]
    [string]$ManagerAddress,

    [Parameter()]
    [int[]]$Ports = @(1514, 1515, 443)
)

$ErrorActionPreference = 'Stop'

$result = [ordered]@{
    TimestampUtc = (Get-Date).ToUniversalTime().ToString('o')
    ComputerName = $env:COMPUTERNAME
    PowerShellVersion = $PSVersionTable.PSVersion.ToString()
    OperatingSystem = [System.Environment]::OSVersion.VersionString
    LogicalProcessors = [System.Environment]::ProcessorCount
    MemoryGiB = $null
    VirtualizationFirmwareEnabled = $null
    Disks = @()
    ManagerAddress = $ManagerAddress
    Connectivity = @()
}

if ($IsWindows -or $PSVersionTable.PSEdition -eq 'Desktop') {
    $computer = Get-CimInstance Win32_ComputerSystem
    $processor = Get-CimInstance Win32_Processor | Select-Object -First 1
    $result.MemoryGiB = [math]::Round($computer.TotalPhysicalMemory / 1GB, 1)
    $result.VirtualizationFirmwareEnabled = $processor.VirtualizationFirmwareEnabled
    $result.Disks = @(Get-Volume | Where-Object DriveLetter | ForEach-Object {
        [ordered]@{
            Drive = [string]$_.DriveLetter
            SizeGiB = [math]::Round($_.Size / 1GB, 1)
            FreeGiB = [math]::Round($_.SizeRemaining / 1GB, 1)
        }
    })
}

if ($ManagerAddress) {
    foreach ($port in $Ports) {
        $test = Test-NetConnection -ComputerName $ManagerAddress -Port $port -WarningAction SilentlyContinue
        $result.Connectivity += [ordered]@{
            Port = $port
            TcpSucceeded = $test.TcpTestSucceeded
            RemoteAddress = [string]$test.RemoteAddress
        }
    }
}

[pscustomobject]$result | ConvertTo-Json -Depth 4

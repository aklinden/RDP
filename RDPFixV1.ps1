function Restart-RDP {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string] $ComputerName
    )
    $rdpTcp = qwinsta | Select-String "rdp-tcp"
if ($rdpTcp -eq $null) {

    Get-Service -Name TermService | Restart-Service -Force
}
}
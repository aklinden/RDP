function Restart-RDP {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string] $ComputerName
    )

    Invoke-Command -ComputerName $ComputerName -ScriptBlock {
        $rdpTcp = qwinsta | Select-String "rdp-tcp"
        if ($null -eq $rdpTcp) {
            Write-Warning -Message "No RDP client detected, restarting RDP service..."
            Get-Service -Name TermService | Restart-Service -Force
        }
        else{
            Write-Host "RDP client found, no changes needed."
        }
    }
    
}
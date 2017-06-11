Function Export-PlasterManifest
{
    [CmdletBinding()]
    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Mandatory = $true,
            Position = 0
        )]
        [string]
        $Manifest,

        [Parameter(
            ValueFromPipelineByPropertyName = $true,
            Mandatory = $true,
            Position = 1
        )]
        [string]
        $Destination,

        [Parameter(
            ValueFromPipelineByPropertyName = $true,
            Position = 2
        )]
        [string]
        $Endcoding = 'default',

        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [switch]
        $PassThru
    )

    Out-File -FilePath $Destination -InputObject $Manifest -Encoding $Endcoding 
    
    if($PassThru)
    {
        Get-Item -Path $Destination
    }

}
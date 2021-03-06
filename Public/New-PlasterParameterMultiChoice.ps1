Function New-PlasterParameterMultiChoice
{
    [CmdletBinding()]
    param(
        [Parameter(
            ValueFromPipeline = $true,
            Mandatory = $true,
            Position = 0
        )]
        [string]
        $Name,

        [Parameter(
            ValueFromPipeline = $true,
            Position = 1
        )]
        [string]
        $Prompt,

        [Parameter(
            ValueFromPipeline = $true,
            Position = 2
        )]
        [string]
        $Default,

        [Parameter(
            ValueFromPipeline = $true
        )]
        [ValidateSet('Text','Encrypted')]
        [string]
        $Store,

        [Parameter(
            ValueFromPipeline = $true,
            Mandatory = $true,
            Position = 0
        )]
        [scriptblock]
        $ScriptBlock
    )

    New-PlasterParameterBaseChoice -ChoiceType "multichoice" @PSBoundParameters
}

New-Alias -Name MultiChoice -Value New-PlasterParameterMultiChoice
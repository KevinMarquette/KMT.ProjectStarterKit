function New-KmtProject
{
    <#
        .Synopsis
        Creates a new PowerShell Project

        .Example
        New-KmtProject -Name MyProject

        .Notes
        
    #>
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # Root location of the module project
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $Path,

        # Name of module
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string]
        $Name
    )

    process
    {
        try
        {
            $plaster = @{
                TemplatePath = "$PSModuleRoot\Templates\KTM.StandardModule"
                NoLogo = $true
                ModuleName = $Name
            }
            if($PSBoundParameters.Path)
            {
                $plaster['DestinationPath'] = $Path
            }

            if($PSCmdlet.ShouldProcess($path))
            {
                Invoke-Plaster @plaster
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}

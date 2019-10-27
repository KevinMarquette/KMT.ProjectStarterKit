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

        # Name of the project
        [Alias('ProjectName')]
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string]
        $Name,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $Author,

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Company = '',

        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Description = 'A new PowerShell project'
    )

    process
    {
        try
        {
            $plaster = @{
                TemplatePath    = "$PSModuleRoot\Templates\KTM.StandardModule"
                NoLogo          = $true
                ModuleName      = $Name
                Author          = $Author
                Company         = $Company
                Description     = $Description
                DestinationPath = $Path
            }

            if ($PSCmdlet.ShouldProcess($path))
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

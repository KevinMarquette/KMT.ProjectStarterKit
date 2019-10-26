function New-KmtModule
{
    <#
        .Synopsis
        Creates a new module

        .Example
        New-KMTModule -Name MyModule

        .Notes
        
    #>
    [cmdletbinding()]
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
            New-Item -Path $Path -ItemType Directory -ErrorAction Ignore
            Copy-Item -Path $PSModuleRoot\Templates\KTM.StandardModule\* -Destination $Path -Recurse
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }

    end
    {

    }
}

if(Test-Path $PSScriptRoot\Imports)
{
    "Adding [Imports] to module path"
    $env:PSModulePath = "$PSScriptRoot\Imports", $env:PSModulePath -join ';'
}

if( -not (Get-Module KMT.ModuleBuilder -ListAvailable))
{
    "Installing module [KMT.ModuleBuilder]"
    $module = Find-Module KMT.ModuleBuilder | 
        Select-Object -First 1
    
    $module | Install-Module -Scope CurrentUser
}

"Building module at [$PSScriptRoot]"
Build-KmtModule -Path $PSScriptRoot -Verbose
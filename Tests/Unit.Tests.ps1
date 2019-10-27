Describe 'Unit Tests' -Tag Build {
    BeforeAll {
        Push-Location TestDrive:
    }
    AfterAll {
        Pop-Location
    }

    It 'New-KmtProject should create a new module'  {
        New-KmtProject -Path ($pwd) -Name TestModule -Author TestAuthor
    }
}

Import-Module Pester -Force

Write-ActionInfo "Running from [$($PSScriptRoot)]"

#see https://pester-docs.netlify.app/docs/commands/New-PesterConfiguration
$configuration = [PesterConfiguration]@{
    Run          = @{
        Path = './tests'
    }
    CodeCoverage = @{
        Enabled      = $true
        Path         = "*.psm1"
        OutputFormat = 'JaCoCo'
        OutputPath   = 'coverage/coverage.xml'

    }
    TestResult   = @{
        Enabled      = $true
        OutputFormat = 'NUnitXml'
        OutputPath   = 'testresults/testResults.xml'
    }
    Should       = @{
        ErrorAction = 'Stop'
    }

    Output       = @{
        Verbosity = 'Detailed'
    }

}

Invoke-Pester -Configuration $configuration

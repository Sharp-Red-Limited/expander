BeforeAll {

    Import-Module ./Expander.psm1 -Force

}

AfterAll {
    Get-ChildItem -Path ./output | Remove-Item -Recurse -Force
}

Describe 'Expand a Zip' {
    It 'Checks there is an output folder' {
        ExpandMyZip
        "./output" | Should -Exist
        "./output/1.pdf" | Should -Exist
        "./output/2.pdf" | Should -Exist
    }

}

Describe 'Get-Planets' {
    It 'Given no parameters, it lists all 8 planets' {
        $allPlanets = GetPlanet
        $allPlanets.Count | Should -Be 8
    }
    It 'Earth is the third planet in our Solar System' {
        $allPlanets = GetPlanet
        $allPlanets[2].Name | Should -Be 'Earth'
    }

    It 'Pluto is not part of our Solar System' {
        $allPlanets = GetPlanet
        $plutos = $allPlanets | Where-Object Name -EQ 'Pluto'
        $plutos.Count | Should -Be 0
    }

    It 'Planets have this order: Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune' {
        $allPlanets = GetPlanet
        $planetsInOrder = $allPlanets.Name -join ', '
        $planetsInOrder | Should -Be 'Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune'
    }
}


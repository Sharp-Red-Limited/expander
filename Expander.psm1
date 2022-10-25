<#
.SYNOPSIS
 Doesn't do very much
.DESCRIPTION
 This is where you would show a description if your module did anything useful
.PARAMETER  Name
 The name of a planet
.EXAMPLE
 # Lists all of the planets
 GetPlanet
.EXAMPLE
 # Lists Earth
 GetPlanet -Name "Earth"
#>
function ExpandMyZip {
    Expand-Archive -Path ./Archive.zip -DestinationPath ./output -Force
}
function GetPlanet ([string]$Name = '*') {
    $planets = @(
        @{ Name = 'Mercury' }
        @{ Name = 'Venus' }
        @{ Name = 'Earth' }
        @{ Name = 'Mars' }
        @{ Name = 'Jupiter' }
        @{ Name = 'Saturn' }
        @{ Name = 'Uranus' }
        @{ Name = 'Neptune' }
    ) | ForEach-Object { [PSCustomObject] $_ }

    $planets | Where-Object { $_.Name -like $Name }
}

Export-ModuleMember -Function *

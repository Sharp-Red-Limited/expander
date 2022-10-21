$b = Get-Date
Write-Output "Check starts at $b"
$fileHash = Get-FileHash -LiteralPath "./files.json" -Algorithm "SHA256" | Select-Object -ExpandProperty Hash
$fileHash2 = Get-FileHash -LiteralPath "./files2.json" -Algorithm "SHA256" | Select-Object -ExpandProperty Hash
$test = $fileHash -eq $fileHash2



if ( $test -eq $false) {
    $json1 = Get-Content "./files.json" | ConvertFrom-Json

    $json2 = Get-Content "./files2.json" | ConvertFrom-Json

    Compare-Object -ReferenceObject $json1 -DifferenceObject $json2 -Property file, hash

    $b = Get-Date
    Write-Output "Check ended at $b"
}
else {
    Write-Output "files are the same"
}

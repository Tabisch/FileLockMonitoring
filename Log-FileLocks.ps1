Param(
[String]
$Path = "D:\",
[Switch]
$Continuous,
[String]
$OutputFile = "fileLocks.txt"
)

$fileLocks = @()

$count = 0

$Error.Clear()

do
{
    $count++

    Write-Host "Run:" $count

    $fileLocks += @(.\Get-FileLocksDirectory.ps1 -Path $Path)

    $fileLocks = @($fileLocks | Sort-Object -Property * -Unique)

    if($Error)
    {
        Write-Host $Error
        break
    }

    $fileLocks | ConvertTo-Csv | Out-File $OutputFile

}while($Continuous)
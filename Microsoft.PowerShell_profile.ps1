Set-Alias rm C:\Users\Joey\scoop\shims\rm.exe
Set-Alias find C:\Users\Joey\scoop\apps\findutils\current\bin\find.exe
Set-Alias convert C:\Users\Joey\scoop\apps\imagemagick\current\convert.exe
Set-Alias ls C:\Users\Joey\bin\ls.ps1
function .. { Set-Location ".." }
function ... { Set-Location "../.." }
function .... { Set-Location "../../.." }
function ..... { Set-Location "../../../.." }

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

function prompt {
    Write-Host "$($env:username)@$(hostname) " -ForegroundColor Green -NoNewLine
    Write-Host "$(Get-Location) `$" -ForegroundColor Blue -NoNewLine
    return ' '
}

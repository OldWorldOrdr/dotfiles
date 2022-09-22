Set-Alias rm C:\Users\Joey\scoop\shims\rm.exe
Set-Alias find C:\Users\Joey\scoop\apps\findutils\current\bin\find.exe
Set-Alias convert C:\Users\Joey\scoop\apps\imagemagick\current\convert.exe
Set-Alias ls C:\Users\Joey\bin\ls.ps1
function .. { Set-Location ".." }
function ... { Set-Location "../.." }

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

$ESC = [char]27

function prompt {"$ESC[94m$(Get-Location) $ $ESC[0m"}

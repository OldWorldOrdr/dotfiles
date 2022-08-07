Set-Alias -Name rm -Value C:\Users\Joey\scoop\shims\rm.exe
Set-Alias -Name find -Value C:\Users\Joey\scoop\apps\findutils\current\bin\find.exe
Set-Alias -Name convert -Value C:\Users\Joey\scoop\apps\imagemagick\current\convert.exe
Set-Alias -Name ls -Value C:\Users\Joey\bin\ls.ps1
function .. { Set-Location ".." }
function ... { Set-Location "../.." }

$ESC = [char]27

function prompt {"$ESC[94m$(Get-Location) $ $ESC[m"}

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

clear
pfetch

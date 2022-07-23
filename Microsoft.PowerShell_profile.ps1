oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\bubblewritten.omp.json" | Invoke-Expression

clear
pfetch

Set-Alias -Name rm -Value C:\Users\Joey\scoop\shims\rm.exe
Set-Alias -Name ls -Value C:\Users\Joey\bin\ls.bat
Set-Alias -Name convert -Value C:\Users\Joey\scoop\apps\imagemagick\current\convert.exe
Set-Alias -Name find -Value C:\Users\Joey\scoop\apps\findutils\current\bin\find.exe

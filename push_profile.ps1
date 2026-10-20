$git = "C:\Users\Nisarga Gowda\.gemini\antigravity-ide\scratch\mingit\cmd\git.exe"
if (-not (Test-Path $git)) { $git = "git" }
$dir = $PSScriptRoot
if (-not $dir) { $dir = $pwd.Path }
$url = "https://github.com/tanmayikt98-coder/tanmayikt98-coder.git"

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " Pushing GitHub Profile README to: tanmayikt98-coder" -ForegroundColor Cyan
Write-Host " Target: $url" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan

if (-not (Test-Path "$dir\.git")) {
    & $git -C $dir init
}

& $git -C $dir config user.email "tanmayikt98@gmail.com"
& $git -C $dir config user.name "Tanmayi K T"

& $git -C $dir remote remove origin 2>$null
& $git -C $dir remote add origin $url
& $git -C $dir branch -M main

Write-Host "`nStaging profile files..." -ForegroundColor Yellow
& $git -C $dir add -A
& $git -C $dir commit -m "Update GitHub profile README and avatar" 2>$null

Write-Host "`nExecuting: git push origin main --force..." -ForegroundColor Yellow
& $git -C $dir push origin main --force

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n==================================================" -ForegroundColor Green
    Write-Host " [SUCCESS] GitHub Profile successfully updated!" -ForegroundColor Green
    Write-Host " View Your Profile: https://github.com/tanmayikt98-coder" -ForegroundColor Green
    Write-Host "==================================================" -ForegroundColor Green
} else {
    Write-Host "`n--------------------------------------------------" -ForegroundColor Yellow
    Write-Host " If push failed, make sure you created the special repo at:" -ForegroundColor Yellow
    Write-Host " https://github.com/new with name: tanmayikt98-coder" -ForegroundColor Cyan
    Write-Host " And add 'tejas448866' as collaborator if using that Windows login." -ForegroundColor Cyan
    Write-Host "--------------------------------------------------" -ForegroundColor Yellow
}
pause

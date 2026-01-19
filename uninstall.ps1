# =========================================
# AI Context Uninstall Script
# =========================================
# 지원 OS: Windows (PowerShell)
# Linux/macOS 사용자는 uninstall.sh를 사용하세요.
# =========================================

# 현재 프로젝트 루트 디렉토리
$PROJECT_ROOT = Get-Location

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "AI Context 제거 스크립트" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "프로젝트 루트: $PROJECT_ROOT"
Write-Host "=========================================" -ForegroundColor Cyan

# 제거할 항목 확인
Write-Host ""
Write-Host "다음 항목을 제거합니다:"
Write-Host "  - CLAUDE.md"
Write-Host "  - .ai-instructions\"
Write-Host "  - .claude\"
Write-Host ""

# 사용자 확인
$confirm = Read-Host "계속하시겠습니까? (y/N)"
if ($confirm -ne "y" -and $confirm -ne "Y") {
    Write-Host "취소되었습니다." -ForegroundColor Yellow
    exit 0
}

Write-Host ""

# CLAUDE.md 제거
$claudeMd = Join-Path $PROJECT_ROOT "CLAUDE.md"
if (Test-Path $claudeMd) {
    Remove-Item -Path $claudeMd -Force
    Write-Host "  ✓ CLAUDE.md 제거됨" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  CLAUDE.md 없음, 건너뜀" -ForegroundColor Yellow
}

# .ai-instructions 제거
$instructionsDir = Join-Path $PROJECT_ROOT ".ai-instructions"
if (Test-Path $instructionsDir) {
    Remove-Item -Path $instructionsDir -Force -Recurse
    Write-Host "  ✓ .ai-instructions\ 제거됨" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  .ai-instructions\ 없음, 건너뜀" -ForegroundColor Yellow
}

# .claude 제거
$claudeDir = Join-Path $PROJECT_ROOT ".claude"
if (Test-Path $claudeDir) {
    Remove-Item -Path $claudeDir -Force -Recurse
    Write-Host "  ✓ .claude\ 제거됨" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  .claude\ 없음, 건너뜀" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "제거 완료!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

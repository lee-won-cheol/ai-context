# =========================================
# AI Context Setup Script
# =========================================
# 지원 OS: Windows (PowerShell)
# Linux/macOS 사용자는 setup.sh를 사용하세요.
# 주의: 관리자 권한으로 실행해야 합니다.
# =========================================

# AI Context 중앙 저장소 경로 설정
$AI_CONTEXT_PATH = if ($env:AI_CONTEXT_PATH) { $env:AI_CONTEXT_PATH } else { $PSScriptRoot }

# 현재 프로젝트 루트 디렉토리
$PROJECT_ROOT = Get-Location

# OS 정보 감지
$OS_NAME = if ($IsWindows -or $env:OS -eq "Windows_NT") {
    "Windows $([System.Environment]::OSVersion.Version.Major)"
} elseif ($IsMacOS) {
    "macOS"
} elseif ($IsLinux) {
    "Linux"
} else {
    "Unknown"
}

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "AI Context 설정 스크립트" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "OS: $OS_NAME"
Write-Host "중앙 저장소 경로: $AI_CONTEXT_PATH"
Write-Host "프로젝트 루트: $PROJECT_ROOT"
Write-Host "=========================================" -ForegroundColor Cyan

# CLAUDE.md 심볼릭 링크 생성 (프로젝트 루트에)
Write-Host ""
Write-Host "Creating symbolic link for CLAUDE.md..." -ForegroundColor Yellow
$CLAUDE_SOURCE = Join-Path $AI_CONTEXT_PATH "CLAUDE.md"
if (Test-Path $CLAUDE_SOURCE) {
    $target = Join-Path $PROJECT_ROOT "CLAUDE.md"
    if (Test-Path $target) {
        Write-Host "  ⚠️  CLAUDE.md already exists, skipping..." -ForegroundColor Yellow
    } else {
        try {
            New-Item -ItemType SymbolicLink -Path $target -Target $CLAUDE_SOURCE | Out-Null
            Write-Host "  ✓ Linked CLAUDE.md" -ForegroundColor Green
        } catch {
            Write-Host "  ✗ Failed to create link for CLAUDE.md : $_" -ForegroundColor Red
        }
    }
} else {
    Write-Host "  ⚠️  Warning: $CLAUDE_SOURCE not found" -ForegroundColor Yellow
}

# 지침 파일 심볼릭 링크 생성
Write-Host ""
Write-Host "Creating symbolic links for instructions..." -ForegroundColor Yellow
$INSTRUCTIONS_DIR = Join-Path $PROJECT_ROOT ".ai-instructions"
New-Item -ItemType Directory -Force -Path $INSTRUCTIONS_DIR | Out-Null
$INSTRUCTIONS_SOURCE = Join-Path $AI_CONTEXT_PATH "instructions"
if (Test-Path $INSTRUCTIONS_SOURCE) {
    Get-ChildItem -Path $INSTRUCTIONS_SOURCE -Filter "*.md" | ForEach-Object {
        $filename = $_.Name
        $target = Join-Path $INSTRUCTIONS_DIR $filename
        if (Test-Path $target) {
            Write-Host "  ⚠️  $filename already exists, skipping..." -ForegroundColor Yellow
        } else {
            try {
                New-Item -ItemType SymbolicLink -Path $target -Target $_.FullName | Out-Null
                Write-Host "  ✓ Linked instruction: $filename" -ForegroundColor Green
            } catch {
                Write-Host "  ✗ Failed to create link for $filename : $_" -ForegroundColor Red
            }
        }
    }
} else {
    Write-Host "  ⚠️  Warning: $INSTRUCTIONS_SOURCE directory not found" -ForegroundColor Yellow
}

# 트러블슈팅 폴더 심볼릭 링크 생성
Write-Host ""
Write-Host "Creating symbolic links for troubleshooting..." -ForegroundColor Yellow
$TROUBLESHOOTING_DIR = Join-Path $PROJECT_ROOT ".ai-troubleshooting"
New-Item -ItemType Directory -Force -Path $TROUBLESHOOTING_DIR | Out-Null
$TROUBLESHOOTING_SOURCE = Join-Path $AI_CONTEXT_PATH "troubleshooting"
if (Test-Path $TROUBLESHOOTING_SOURCE) {
    # 하위 폴더 링크
    Get-ChildItem -Path $TROUBLESHOOTING_SOURCE -Directory | ForEach-Object {
        $folder_name = $_.Name
        $target = Join-Path $TROUBLESHOOTING_DIR $folder_name
        if (Test-Path $target) {
            Write-Host "  ⚠️  $folder_name already exists, skipping..." -ForegroundColor Yellow
        } else {
            try {
                New-Item -ItemType SymbolicLink -Path $target -Target $_.FullName | Out-Null
                Write-Host "  ✓ Linked troubleshooting: $folder_name" -ForegroundColor Green
            } catch {
                Write-Host "  ✗ Failed to create link for $folder_name : $_" -ForegroundColor Red
            }
        }
    }
    # _INDEX.md, _TEMPLATE.md 등 루트 파일 링크
    Get-ChildItem -Path $TROUBLESHOOTING_SOURCE -Filter "*.md" -File | ForEach-Object {
        $filename = $_.Name
        $target = Join-Path $TROUBLESHOOTING_DIR $filename
        if (Test-Path $target) {
            Write-Host "  ⚠️  $filename already exists, skipping..." -ForegroundColor Yellow
        } else {
            try {
                New-Item -ItemType SymbolicLink -Path $target -Target $_.FullName | Out-Null
                Write-Host "  ✓ Linked troubleshooting: $filename" -ForegroundColor Green
            } catch {
                Write-Host "  ✗ Failed to create link for $filename : $_" -ForegroundColor Red
            }
        }
    }
} else {
    Write-Host "  ⚠️  Warning: $TROUBLESHOOTING_SOURCE directory not found" -ForegroundColor Yellow
}

# 스펙 폴더 심볼릭 링크 생성
Write-Host ""
Write-Host "Creating symbolic links for specs..." -ForegroundColor Yellow
$SPECS_DIR = Join-Path $PROJECT_ROOT ".ai-specs"
New-Item -ItemType Directory -Force -Path $SPECS_DIR | Out-Null
$SPECS_SOURCE = Join-Path $AI_CONTEXT_PATH "specs"
if (Test-Path $SPECS_SOURCE) {
    Get-ChildItem -Path $SPECS_SOURCE -Filter "*.md" | ForEach-Object {
        $filename = $_.Name
        $target = Join-Path $SPECS_DIR $filename
        if (Test-Path $target) {
            Write-Host "  ⚠️  $filename already exists, skipping..." -ForegroundColor Yellow
        } else {
            try {
                New-Item -ItemType SymbolicLink -Path $target -Target $_.FullName | Out-Null
                Write-Host "  ✓ Linked spec: $filename" -ForegroundColor Green
            } catch {
                Write-Host "  ✗ Failed to create link for $filename : $_" -ForegroundColor Red
            }
        }
    }
} else {
    Write-Host "  ⚠️  Warning: $SPECS_SOURCE directory not found" -ForegroundColor Yellow
}

# Claude Skills 폴더 심볼릭 링크 생성
Write-Host ""
Write-Host "Creating symbolic links for Claude skills..." -ForegroundColor Yellow
$CLAUDE_SKILLS_DIR = Join-Path $PROJECT_ROOT ".claude\skills"
New-Item -ItemType Directory -Force -Path $CLAUDE_SKILLS_DIR | Out-Null
$SKILLS_SOURCE = Join-Path $AI_CONTEXT_PATH "skills"
if (Test-Path $SKILLS_SOURCE) {
    Get-ChildItem -Path $SKILLS_SOURCE -Directory | ForEach-Object {
        $skill_name = $_.Name
        $target = Join-Path $CLAUDE_SKILLS_DIR $skill_name
        if (Test-Path $target) {
            Write-Host "  ⚠️  $skill_name already exists, skipping..." -ForegroundColor Yellow
        } else {
            try {
                New-Item -ItemType SymbolicLink -Path $target -Target $_.FullName | Out-Null
                Write-Host "  ✓ Linked skill: $skill_name" -ForegroundColor Green
            } catch {
                Write-Host "  ✗ Failed to create link for $skill_name : $_" -ForegroundColor Red
            }
        }
    }
} else {
    Write-Host "  ⚠️  Warning: $SKILLS_SOURCE directory not found" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "설정 완료!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "생성된 링크:"
Write-Host "  - CLAUDE.md: $PROJECT_ROOT\CLAUDE.md"
Write-Host "  - Instructions: $INSTRUCTIONS_DIR"
Write-Host "  - Troubleshooting: $TROUBLESHOOTING_DIR"
Write-Host "  - Specs: $SPECS_DIR"
Write-Host "  - Claude Skills: $CLAUDE_SKILLS_DIR"
Write-Host ""
Write-Host "Cursor 사용자: 설정에서 'Include CLAUDE.md in context'를 활성화하세요." -ForegroundColor Yellow
Write-Host ""

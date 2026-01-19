#!/bin/bash
# =========================================
# AI Context Uninstall Script
# =========================================
# 지원 OS: Linux, macOS, Git Bash, WSL
# Windows 사용자는 uninstall.ps1을 사용하세요.
# =========================================

# 현재 프로젝트 루트 디렉토리
PROJECT_ROOT="$(pwd)"

echo "========================================="
echo "AI Context 제거 스크립트"
echo "========================================="
echo "프로젝트 루트: $PROJECT_ROOT"
echo "========================================="

# 제거할 항목 확인
echo ""
echo "다음 항목을 제거합니다:"
echo "  - CLAUDE.md"
echo "  - .ai-instructions/"
echo "  - .claude/"
echo ""

# 사용자 확인
read -p "계속하시겠습니까? (y/N): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "취소되었습니다."
    exit 0
fi

echo ""

# CLAUDE.md 제거
if [ -e "$PROJECT_ROOT/CLAUDE.md" ]; then
    rm -f "$PROJECT_ROOT/CLAUDE.md"
    echo "  ✓ CLAUDE.md 제거됨"
else
    echo "  ⚠️  CLAUDE.md 없음, 건너뜀"
fi

# .ai-instructions 제거
if [ -d "$PROJECT_ROOT/.ai-instructions" ]; then
    rm -rf "$PROJECT_ROOT/.ai-instructions"
    echo "  ✓ .ai-instructions/ 제거됨"
else
    echo "  ⚠️  .ai-instructions/ 없음, 건너뜀"
fi

# .claude 제거
if [ -d "$PROJECT_ROOT/.claude" ]; then
    rm -rf "$PROJECT_ROOT/.claude"
    echo "  ✓ .claude/ 제거됨"
else
    echo "  ⚠️  .claude/ 없음, 건너뜀"
fi

echo ""
echo "========================================="
echo "제거 완료!"
echo "========================================="
echo ""

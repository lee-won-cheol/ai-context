#!/bin/bash
# =========================================
# AI Context Setup Script
# =========================================
# 지원 OS: Linux, macOS, Git Bash, WSL
# Windows 사용자는 setup.ps1을 사용하세요.
# =========================================

# AI Context 중앙 저장소 경로 설정
AI_CONTEXT_PATH="${AI_CONTEXT_PATH:-$HOME/ai-context}"

# 현재 스크립트의 디렉토리 경로 (스크립트가 있는 위치)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# AI_CONTEXT_PATH가 설정되지 않았거나 상대 경로인 경우, 스크립트 디렉토리 기준으로 설정
if [[ ! "$AI_CONTEXT_PATH" =~ ^/ ]]; then
    AI_CONTEXT_PATH="$SCRIPT_DIR"
fi

# 현재 프로젝트 루트 디렉토리 (setup.sh가 실행되는 위치)
PROJECT_ROOT="$(pwd)"

# OS 정보 감지
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS_NAME="macOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_NAME="Linux"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    OS_NAME="Windows (Git Bash)"
else
    OS_NAME="$OSTYPE"
fi

echo "========================================="
echo "AI Context 설정 스크립트"
echo "========================================="
echo "OS: $OS_NAME"
echo "중앙 저장소 경로: $AI_CONTEXT_PATH"
echo "프로젝트 루트: $PROJECT_ROOT"
echo "========================================="

# CLAUDE.md 심볼릭 링크 생성 (프로젝트 루트에)
echo ""
echo "Creating symbolic link for CLAUDE.md..."
if [ -f "$AI_CONTEXT_PATH/CLAUDE.md" ]; then
    target="$PROJECT_ROOT/CLAUDE.md"
    if [ -e "$target" ]; then
        echo "  ⚠️  CLAUDE.md already exists, skipping..."
    else
        ln -sf "$AI_CONTEXT_PATH/CLAUDE.md" "$target"
        echo "  ✓ Linked CLAUDE.md"
    fi
else
    echo "  ⚠️  Warning: $AI_CONTEXT_PATH/CLAUDE.md not found"
fi

# 지침 파일 심볼릭 링크 생성
echo ""
echo "Creating symbolic links for instructions..."
INSTRUCTIONS_DIR="$PROJECT_ROOT/.ai-instructions"
mkdir -p "$INSTRUCTIONS_DIR"
if [ -d "$AI_CONTEXT_PATH/instructions" ]; then
    for file in "$AI_CONTEXT_PATH/instructions"/*.md; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            target="$INSTRUCTIONS_DIR/$filename"
            if [ -e "$target" ]; then
                echo "  ⚠️  $filename already exists, skipping..."
            else
                ln -sf "$file" "$target"
                echo "  ✓ Linked instruction: $filename"
            fi
        fi
    done
else
    echo "  ⚠️  Warning: $AI_CONTEXT_PATH/instructions directory not found"
fi

# 트러블슈팅 폴더 심볼릭 링크 생성
echo ""
echo "Creating symbolic links for troubleshooting..."
TROUBLESHOOTING_DIR="$PROJECT_ROOT/.ai-troubleshooting"
mkdir -p "$TROUBLESHOOTING_DIR"
if [ -d "$AI_CONTEXT_PATH/troubleshooting" ]; then
    # 하위 폴더 링크
    for ts_dir in "$AI_CONTEXT_PATH/troubleshooting"/*; do
        if [ -d "$ts_dir" ]; then
            folder_name=$(basename "$ts_dir")
            target="$TROUBLESHOOTING_DIR/$folder_name"
            if [ -e "$target" ]; then
                echo "  ⚠️  $folder_name already exists, skipping..."
            else
                ln -sf "$ts_dir" "$target"
                echo "  ✓ Linked troubleshooting: $folder_name"
            fi
        fi
    done
    # _INDEX.md, _TEMPLATE.md 등 루트 파일 링크
    for ts_file in "$AI_CONTEXT_PATH/troubleshooting"/*.md; do
        if [ -f "$ts_file" ]; then
            filename=$(basename "$ts_file")
            target="$TROUBLESHOOTING_DIR/$filename"
            if [ -e "$target" ]; then
                echo "  ⚠️  $filename already exists, skipping..."
            else
                ln -sf "$ts_file" "$target"
                echo "  ✓ Linked troubleshooting: $filename"
            fi
        fi
    done
else
    echo "  ⚠️  Warning: $AI_CONTEXT_PATH/troubleshooting directory not found"
fi

# 스펙 폴더 심볼릭 링크 생성
echo ""
echo "Creating symbolic links for specs..."
SPECS_DIR="$PROJECT_ROOT/.ai-specs"
mkdir -p "$SPECS_DIR"
if [ -d "$AI_CONTEXT_PATH/specs" ]; then
    for spec_file in "$AI_CONTEXT_PATH/specs"/*.md; do
        if [ -f "$spec_file" ]; then
            filename=$(basename "$spec_file")
            target="$SPECS_DIR/$filename"
            if [ -e "$target" ]; then
                echo "  ⚠️  $filename already exists, skipping..."
            else
                ln -sf "$spec_file" "$target"
                echo "  ✓ Linked spec: $filename"
            fi
        fi
    done
else
    echo "  ⚠️  Warning: $AI_CONTEXT_PATH/specs directory not found"
fi

# Claude Skills 폴더 심볼릭 링크 생성
echo ""
echo "Creating symbolic links for Claude skills..."
CLAUDE_SKILLS_DIR="$PROJECT_ROOT/.claude/skills"
mkdir -p "$CLAUDE_SKILLS_DIR"
if [ -d "$AI_CONTEXT_PATH/skills" ]; then
    for skill_dir in "$AI_CONTEXT_PATH/skills"/*; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            target="$CLAUDE_SKILLS_DIR/$skill_name"
            if [ -e "$target" ]; then
                echo "  ⚠️  $skill_name already exists, skipping..."
            else
                ln -sf "$skill_dir" "$target"
                echo "  ✓ Linked skill: $skill_name"
            fi
        fi
    done
else
    echo "  ⚠️  Warning: $AI_CONTEXT_PATH/skills directory not found"
fi

echo ""
echo "========================================="
echo "설정 완료!"
echo "========================================="
echo ""
echo "생성된 링크:"
echo "  - CLAUDE.md: $PROJECT_ROOT/CLAUDE.md"
echo "  - Instructions: $INSTRUCTIONS_DIR/"
echo "  - Troubleshooting: $TROUBLESHOOTING_DIR/"
echo "  - Specs: $SPECS_DIR/"
echo "  - Claude Skills: $CLAUDE_SKILLS_DIR/"
echo ""
echo "Cursor 사용자: 설정에서 'Include CLAUDE.md in context'를 활성화하세요."
echo ""

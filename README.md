# AI Context 중앙 저장소

Cursor와 Claude Code에서 공통으로 사용할 AI 지침 중앙 저장소입니다.
**CLAUDE.md 하나로 두 도구 모두 지원**하며, **모듈화된 지침**을 제공합니다.

## 구조

```
ai-context/
├── CLAUDE.md                  # 기본 지침 (Cursor + Claude 공용)
├── instructions/              # 상세 지침 (관심사 기반)
│   ├── code-quality.md        # 가독성, 네이밍, 구조
│   ├── performance.md         # 성능 최적화
│   ├── security.md            # 보안
│   ├── testing.md             # 테스트
│   ├── accessibility.md       # 접근성
│   ├── mcp.md                 # MCP 서버 안내
│   └── sfcc.md                # Salesforce Commerce Cloud
├── skills/                    # Claude Code 전용 스킬
│   └── example-skill/
│       └── SKILL.md
├── setup.sh                   # Linux/macOS/Git Bash용
├── setup.ps1                  # Windows PowerShell용
└── README.md
```

## 사용 방법

### 1. 중앙 저장소 설정

```bash
git clone https://github.com/lee-won-cheol/ai-context.git ~/ai-context
```

### 2. 프로젝트에 연결

**중요**: 반드시 **연결할 프로젝트 디렉토리**에서 스크립트를 실행해야 합니다.

#### Windows (PowerShell - 관리자 권한 필요)
```powershell
cd C:\path\to\your-project
$env:AI_CONTEXT_PATH = "C:\path\to\ai-context"
& "$env:AI_CONTEXT_PATH\setup.ps1"
```

#### Linux/macOS/Git Bash/WSL
```bash
cd /path/to/your-project
export AI_CONTEXT_PATH=/path/to/ai-context
bash "$AI_CONTEXT_PATH/setup.sh"
```

### 3. Cursor 설정 (중요!)

1. Cursor 설정 열기
2. **Rules and Commands** 섹션으로 이동
3. **"Include CLAUDE.md in context"** 활성화 (ON)

## 연결 결과

setup 실행 후 프로젝트에 생성되는 구조:

```
your-project/
├── CLAUDE.md                  # 기본 지침 (심볼릭 링크)
├── CLAUDE.local.md            # 프로젝트 전용 지침 (직접 생성, 선택사항)
├── .ai-instructions/          # 상세 지침 (심볼릭 링크)
│   ├── code-quality.md
│   ├── performance.md
│   ├── security.md
│   ├── testing.md
│   ├── accessibility.md
│   └── mcp.md
└── .claude/
    └── skills/                # Claude 스킬 (심볼릭 링크)
```

## 지침 시스템 (Instructions)

### CLAUDE.md에서 지침 참조

CLAUDE.md에서 프로젝트에 해당하는 지침을 참조합니다:

```markdown
## 상세 지침 (Instructions)

코드 작성 시 관련 지침을 참고하세요:
- **코드 품질**: `.ai-instructions/code-quality.md`
- **성능**: `.ai-instructions/performance.md`
- **보안**: `.ai-instructions/security.md`
```

AI가 코드를 작성할 때 **자동으로 해당 지침 파일을 읽고 규칙을 적용**합니다.

### 제공되는 지침 (관심사 기반)

| 지침 | 파일 | 내용 |
|------|------|------|
| 코드 품질 | `code-quality.md` | 가독성, 네이밍, 함수 설계, 타입 안정성 |
| 성능 | `performance.md` | 렌더링, 번들, 네트워크, DB 최적화 |
| 보안 | `security.md` | XSS, SQL Injection, 인증/인가, 민감정보 |
| 테스트 | `testing.md` | 단위/통합/E2E 테스트, 모킹 |
| 접근성 | `accessibility.md` | 시맨틱 HTML, 키보드, ARIA |
| MCP | `mcp.md` | MCP 서버 목록 및 설치 안내 |
| SFCC | `sfcc.md` | Salesforce Commerce Cloud, SFRA 패턴 |

### 새 지침 추가

`instructions/` 폴더에 새 `.md` 파일을 추가하고, `CLAUDE.md`에서 참조하면 됩니다.

## 적용 범위

| 항목 | Cursor | Claude Code |
|------|--------|-------------|
| CLAUDE.md | ✅ | ✅ |
| .ai-instructions/ | ✅ (참조 시) | ✅ (참조 시) |
| .claude/skills/ | ❌ | ✅ |

## 제거 방법

프로젝트에서 AI Context 연결을 제거하려면:

#### Windows (PowerShell)
```powershell
cd C:\path\to\your-project
& "C:\path\to\ai-context\uninstall.ps1"
```

#### Linux/macOS/Git Bash/WSL
```bash
cd /path/to/your-project
bash /path/to/ai-context/uninstall.sh
```

## 프로젝트별 커스터마이징

`CLAUDE.md`는 심볼릭 링크이므로 **수정하면 원본이 변경**됩니다.

프로젝트별 추가 규칙이 필요하면 `CLAUDE.local.md` 파일을 생성하세요:

```markdown
# 프로젝트 전용 지침

## 기술 스택
- Next.js 14
- Supabase
- Tailwind CSS

## 이 프로젝트만의 규칙
- API 라우트는 `/api/v1/` 경로 사용
- 컴포넌트는 atomic design 패턴 적용

## 특별 주의사항
- 환경변수는 `.env.local` 사용
```

AI는 `CLAUDE.md`와 `CLAUDE.local.md`를 **함께 참고**합니다.

## 주의사항

- **Windows 관리자 권한**: 심볼릭 링크 생성은 관리자 권한이 필요합니다.
- **기존 파일 보존**: 기존 파일이 있는 경우 스크립트는 건너뜁니다.
- **Cursor 설정 필수**: "Include CLAUDE.md in context"를 반드시 활성화하세요.
- **CLAUDE.md 수정 금지**: 프로젝트별 규칙은 `CLAUDE.local.md`에 작성하세요.
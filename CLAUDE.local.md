# AI Context 저장소 전용 지침

이 파일은 `ai-context` 저장소에서만 적용되는 규칙입니다.
다른 프로젝트에서 `CLAUDE.local.md`를 만들 때 참고하세요.

---

## 이 저장소의 목적

- Cursor와 Claude Code를 위한 **AI 지침 중앙 관리**
- 여러 프로젝트에서 공통으로 사용할 규칙 정의
- 심볼릭 링크를 통한 일관된 지침 배포

---

## 기술 스택

- **언어**: Markdown, Bash, PowerShell
- **용도**: AI 지침 문서화 및 배포

---

## 이 저장소만의 규칙

### 파일 작성 시

- 모든 지침 파일은 **한국어**로 작성
- 코드 예시는 간결하고 명확하게
- 마크다운 문법을 일관되게 사용

### 폴더 구조

```
ai-context/
├── CLAUDE.md           # 수정 시 모든 연결된 프로젝트에 영향
├── CLAUDE.local.md     # 이 저장소 전용 (예시 파일)
├── instructions/       # 관심사 기반 지침
├── skills/             # AI 스킬 패키지
├── setup.sh / .ps1     # 설치 스크립트
└── uninstall.sh / .ps1 # 제거 스크립트
```

### 새 지침 추가 시

1. `instructions/` 폴더에 `.md` 파일 생성
2. `CLAUDE.md`의 지침 테이블에 참조 추가
3. `README.md` 업데이트

### 새 스킬 추가 시

1. `skills/` 폴더에 스킬 폴더 생성
2. `SKILL.md` 필수 작성 (Claude 공식 양식)
3. `README.md` 업데이트

---

## 주의사항

- `CLAUDE.md` 수정 시 **모든 연결된 프로젝트에 영향**을 미침
- 스크립트 수정 시 **Windows/Linux/macOS 모두 테스트** 필요
- 경로에 한글이 포함된 경우 인코딩 문제 주의

---

## 테스트 방법

```bash
# 새 폴더에서 setup 테스트
mkdir test-project
cd test-project
bash /path/to/ai-context/setup.sh

# 연결 확인
ls -la CLAUDE.md
ls -la .ai-instructions/
ls -la .claude/skills/

# 정리
bash /path/to/ai-context/uninstall.sh
cd ..
rm -rf test-project
```

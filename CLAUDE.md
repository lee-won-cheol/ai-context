# 프로젝트 가이드

이 문서는 프로젝트의 핵심 규칙과 명령어를 정리한 가이드입니다.
Cursor와 Claude Code 모두에서 사용됩니다.

---

## 응답 규칙

- **항상 간결하게 한국어로 답변할 것**
- 불필요한 설명은 생략하고 핵심만 전달
- 코드 예시는 간결하고 명확하게 작성
- 에러 발생 시 해결 방법 제시
- 참고한 문서는 답변 끝에 출처 URL 포함

---

## 코딩 스타일

### 일반 원칙

- 코드는 읽기 쉽고 유지보수 가능해야 합니다.
- 일관된 스타일을 유지합니다.
- 팀의 코딩 컨벤션을 준수합니다.

### 네이밍 규칙

- 변수명: camelCase 사용
- 함수명: camelCase 사용
- 클래스명: PascalCase 사용
- 상수명: UPPER_SNAKE_CASE 사용
- 파일명: kebab-case 사용 (가능한 경우)
- 컴포넌트 파일: PascalCase 사용 (예: `UserProfile.tsx`)

### 들여쓰기

- 들여쓰기는 공백 2칸 또는 4칸을 일관되게 사용합니다.
- 탭 문자는 사용하지 않습니다.

### 주석

- 복잡한 로직에는 주석을 작성합니다.
- 함수와 클래스에는 JSDoc/JavaDoc 스타일의 문서화 주석을 작성합니다.

### 코드 구조

- 함수는 단일 책임 원칙을 따릅니다.
- 긴 함수는 작은 함수로 분리합니다.
- 중복 코드를 피하고 재사용 가능한 모듈을 만듭니다.

---

## 커밋 컨벤션

### 커밋 메시지 형식

```
<type>: <subject>

<body>
```

### Type 종류

- `feat`: 새로운 기능 추가
- `fix`: 버그 수정
- `docs`: 문서 수정
- `style`: 코드 포맷팅, 세미콜론 누락 등
- `refactor`: 코드 리팩토링
- `test`: 테스트 코드 추가/수정
- `chore`: 빌드 업무 수정, 패키지 매니저 설정 등

### 커밋 예시

```
feat: 사용자 인증 기능 추가

- JWT 토큰 기반 인증 구현
- 로그인/로그아웃 API 엔드포인트 추가
```

### 브랜치 네이밍

- `feature/기능명`: 새로운 기능 개발
- `fix/버그명`: 버그 수정
- `hotfix/긴급수정명`: 긴급 수정
- `refactor/리팩토링명`: 리팩토링

---

## 빌드 명령어

```bash
# 프로덕션 빌드
npm run build

# 개발 모드 빌드
npm run dev
```

## 테스트 명령어

```bash
# 전체 테스트 실행
npm test

# 테스트 커버리지 확인
npm run test:coverage

# Watch 모드로 테스트 실행
npm run test:watch
```

## 런타임 명령어

```bash
# 개발 서버 시작
npm run start:dev

# 프로덕션 서버 시작
npm run start:prod
```

## 코드 품질 검사

```bash
# 린터 실행
npm run lint

# 린터 자동 수정
npm run lint:fix

# 타입 체크 (TypeScript)
npm run type-check
```

---

## 아키텍처 원칙

- 컴포넌트 기반 구조
- 관심사의 분리
- 재사용 가능한 모듈 설계

## 주요 디렉토리 구조

```
src/
├── components/     # 재사용 가능한 컴포넌트
├── pages/          # 페이지 컴포넌트
├── hooks/          # 커스텀 훅
├── utils/          # 유틸리티 함수
├── services/       # API 서비스
└── types/          # TypeScript 타입 정의
```

## 의존성 관리

```bash
# 패키지 설치
npm install

# 패키지 추가
npm install <package-name>
```

---

## 상세 지침 (Instructions)

코드 작성 시 아래 지침들을 **반드시 참고**하세요:

| 지침 | 파일 | 설명 |
|------|------|------|
| **코드 품질** | `.ai-instructions/code-quality.md` | 가독성, 네이밍, 구조 |
| **성능** | `.ai-instructions/performance.md` | 성능 최적화 |
| **보안** | `.ai-instructions/security.md` | 보안 취약점 방지 |
| **테스트** | `.ai-instructions/testing.md` | 테스트 작성 |
| **접근성** | `.ai-instructions/accessibility.md` | 웹 접근성 |
| **MCP** | `.ai-instructions/mcp.md` | MCP 서버 안내 |
| **SFCC/SFRA** | `.ai-instructions/sfcc.md` | Salesforce Commerce Cloud |

**코드 작성 전 관련 지침 파일을 읽고 규칙을 따르세요.**

---

## 트러블슈팅 (Troubleshooting)

비슷한 이슈를 겪고 있다면 아래 문서를 참고하세요:

| 카테고리 | 경로 | 설명 |
|----------|------|------|
| **태그 인덱스** | `.ai-troubleshooting/_INDEX.md` | 태그로 이슈 빠르게 검색 |
| **SFCC** | `.ai-troubleshooting/sfcc/` | Content Asset, 캐시, 멀티사이트 |
| **React** | `.ai-troubleshooting/react/` | 렌더링, 상태관리 이슈 |
| **Next.js** | `.ai-troubleshooting/nextjs/` | 라우팅, SSR/SSG 이슈 |
| **DevOps** | `.ai-troubleshooting/devops/` | 배포, CI/CD, 인프라 이슈 |

**에러 발생 시 `.ai-troubleshooting/_INDEX.md`의 태그로 관련 문서를 먼저 검색하세요.**

---

## 스펙 문서 (Specs)

새 기능 개발 시 스펙 문서를 먼저 작성하면 AI가 더 정확하게 구현합니다:

| 항목 | 경로 | 설명 |
|------|------|------|
| **템플릿** | `.ai-specs/_TEMPLATE.md` | 스펙 작성 템플릿 |
| **예시** | `.ai-specs/example-login-feature.md` | 로그인 기능 스펙 예시 |

**기능 개발 전 스펙 문서를 작성하고, AI에게 "`.ai-specs/기능명.md` 보고 구현해줘"라고 요청하세요.**

---

### MCP 안내

사용자가 MCP로 더 잘 수행할 수 있는 작업을 요청하면, 해당 MCP 설치를 안내하세요:
- GitHub 작업 → GitHub MCP
- DB 쿼리 → PostgreSQL/SQLite MCP
- 웹 페이지 분석 → Fetch MCP

자세한 내용은 `.ai-instructions/mcp.md`를 참고하세요.

### 참고 자료 명시
답변 끝에 출처 URL 포함

---

## 프로젝트별 커스터마이징

이 파일은 **공통 지침**입니다. 프로젝트별 추가 규칙이 필요하면:

1. 프로젝트 루트에 `CLAUDE.local.md` 파일 생성
2. 프로젝트 전용 규칙 작성

```markdown
# 프로젝트 전용 지침

## 이 프로젝트만의 규칙
- ...

## 기술 스택
- ...

## 특별 주의사항
- ...
```

**`CLAUDE.local.md`가 있으면 반드시 함께 참고하세요.**

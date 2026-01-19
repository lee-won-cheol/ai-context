# MCP (Model Context Protocol) 지침

## MCP란?

MCP는 AI가 외부 도구/서비스와 상호작용할 수 있게 해주는 프로토콜입니다.
MCP 서버를 설치하면 AI가 직접 파일 조작, GitHub 연동, DB 쿼리 등을 수행할 수 있습니다.

---

## 권장 MCP 목록

### 📁 Filesystem (파일 시스템)

**용도**: 파일/폴더 읽기, 쓰기, 검색

**유용한 상황**:
- "프로젝트 구조 분석해줘"
- "특정 패턴의 파일 찾아줘"
- "여러 파일 한번에 수정해줘"

**설치**:
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/workspace"]
    }
  }
}
```

---

### 🐙 GitHub

**용도**: GitHub 저장소 연동 (이슈, PR, 코드 검색)

**유용한 상황**:
- "이 저장소의 이슈 목록 보여줘"
- "PR 만들어줘"
- "특정 파일의 변경 이력 확인해줘"

**설치**:
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your-token"
      }
    }
  }
}
```

---

### 🗄️ PostgreSQL / SQLite (데이터베이스)

**용도**: 데이터베이스 직접 쿼리 및 스키마 조회

**유용한 상황**:
- "DB 스키마 분석해줘"
- "이 쿼리 실행해줘"
- "테이블 데이터 확인해줘"

**설치 (PostgreSQL)**:
```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "postgresql://user:pass@localhost/dbname"
      }
    }
  }
}
```

**설치 (SQLite)**:
```json
{
  "mcpServers": {
    "sqlite": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sqlite", "/path/to/database.db"]
    }
  }
}
```

---

### 🌐 Fetch (웹 요청)

**용도**: 웹 페이지 내용 가져오기, API 호출

**유용한 상황**:
- "이 URL의 내용 분석해줘"
- "API 문서 페이지 읽어줘"
- "웹사이트 구조 파악해줘"

**설치**:
```json
{
  "mcpServers": {
    "fetch": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-fetch"]
    }
  }
}
```

---

### 🧠 Memory (메모리)

**용도**: 대화 간 정보 저장 및 검색

**유용한 상황**:
- "이전에 논의한 내용 기억해줘"
- "프로젝트 컨텍스트 유지해줘"
- "자주 쓰는 설정 저장해줘"

**설치**:
```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    }
  }
}
```

---

### 🔍 Sequential Thinking (순차적 사고)

**용도**: 복잡한 문제를 단계별로 분석

**유용한 상황**:
- "이 버그 원인 분석해줘"
- "아키텍처 설계 도와줘"
- "복잡한 로직 설계해줘"

**설치**:
```json
{
  "mcpServers": {
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    }
  }
}
```

---

### 🔥 Supabase

**용도**: Supabase 데이터베이스, Auth, Storage 연동

**유용한 상황**:
- "Supabase 테이블 스키마 확인해줘"
- "Supabase Auth 사용자 목록 보여줘"
- "Storage 버킷 파일 관리해줘"
- "RLS 정책 분석해줘"

**설치**:
```json
{
  "mcpServers": {
    "supabase": {
      "command": "npx",
      "args": ["-y", "@supabase/mcp-server-supabase"],
      "env": {
        "SUPABASE_URL": "https://your-project.supabase.co",
        "SUPABASE_SERVICE_ROLE_KEY": "your-service-role-key"
      }
    }
  }
}
```

---

### ▲ Vercel

**용도**: Vercel 프로젝트 및 배포 관리

**유용한 상황**:
- "현재 배포 상태 확인해줘"
- "환경 변수 설정해줘"
- "배포 로그 보여줘"
- "프로젝트 설정 변경해줘"

**설치**:
```json
{
  "mcpServers": {
    "vercel": {
      "command": "npx",
      "args": ["-y", "@vercel/mcp-server-vercel"],
      "env": {
        "VERCEL_TOKEN": "your-vercel-token"
      }
    }
  }
}
```

---

### 💎 Prisma

**용도**: Prisma ORM 스키마 및 데이터 관리

**유용한 상황**:
- "Prisma 스키마 분석해줘"
- "마이그레이션 생성해줘"
- "모델 관계 확인해줘"
- "Prisma Studio 명령어 알려줘"

**설치**:
```json
{
  "mcpServers": {
    "prisma": {
      "command": "npx",
      "args": ["-y", "@prisma/mcp-server"],
      "env": {
        "DATABASE_URL": "your-database-url"
      }
    }
  }
}
```

---

### 🎭 Playwright (E2E 테스트)

**용도**: 브라우저 자동화 및 E2E 테스트

**유용한 상황**:
- "E2E 테스트 실행해줘"
- "스크린샷 찍어줘"
- "페이지 요소 분석해줘"
- "브라우저 자동화 스크립트 만들어줘"

**설치**:
```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-server-playwright"]
    }
  }
}
```

---

### 🔎 Brave Search (웹 검색)

**용도**: 웹 검색 및 문서 조회

**유용한 상황**:
- "최신 React 19 문서 찾아줘"
- "이 에러 해결 방법 검색해줘"
- "라이브러리 비교 자료 찾아줘"
- "Next.js 최신 업데이트 확인해줘"

**설치**:
```json
{
  "mcpServers": {
    "brave-search": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-server-brave-search"],
      "env": {
        "BRAVE_API_KEY": "your-brave-api-key"
      }
    }
  }
}
```

---

### 🐳 Docker

**용도**: Docker 컨테이너 및 이미지 관리

**유용한 상황**:
- "실행 중인 컨테이너 확인해줘"
- "Docker Compose 실행해줘"
- "컨테이너 로그 보여줘"
- "이미지 빌드해줘"

**설치**:
```json
{
  "mcpServers": {
    "docker": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-server-docker"]
    }
  }
}
```

---

### 📝 Notion

**용도**: Notion 페이지 및 데이터베이스 연동

**유용한 상황**:
- "Notion 문서 내용 가져와줘"
- "데이터베이스에 항목 추가해줘"
- "페이지 업데이트해줘"
- "프로젝트 문서 검색해줘"

**설치**:
```json
{
  "mcpServers": {
    "notion": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-server-notion"],
      "env": {
        "NOTION_API_KEY": "your-notion-api-key"
      }
    }
  }
}
```

---

### 💬 Slack

**용도**: Slack 메시지 및 채널 관리

**유용한 상황**:
- "채널에 배포 알림 보내줘"
- "스레드 내용 가져와줘"
- "팀 채널 목록 확인해줘"

**설치**:
```json
{
  "mcpServers": {
    "slack": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-server-slack"],
      "env": {
        "SLACK_BOT_TOKEN": "xoxb-your-token"
      }
    }
  }
}
```

---

### 🛒 SFCC Dev

**용도**: SFCC API 문서, SFRA 구조, 클래스 정보 조회

**유용한 상황**:
- "Product 클래스의 메서드 알려줘"
- "SFRA 컨트롤러 패턴 알려줘"
- "dw.order.Basket API 문서 보여줘"
- "OCAPI 훅 목록 확인해줘"

**설치**:
```json
{
  "mcpServers": {
    "sfcc-dev": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-server-sfcc-dev"]
    }
  }
}
```

**활용 전략**:
- API 규격이나 SFRA 구조가 불확실할 때 **가장 먼저 사용**
- 추측하지 말고 실제 문서를 확인할 것

---

### ☁️ Salesforce DX

**용도**: Salesforce 조직 조회 (객체, 필드, 관계, 데이터)

**유용한 상황**:
- "Account 객체 필드 목록 보여줘"
- "Custom Object 관계 확인해줘"
- "SOQL 쿼리 결과 확인해줘"
- "조직 메타데이터 분석해줘"

**설치**:
```json
{
  "mcpServers": {
    "salesforce-dx": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-server-salesforce-dx"],
      "env": {
        "SF_ORG_ALIAS": "your-org-alias"
      }
    }
  }
}
```

**⚠️ 주의**: 이 도구는 **조회 전용**으로 설정되어 있습니다.
- ✅ 정보 수집, 구조 분석, 데이터 조회
- ❌ 메타데이터 배포, 레코드 생성/수정/삭제

---

### ☁️ AWS

**용도**: AWS 서비스 연동 (S3, Lambda, DynamoDB 등)

**유용한 상황**:
- "S3 버킷 파일 목록 보여줘"
- "Lambda 함수 로그 확인해줘"
- "DynamoDB 테이블 조회해줘"
- "CloudWatch 메트릭 확인해줘"

**설치**:
```json
{
  "mcpServers": {
    "aws": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-server-aws"],
      "env": {
        "AWS_ACCESS_KEY_ID": "your-access-key",
        "AWS_SECRET_ACCESS_KEY": "your-secret-key",
        "AWS_REGION": "ap-northeast-2"
      }
    }
  }
}
```

---

## 설정 파일 위치

| 도구 | 전역 설정 | 프로젝트 설정 |
|------|-----------|---------------|
| **Cursor** | `~/.cursor/mcp.json` | `.cursor/mcp.json` |
| **Claude Code** | `~/.claude.json` | `.mcp.json` |

---

## AI에게 안내하는 방법

사용자가 MCP가 필요한 작업을 요청했을 때:

```
💡 참고: [MCP 이름] MCP를 설치하시면 제가 직접 [기능]을 수행할 수 있습니다.
현재는 [대안적 방법]으로 도와드리겠습니다.

설치 방법은 `.ai-instructions/mcp.md`를 참고하세요.
```

---

## MCP 없이 대응하는 방법

| 요청 | MCP 있을 때 | MCP 없을 때 |
|------|-------------|-------------|
| PR 생성 | 직접 생성 | 명령어/코드 안내 |
| DB 쿼리 | 직접 실행 | 쿼리문 작성 안내 |
| 파일 검색 | 직접 검색 | grep/find 명령어 안내 |
| 웹 내용 분석 | 직접 fetch | URL 복사 요청 |

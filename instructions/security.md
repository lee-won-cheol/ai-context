# 보안 지침

## 입력값 검증

- 모든 사용자 입력은 신뢰하지 않음
- 서버 측 검증 필수 (클라이언트 검증은 UX용)
- 화이트리스트 방식 권장 (허용된 것만 통과)

## 일반적인 취약점 방지

### XSS (Cross-Site Scripting)
```typescript
// ❌ 위험
element.innerHTML = userInput;

// ✅ 안전
element.textContent = userInput;
// 또는 적절한 이스케이프 처리
```

### SQL Injection
```typescript
// ❌ 위험
query(`SELECT * FROM users WHERE id = ${userId}`);

// ✅ 안전: 파라미터 바인딩 사용
query('SELECT * FROM users WHERE id = ?', [userId]);
```

### CSRF (Cross-Site Request Forgery)
- CSRF 토큰 사용
- SameSite 쿠키 속성 설정

## 인증/인가

- 비밀번호는 해시 + 솔트로 저장 (bcrypt, argon2)
- JWT 사용 시 적절한 만료 시간 설정
- 민감한 작업은 재인증 요구
- 최소 권한 원칙 적용

## 민감 정보 관리

```bash
# ❌ 코드에 하드코딩 금지
API_KEY = "sk-1234567890"

# ✅ 환경 변수 사용
API_KEY = process.env.API_KEY
```

- API 키, 비밀번호는 환경 변수로 관리
- .env 파일은 .gitignore에 추가
- 프로덕션 시크릿은 시크릿 매니저 사용

## HTTPS

- 모든 통신은 HTTPS 사용
- HTTP → HTTPS 리다이렉트
- HSTS 헤더 설정

## 에러 처리

- 에러 메시지에 민감 정보 노출 금지
- 스택 트레이스는 프로덕션에서 숨김
- 상세 에러는 로그에만 기록

## 의존성 보안

- 정기적인 의존성 업데이트
- `npm audit` / `yarn audit` 실행
- 알려진 취약점 있는 패키지 사용 금지

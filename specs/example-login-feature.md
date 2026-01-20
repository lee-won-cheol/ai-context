# 로그인 기능 (예시)

> 이 문서는 스펙 문서 작성 예시입니다. 실제 프로젝트에 맞게 수정하세요.

## 개요
- **목적**: 사용자 인증 시스템 구현
- **담당**: 백엔드 팀
- **예상 기간**: 1주

---

## 요구사항

### 필수 (Must Have)
- [ ] 이메일/비밀번호 로그인
- [ ] JWT 기반 인증 (Access Token + Refresh Token)
- [ ] 로그아웃
- [ ] 비밀번호 암호화 (bcrypt)

### 선택 (Nice to Have)
- [ ] 소셜 로그인 (Google, Kakao)
- [ ] 자동 로그인 (Remember Me)
- [ ] 2FA (Two-Factor Authentication)

---

## 기술 스펙

### API 설계
```
POST /api/auth/login
- Request: { email: string, password: string }
- Response: { accessToken: string, refreshToken: string, user: User }

POST /api/auth/logout
- Request: { refreshToken: string }
- Response: { success: boolean }

POST /api/auth/refresh
- Request: { refreshToken: string }
- Response: { accessToken: string }
```

### 데이터 모델
```typescript
interface User {
  id: string;
  email: string;
  passwordHash: string;
  createdAt: Date;
  updatedAt: Date;
}

interface TokenPayload {
  userId: string;
  email: string;
  iat: number;
  exp: number;
}
```

### 의존성
- `jsonwebtoken` - JWT 생성/검증
- `bcrypt` - 비밀번호 해싱
- `cookie-parser` - 쿠키 파싱

---

## 제약사항
- **보안**: 비밀번호는 평문 저장 금지, HTTPS 필수
- **성능**: 로그인 응답 500ms 이내
- **호환성**: 모바일 앱에서도 사용 가능 (쿠키 + Bearer 토큰 둘 다 지원)

---

## 토큰 정책
| 토큰 | 만료 시간 | 저장 위치 |
|------|----------|----------|
| Access Token | 15분 | 메모리 (또는 HttpOnly 쿠키) |
| Refresh Token | 7일 | HttpOnly 쿠키 |

---

## 테스트 계획
- [ ] 단위 테스트: 토큰 생성/검증, 비밀번호 해싱
- [ ] 통합 테스트: 로그인 API 흐름
- [ ] E2E 테스트: 로그인 → 인증 필요 페이지 접근

---

## 참고 자료
- [JWT Best Practices](https://auth0.com/blog/jwt-security-best-practices/)
- [OWASP Authentication Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)

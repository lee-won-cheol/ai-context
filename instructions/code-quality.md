# 코드 품질 지침

## 가독성

- 코드는 읽기 쉽고 자기 문서화되어야 합니다
- 함수/변수명만으로 의도가 파악되도록 작성
- 복잡한 로직은 주석으로 "왜"를 설명 (무엇을 하는지가 아님)

## 네이밍 규칙

| 대상 | 규칙 | 예시 |
|------|------|------|
| 변수/함수 | camelCase | `getUserName`, `isActive` |
| 클래스/컴포넌트 | PascalCase | `UserProfile`, `AuthService` |
| 상수 | UPPER_SNAKE_CASE | `MAX_RETRY_COUNT` |
| 파일 | kebab-case 또는 PascalCase | `user-service.ts`, `UserProfile.tsx` |
| 불리언 | is/has/can 접두사 | `isLoading`, `hasPermission` |
| 이벤트 핸들러 | handle 접두사 | `handleClick`, `handleSubmit` |

## 함수 설계

- 단일 책임 원칙: 한 함수는 한 가지 일만 수행
- 함수 길이는 20줄 이하 권장
- 매개변수는 3개 이하 권장 (많으면 객체로 묶기)
- 부수효과(side effect) 최소화
- 순수 함수 지향

## 코드 구조

- 중복 코드 제거 (DRY 원칙)
- 조기 반환(early return) 패턴 활용
- 중첩 깊이 3단계 이하 유지
- 관련 코드는 가까이 배치

## 주석 작성

```typescript
// ❌ 나쁜 주석: 무엇을 하는지 설명
// 사용자 이름을 가져온다
const name = user.getName();

// ✅ 좋은 주석: 왜 그렇게 하는지 설명
// 레거시 API 호환성을 위해 null 대신 빈 문자열 반환
const name = user.getName() || '';
```

## 타입 안정성 (TypeScript)

- `any` 타입 사용 금지
- 명시적 타입 정의
- `unknown` + 타입 가드 활용
- strict 모드 활성화

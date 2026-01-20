# Content Asset 멀티사이트 Locale 미반영

## 환경
- **플랫폼**: SFCC (Salesforce Commerce Cloud)
- **구성**: 멀티사이트 (025s, 025s_jp, 025s_ko)
- **날짜**: 2026-01-20

## 증상
- 메인 사이트(025s)에서 Content Asset Body 수정
- 다른 사이트(025s_jp, 025s_ko) Storefront에 변경사항 미반영
- 캐시 무효화해도 동일

## 원인
SFCC Content Asset의 Body 속성은 **Locale별로 다른 값**을 가질 수 있음
- default locale에서 수정 → default만 변경됨
- ja_JP, ko_KR locale → 이전 값 그대로 유지

## 해결 방법
1. Business Manager → Content Asset 편집
2. **Locale 드롭다운**을 해당 사이트 locale로 전환 (ja_JP, ko_KR 등)
3. 각 Locale별로 Body 값 수정 → Apply

## 체크리스트
- [ ] 캐시 무효화
- [ ] Library Site Assignment 확인
- [ ] Content Asset Online 상태 확인
- [ ] **Locale별 Body 값 확인 및 수정** ← 가장 흔한 원인

## 태그
`sfcc` `locale` `multisite` `content-asset`

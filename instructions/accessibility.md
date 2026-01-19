# 접근성 지침

## 왜 접근성인가?

- 모든 사용자가 서비스를 이용할 수 있어야 함
- 시각/청각/운동 장애, 일시적 장애 포함
- SEO에도 긍정적 영향
- 법적 요구사항 (웹 접근성 인증)

## 시맨틱 HTML

```html
<!-- ❌ 의미 없는 마크업 -->
<div class="header">
  <div class="nav">
    <div class="button">메뉴</div>
  </div>
</div>

<!-- ✅ 시맨틱 마크업 -->
<header>
  <nav>
    <button>메뉴</button>
  </nav>
</header>
```

### 주요 시맨틱 태그
- `<header>`, `<footer>`, `<nav>`, `<main>`, `<aside>`
- `<article>`, `<section>`
- `<button>`, `<a>`, `<input>`
- `<h1>` ~ `<h6>` (순서대로 사용)

## 키보드 접근성

- 모든 기능은 키보드로 접근 가능해야 함
- Tab 순서가 논리적이어야 함
- 포커스 표시가 명확해야 함 (outline 제거 금지)
- 키보드 트랩 방지 (모달 등에서 탈출 가능)

```css
/* ❌ 포커스 표시 제거 금지 */
*:focus { outline: none; }

/* ✅ 커스텀 포커스 스타일 */
*:focus-visible {
  outline: 2px solid #0066cc;
  outline-offset: 2px;
}
```

## ARIA 속성

```html
<!-- 역할 지정 -->
<div role="button" tabindex="0">클릭</div>

<!-- 상태 표시 -->
<button aria-expanded="false">메뉴 열기</button>

<!-- 레이블 연결 -->
<input aria-labelledby="search-label" />
<span id="search-label">검색</span>

<!-- 숨김 처리 -->
<span aria-hidden="true">장식용 아이콘</span>
```

### 자주 쓰는 ARIA
- `aria-label`: 레이블 텍스트 제공
- `aria-labelledby`: 다른 요소와 레이블 연결
- `aria-describedby`: 추가 설명 연결
- `aria-hidden`: 스크린 리더에서 숨김
- `aria-expanded`: 펼침/접힘 상태
- `aria-live`: 동적 콘텐츠 알림

## 이미지

```html
<!-- 의미 있는 이미지: 설명 필수 -->
<img src="chart.png" alt="2024년 매출 그래프: 전년 대비 20% 증가" />

<!-- 장식용 이미지: 빈 alt 또는 aria-hidden -->
<img src="decoration.png" alt="" />
```

## 색상 및 대비

- 색상만으로 정보 전달 금지 (아이콘, 텍스트 병행)
- 텍스트 대비율 4.5:1 이상 (큰 텍스트 3:1)
- 다크모드 지원 시에도 대비율 유지

## 폼 접근성

```html
<label for="email">이메일</label>
<input id="email" type="email" aria-required="true" />
<span id="email-error" role="alert">유효한 이메일을 입력하세요</span>
```

- 모든 입력 필드에 레이블 연결
- 에러 메시지는 명확하게
- 필수 필드 표시

## 테스트 도구

- Lighthouse 접근성 점수
- axe DevTools
- 스크린 리더 (NVDA, VoiceOver)
- 키보드만으로 사용해보기

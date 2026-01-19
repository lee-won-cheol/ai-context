# SFCC/SFRA 코딩 지침

Salesforce B2C Commerce Cloud 및 SFRA 아키텍처 개발 규칙입니다.

---

## 기본 원칙

- 모든 JavaScript는 **CommonJS 방식** 사용 (`require`, `module.exports`)
- SFCC Rhino 엔진의 제약을 항상 고려
- 비즈니스 로직은 ISML이 아닌 스크립트/컨트롤러에 작성

---

## 컨트롤러 (Controllers)

### 라우팅

```javascript
'use strict';

var server = require('server');

server.get('Show', function (req, res, next) {
    // 로직
    res.render('template/name');
    next();
});

server.post('Submit', function (req, res, next) {
    // POST 처리
    next();
});

module.exports = server.exports();
```

### 확장 패턴

```javascript
// 기존 컨트롤러 확장
server.append('Show', function (req, res, next) {
    // 기존 로직에 추가
    next();
});

server.replace('Show', function (req, res, next) {
    // 기존 로직 대체
    next();
});
```

---

## 모델 (Models)

### 데코레이터 패턴

```javascript
'use strict';

var base = module.superModule;

/**
 * Extended product model
 * @param {dw.catalog.Product} product - Product object
 * @param {Object} options - Configuration options
 */
function ProductModel(product, options) {
    base.call(this, product, options);
    
    // 확장 속성 추가
    this.customAttribute = product.custom.myAttribute;
}

ProductModel.prototype = Object.create(base.prototype);

module.exports = ProductModel;
```

---

## 스크립트 (Scripts)

### 트랜잭션 처리

```javascript
'use strict';

var Transaction = require('dw/system/Transaction');

/**
 * Updates customer profile
 * @param {dw.customer.Customer} customer - Customer object
 * @param {Object} data - Update data
 * @returns {boolean} Success status
 */
function updateCustomer(customer, data) {
    var success = false;
    
    Transaction.wrap(function () {
        customer.profile.firstName = data.firstName;
        customer.profile.lastName = data.lastName;
        success = true;
    });
    
    return success;
}

module.exports = {
    updateCustomer: updateCustomer
};
```

### 로깅

```javascript
var Logger = require('dw/system/Logger');
var logger = Logger.getLogger('custom', 'myCategory');

// console.log 대신 Logger 사용
logger.info('Processing order: {0}', orderId);
logger.error('Error occurred: {0}', error.message);
logger.debug('Debug info: {0}', JSON.stringify(data));
```

---

## ISML 템플릿

### 올바른 사용

```html
<isprint value="${pdict.product.name}" encoding="htmlcontent" />

<isset name="productName" value="${pdict.product.name}" scope="page" />

<isif condition="${pdict.isLoggedIn}">
    <isinclude template="account/welcome" />
</isif>
```

### 지양할 패턴

```html
<!-- ❌ ISML에서 비즈니스 로직 처리 금지 -->
<isscript>
    var total = 0;
    for (var i = 0; i < basket.items.length; i++) {
        total += basket.items[i].price;
    }
</isscript>

<!-- ✅ 컨트롤러/스크립트에서 처리 후 전달 -->
<isprint value="${pdict.basketTotal}" />
```

---

## 기술적 제약 사항

### Rhino 엔진 미지원 문법

| 문법 | 상태 | 대안 |
|------|------|------|
| `async/await` | ❌ | Callback, Pipeline |
| `Optional Chaining (?.)` | ❌ | `&&` 연산자 체인 |
| `Nullish Coalescing (??)` | ❌ | `\|\|` 연산자 |
| `let/const` | ⚠️ 주의 | `var` 권장 |
| `Arrow Functions` | ⚠️ 주의 | `function` 권장 |
| `Template Literals` | ⚠️ 주의 | 문자열 연결 |
| `Destructuring` | ⚠️ 주의 | 명시적 할당 |
| `Spread Operator` | ❌ | `Array.prototype` 메서드 |

### 안전한 코드 예시

```javascript
// ❌ 미지원
var name = customer?.profile?.firstName ?? 'Guest';

// ✅ 지원
var name = (customer && customer.profile && customer.profile.firstName) 
    || 'Guest';
```

---

## JSDoc 문서화

### 필수 규칙

- 모든 함수에 JSDoc 주석 작성
- 파라미터와 반환값에 **전체 API 경로 타입** 명시
- 주석은 **영어**로 작성

### 예시

```javascript
/**
 * Retrieves product availability information
 * @param {dw.catalog.Product} product - The product to check
 * @param {number} quantity - Requested quantity
 * @returns {dw.catalog.ProductAvailabilityModel} Availability model
 */
function getAvailability(product, quantity) {
    return product.availabilityModel;
}

/**
 * Processes order placement
 * @param {dw.order.Basket} basket - Current basket
 * @param {dw.customer.Customer} customer - Customer placing order
 * @returns {{success: boolean, order: dw.order.Order|null, error: string|null}}
 */
function placeOrder(basket, customer) {
    // 주문 처리 로직
}
```

---

## 자주 사용하는 API

### 카탈로그

```javascript
var ProductMgr = require('dw/catalog/ProductMgr');
var CatalogMgr = require('dw/catalog/CatalogMgr');

var product = ProductMgr.getProduct('productId');
var category = CatalogMgr.getCategory('categoryId');
```

### 주문/장바구니

```javascript
var BasketMgr = require('dw/order/BasketMgr');
var OrderMgr = require('dw/order/OrderMgr');

var basket = BasketMgr.getCurrentBasket();
var order = OrderMgr.getOrder('orderNo');
```

### 고객

```javascript
var CustomerMgr = require('dw/customer/CustomerMgr');

var customer = CustomerMgr.getCustomerByLogin('email@example.com');
```

### 시스템

```javascript
var Site = require('dw/system/Site');
var System = require('dw/system/System');

var currentSite = Site.getCurrent();
var sitePreference = currentSite.getCustomPreferenceValue('myPref');
```

---

## 참고

- API 규격이나 SFRA 구조가 불확실할 때는 **[sfcc-dev] MCP**를 사용하여 확인
- 추측하지 말고 실제 문서를 확인할 것

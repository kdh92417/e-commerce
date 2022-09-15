# E-Commerce API
1. [프로젝트 내용](#프로젝트-내용)
   - [주요 사항](#주요-사항)
   - [구현 내용](#구현-내용)
2. [개발 기간](#개발-기간)
3. [기술 스택](#기술-스택)
4. [API Endpoints](#api-endpoints)
5. [ERD](#erd)
6. [Reference Docs](#reference-docs)


## 프로젝트 내용

> E-Commerce 서비스를 위한 회원, 상품, 주문, 결제 API


### 주요 사항
> e-commerce 서비스인 [프루떼](https://www.fruitte.co.kr/shop_payment/?order_code=o20220914df3c69541b2b0) 를 참고하여 
API를 만들었으며, 실제 유저가 상품을 조회, 주문, 결제한다는 가정하에 진행

- DRF를 이용한 RESTFul API
- env파일및 setting값 분리를 통한 develop/deploy 환경 분리
- User/Order/Payment/Product 도메인별 앱 분리
- sample DB: sample_db.sql

### 구현 내용
#### 상품  
- 상품 생성
	- 관리자는 상품상세를 등록할 수 있습니다.   
	- 메인 이미지와 제품상세이미지를 함께 등록합니다.  
	- 일반사용자는 상품생성할 수 없습니다.  
- 상품 상세 수정
	- 관리자는 상품을 수정할 수 있습니다.  
	- 제품이름, 설명, 재고, 가격등을 수정  
- 상품 삭제
	- 관리자는 상품을 삭제할 수 있습니다.  
- 상품 리스트 조회
	- 모든사용자는 상품 리스트를 조회할 수 있습니다.  
	- 각 상품의 정보 및 메인이미지 조회  
- 상품 상세 정보 조회
	- 모든 사용자는 상품 상세내용 조회  
	- 상품 상세 정보, 메인이미지, 상세이미지를 조회   
  
  
#### 주문  
- 주문 생성
	- 로그인한 유저는 여러 상품에대한 제품이 담긴 주문을 생성할 수 있습니다.  
	- 상품옵션을 선택해서 하나의 주문에 포함 시킬 수 있습니다.
	- 주문요청된 제품의 가격을 합하여 주문가격을 계산합니다.(total_amount)
- 상세 주문 수정
	- 관리자 또는 요청을 생성한 유저가 상세 주문에대한 내용을 수정합니다.
- 주문 삭제
	- 관리자 또는 요청을 생성한 유저가 상세 주문에대한 내용을 삭제합니다.
- 주문 리스트 조회
	- 로그인한 유저/관리자는 주문리스트를 조회합니다.
	- 주문상품에대한 정보를 포함해서 전체 주문리스트를 조회
- 상세 주문 조회
	- 로그인한 유저/관리자는 요청들어온 주문ID에 대해서 상세 조회합니다.
	- 주문한 상품에대한 정보를 포함하여 해당 주문에대한 정보를 모두 조회합니다.


#### 결제
- 결제 생성
	- 유저/관리자는 특정 주문의 총 주문가격을 결제합니다.
		- 결제 금액이 낮거나 높으면 결제가 되지 않습니다.
		- 결제하지 않은 주문에대해서만 결제가 가능합니다.
- 결제 수정
	- 결제한 유저 또는 관리자는 특정 결제를 수정합니다.
- 결제 삭제
	- 유저 또는 관리자는 결제 정보를 삭제합니다.
- 결제 리스트 조회
	- 유저 또는 관리자는 결제 리스트를 조회합니다.
- 결제 상세정보 조회
	- 유저 또는 관리자는 결제 상세 정보를 조회합니다.



## 개발기간
- 요구사항 개발 및 문서작업: 2022.09.09 ~ 2022.09.15
- 테스트 작성 및 배포: 미정

## 개발 스택
- Backend: `Django Rest Framework`
- DB: `MySQL`
- Tool: `Github`

## API Endpoints

| Domain | endpoint | Method | 기능 | 권한 |
| --- | --- | --- | --- | --- |
| **Users** | api/v1/users/login/ | POST | 로그인 | - |
|  | api/v1/users/signup/ | POST | 회원가입 | - |
|  | api/v1/users/logout/ | POST | 로그아웃 | 사용자/관리자 |
|  |  |  |  |  |
| **Products** | api/v1/products/ | POST | 상품생성 | 관리자 |
|  | 〃 | GET | 상품 리스트 조회 | - |
|  | api/v1/products/id/ | PATCH/PUT | 상품 수정 | 관리자 |
|  | 〃 | DELETE | 상품 삭제 | 관리자 |
|  | 〃 | GET | 상품 상세 조회 | - |
|  | 〃 |  |  |  |
| **Orders** | api/v1/orders/ | POST | 주문 생성 | 사용자/관리자 |
|  | 〃 | GET | 주문 리스트 조회 | 사용자/관리자 |
|  | api/v1/orders/id/ | PATCH/PUT | 주문 수정 | 사용자/관리자 |
|  | 〃 | DELETE | 주문 삭제 | 사용자/관리자 |
|  | 〃 | GET | 주문 상세 조회 | 사용자/관리자 |
|  | 〃 |  |  |  |
| **Payments** | api/v1/payments/ | POST | 주문 생성 | 사용자/관리자 |
|  | 〃 | GET | 주문 리스트 조회 | 사용자/관리자 |
|  | api/v1/payments/id/ | PATCH/PUT | 주문 수정 | 사용자/관리자 |
|  | 〃 | DELETE | 주문 삭제 | 사용자/관리자 |
|  | 〃 | GET | 주문 상세 조회 | 사용자/관리자 |


## ERD
![e-commerce ERD](https://user-images.githubusercontent.com/58774316/190128802-5026f92b-725a-40a1-a3bb-b9055a9fca6f.png)


## Reference Docs
- [Postman API Docs](https://documenter.getpostman.com/view/11682851/2s7YYu7ivV)

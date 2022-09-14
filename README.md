# E-Commerce API

## 프로젝트 개요

> E-Commerce 서비스를 위한 회원, 상품, 주문, 결제 API


e-commerce 서비스인 [프루떼](https://www.fruitte.co.kr/shop_payment/?order_code=o20220914df3c69541b2b0) 를 참고하여 
API를 만들었으며, 실제 유저가 상품을 조회, 주문, 결제한다는 가정하에 진행하였습니다.


### 주요 사항
- DRF를 이용한 RESTFul API
- env파일및 setting값 분리를 통한 develop/deploy 환경 분리
- User/Order/Payment/Product 도메인별 앱 분리
- sample DB: sample_db.sql


## 개발기간
- 요구사항 개발 및 문서작업: 2022.09.09 ~ 2022.09.14
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
|  |  | GET | 상품 리스트 조회 | - |
|  | api/v1/products/id/ | PATCH/PUT | 상품 수정 | 관리자 |
|  |  | DELETE | 상품 삭제 | 관리자 |
|  |  | GET | 상품 상세 조회 | - |
|  |  |  |  |  |
| **Orders** | api/v1/orders/ | POST | 주문 생성 | 사용자/관리자 |
|  |  | GET | 주문 리스트 조회 | 사용자/관리자 |
|  | api/v1/orders/id/ | PATCH/PUT | 주문 수정 | 사용자/관리자 |
|  |  | DELETE | 주문 삭제 | 사용자/관리자 |
|  |  | GET | 주문 상세 조회 | 사용자/관리자 |
|  |  |  |  |  |
| **Payments** | api/v1/payments/ | POST | 주문 생성 | 사용자/관리자 |
|  |  | GET | 주문 리스트 조회 | 사용자/관리자 |
|  |  | PATCH/PUT | 주문 수정 | 사용자/관리자 |
|  |  | DELETE | 주문 삭제 | 사용자/관리자 |
|  |  | GET | 주문 상세 조회 | 사용자/관리자 |


## ERD
## ERD
![e-commerce ERD](https://user-images.githubusercontent.com/58774316/190128802-5026f92b-725a-40a1-a3bb-b9055a9fca6f.png)


## Reference Docs
- [Postman API Docs](https://documenter.getpostman.com/view/11682851/2s7YYu7ivV)

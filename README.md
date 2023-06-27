<h1 align="center">[3조] 안심증권 👋</h1>
<p align="center"><img alt="logo" src="https://github.com/Akisigure/seniorInvest/blob/main/src/main/webapp/img/logo.png" /></p>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://twitter.com/Akisigure99" target="_blank">
  </a>
</p>

<hr>

<b>안심증권</b>은 주식에 관심이 많은 고령층들을 타겟으로 한 주식 웹 서비스입니다.

### 핵심내용
<hr>

* 사용자는 모의계좌를 발급받아 투자를 연습을 할 수 있습니다.
* 주식에 관련된 최신 뉴스와 공시를 참고할 수 있습니다.

### 전제조건
<hr>

* 공공데이터포털, 전자공시 OPEN DART에서 API키를 발급받아야 합니다.
* properties 파일을 수정 할 수 있는 TextEditor가 필요합니다.
* JVM이 설치되어있어야 합니다.

### 환경설정
<hr>

1. 프로젝트를 Fork 합니다.

2. git clone후 local로 받습니다.
  ```git
  git clone (repo URL)
  ```
3. 발급받은 API키를 수정해야 합니다.
   API키는 src/main/resources/application-API-KEY.properties 에서 수정할 수 있습니다.

   ```application-API-KEY.properties
    API-KEY = # 공공데이터포털 금융위원회_주식시세정보 에서 발급받은 API-KEY
    DIS-API-KEY = # 전자공시 OPEN DART에서 발급받은 API-KEY
   ```

4. DB에 test 계정 및 test 스키마를 생성합니다. 관련 설정은 application.properties 파일에 작성 되어 있습니다.

5. gradle project를 import 후 spring boot application server를 실행합니다.

### 사용 기술
<hr>

```front end```
* HTML
* CSS
* JavaScript
  * JQuery

```back end```
* JAVA
* Spring boot
  * Spring security

```DBMS```
* MySQL
  * mybatis


### 프로젝트 정보

 *  [요구사항 명세서](https://github.com/Akisigure/seniorInvest/issues/58#issue-1747037645)

 * 유즈케이스 다이어그램
    ![유즈케이스 다이어그램](https://github.com/Akisigure/seniorInvest/assets/122990146/b0e35f5c-5b15-40b5-81ee-c3f924fb2bce)


 * ERD
![ERD](https://github.com/Akisigure/seniorInvest/assets/122990146/0145bb32-815d-4329-a6e0-1b18bcea7c47)

 * [스토리보드](https://github.com/Akisigure/seniorInvest/files/11684842/_3.pdf) 
 




### 구현 기능

 * 로그인 / 회원가입
 * 즐겨찾기
 * 주식매수
 * 주식매도
 * 공시
 * 뉴스
 * 공지사항
 * Q&A
 * 관리자 페이지

로그인 / 회원가입
------

즐겨찾기
------

주식매수
------

주식매도
------

공시
------

뉴스
------

공지사항
------


Q&A
=====

관리자 페이지
=====

## 작성자

👤 **Akisigure**

* Twitter: [@Akisigure99](https://twitter.com/Akisigure99)
* Github: [@Akisigure](https://github.com/Akisigure)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_

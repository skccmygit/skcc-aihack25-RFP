
# SKCC AI Hackathon 2025 - 팀03 프로젝트

## 📝 개요

본 프로젝트는 SKCC AI Hackathon 2025 대회에서 제작된 Team 03의 결과물입니다.  
초기 개발환경 세팅에 난항을 겪어 독립적인 구조로 설계되었으며,  
각각의 브랜치(feature/cws, feature/payment-system)로 관리됩니다.

---

## 🔧 환경 요구사항

- Java 18
- Maven 3.x
- Lombok 설치 필요
- Git 설치 (브랜치별 클론용)
- 포트: 8080 (feature/payment-system), 8082 (feature/cws)

---

## 🚀 실행 방법 (두 프로젝트 동시 실행 기준)

이 프로젝트는 2개의 독립 애플리케이션으로 구성되어 있으며, 각각 다른 포트에서 실행됩니다.

### 1️⃣ 메인 시스템 실행 (포트: 8080)

1. 해당 브랜치 소스를 클론합니다:
   ```bash
   git clone -b feature/payment-system https://github.com/skccmygit/skcc-aihack25-team03.git payment-system
   cd payment-system
   ```

2. (필요시) `src/main/resources/application.properties` 파일의 포트를 8080으로 설정하세요:
   ```properties
   server.port=8080
   ```

3. 빌드 및 실행:
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

4. 실행 확인:
   - 메인 로그인 페이지: [http://localhost:8080/](http://localhost:8080/)
       - 로그인 -> 메인으로 이동
       - 로그인 -> 회원가입 -> 로그인으로 이동 
   - 결제 테스트 화면: [http://localhost:8080/payment/form](http://localhost:8080/payment/form)
       - GNB에 연결 못함, url 로 접근 가능
   - 정산 테스트 화면: [http://localhost:8080/settlement/list](http://localhost:8080/settlement/list)
       - GNB에 연결 못함, url 로 접근 가능
   - 어드민 로그인 페이지: [http://localhost:8080/admin/login](http://localhost:8080/admin/login)
       - 어드민 로그인 -> 교육장 관리 화면으로 이동
       - 어드민 로그인 -> 어드민 회원가입 -> 로그인으로 이동
---

### 2️⃣ 콘텐츠 관리 시스템 실행 (포트: 8082)

1. 결제 시스템 브랜치도 별도 폴더에 클론합니다:
   ```bash
   git clone -b feature/cws https://github.com/skccmygit/skcc-aihack25-team03.git cws-system
   cd cws-system
   ```

2. `src/main/resources/application.properties` 파일의 포트를 8082로 변경합니다:
   ```properties
   server.port=8082
   ```

3. 빌드 및 실행:
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

4. 실행 확인:
   - 메인 로그인 페이지: [http://localhost:8080/](http://localhost:8080/)
      - 메인 로그인 페이지 > 회원가입 진행 > 로그인 > main 페이지에서 > "콘텐츠 목록" 버튼 선택 > 콘텐츠 화면 확인

---

## 📂 주요 경로

- 소스코드: `src/main/java`
- 설정파일: `src/main/resources/application.properties`

---

## 🧾 기타 참고사항

- 포트 충돌 시 `application.properties`에서 포트 번호 변경
- DB 설정이 필요한 경우, 로컬 PostgreSQL 설정을 참고

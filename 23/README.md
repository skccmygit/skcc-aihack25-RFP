# 대한체육회 교육플랫폼

## 프로젝트 소개

본 프로젝트는 대한체육회 교육플랫폼으로, 다양한 교육과정과 그 차수/기수를 관리하고, 사용자들이 교육과정에 수강 신청할 수 있는 종합 교육 관리 시스템입니다.

## 프로젝트 구조

프로젝트는 React 기반의 프론트엔드와 Spring Boot 기반의 백엔드로 구성되어 있습니다.

```
/
├── frontend/         # React 프론트엔드 애플리케이션
└── backend/          # Spring Boot 백엔드 애플리케이션
```

## 기술 스택

### Frontend

- React 18
- React Router v6
- Context API (상태 관리)
- Axios (API 통신)
- TailwindCSS (스타일링)
- React Icons
- Jest & React Testing Library (테스트)

### Backend

- Java 17
- Spring Boot 3.2.1
- Spring Data JPA
- Spring Security
- JWT Authentication
- PostgreSQL (프로덕션용)
- H2 Database (개발용)
- Lombok
- Swagger/OpenAPI (springdoc)
- JaCoCo (테스트 커버리지)

## 설치 및 실행

### 프론트엔드

```bash
# 디렉토리 이동
cd frontend

# 의존성 패키지 설치
npm install

# 개발 서버 실행
npm start
```

개발 서버는 기본적으로 http://localhost:3000에서 실행됩니다.

### 백엔드

```bash
# 디렉토리 이동
cd backend

# Maven으로 실행 (JDK 17 필요)
./mvnw spring-boot:run

# 또는 JAVA_HOME 환경변수 명시적 설정
JAVA_HOME=/opt/homebrew/opt/openjdk@17 mvn spring-boot:run

# 특정 프로필로 실행
./mvnw spring-boot:run -Dspring-boot.run.profiles=prod
```

백엔드 서버는 기본적으로 http://localhost:8000에서 실행됩니다.

## 도커를 통한 실행

### 프론트엔드

```bash
cd frontend
docker build -t education-platform-frontend .
docker run -p 80:80 education-platform-frontend
```

### 백엔드

```bash
cd backend
docker build -t education-platform-backend .
docker run -p 8000:8000 education-platform-backend
```

## 주요 기능

### 사용자 인증 및 관리
- 로그인 / 회원가입
- 토큰 기반 인증 (JWT)
- 사용자 권한 관리 (일반 사용자/관리자)

### 교육과정 관리
- 교육과정 카테고리 및 유형 관리
- 교육과정 생성, 조회, 수정, 삭제
- 교육과정 레벨 관리
- 교육과정 차수/기수 관리
- 교육 일정 관리
- 교육과정 북마크 기능

### 수강 신청 및 학습 관리
- 교육과정 수강 신청
- 수강 신청 승인/거절/취소 처리
- 내 수강 내역 조회
- 학습 진행 상황 관리
- 학습 일정 캘린더 관리

### 교육과정 추천
- 인기 교육과정 추천
- 최신 교육과정 추천
- 개인 맞춤형 교육과정 추천

### 설문 관리
- 다양한 유형의 설문 생성 및 관리
- 설문 응답 수집 및 분석
- 교육과정별 설문 연결

## 주요 화면

- 대시보드: 주요 정보와 추천 교육과정 표시
- 교육과정 목록: 전체 교육과정 목록 및 필터링
- 교육과정 상세: 교육과정 상세 정보 및 수강 신청
- 내 학습 현황: 진행 중인 교육과정 및 학습 진도
- 교육 일정 캘린더: 월간/주간 교육 일정 조회
- 북마크: 북마크한 교육과정 목록
- 관리자 화면: 교육과정 및 사용자 관리

## API 문서

백엔드 API 문서는 Swagger/OpenAPI를 통해 제공됩니다:
- 개발 환경: http://localhost:8000/swagger-ui.html
- API 문서 JSON: http://localhost:8000/api-docs

## 추가 정보

각 디렉토리의 README.md 파일에서 프론트엔드와 백엔드에 대한 더 자세한 정보를 확인할 수 있습니다:
- [프론트엔드 README](./frontend/README.md)
- [백엔드 README](./backend/README.md) 
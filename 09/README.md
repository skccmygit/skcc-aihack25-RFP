# 스포츠 e-러닝 포털

## 프로젝트 개요
대한체육회 체육인재개발원을 위한 학습운영시스템(스포츠 e-러닝 포털) 구축 프로젝트입니다.

## 기술 스택
- 백엔드: Spring Boot 3, Java 21, PostgreSQL 16
- 프론트엔드: Vue 3, Vite, Pinia

## 프로젝트 구조
```
src/main/java/com/example/sports/ 
├── api/           # REST 컨트롤러 
├── application/   # 유스케이스 서비스 
├── domain/        # 도메인 모델 및 서비스 
├── infrastructure/# 리포지토리, 외부 I/O 
├── config/        # Spring 설정 
└── util/          # 유틸리티

webUI/src/ 
├── assets/        # 정적 파일 
├── components/    # 공유 UI 컴포넌트 
├── composables/   # 재사용 가능 로직 
├── views/         # 라우트 페이지 
├── router/        # vue-router 
├── store/         # pinia 
├── i18n/          # 다국어 지원 
└── main.js
```

## 설치 및 실행 방법

### 백엔드
```bash
./mvnw clean verify
./mvnw spring-boot:run
```

### 프론트엔드
```bash
cd webUI
npm install
npm run dev
```

# skcc-aihack25-team26-vibehacking

AI해커톤 : Vibe Hacking

## 프로젝트 개요

스포츠 이러닝 포털 백엔드 시스템입니다. 사용자 관리, 과정 관리, 학습 활동 추적, 평가 및 수료증 관리 등의 기능을 제공합니다.

## 기술 스택

- **언어:** Python 3.11+
- **웹 프레임워크:** Django 4.2+, Django Rest Framework (DRF), Django Ninja
- **데이터베이스:** PostgreSQL
- **ORM:** Prisma (prisma-client-py)
- **인증:** JWT (djangorestframework-simplejwt)
- **비동기 처리:** asyncio, asgiref
- **기타:** python-dotenv, dj-database-url 등

## 애플리케이션 구조 및 주요 기능

- **`users`** (Ninja): 사용자 회원가입, 로그인, 역할 기반 접근 제어 (JWT 발급).
- **`lms`** (Ninja): 과정 카테고리, 과정, 모듈 관리 (초기 버전 API).
- **`courses`** (DRF): 과정 카테고리, 과정, 모듈 CRUD 및 학습자 수강 신청 처리.
- **`learning`** (DRF): 학습자 중심 기능.
  - 수강 내역 조회, 상세 조회, 수강 취소.
  - 학습 진도 조회 및 업데이트 (모듈별, 전체).
  - 퀴즈 문제 조회 및 답변 제출/채점.
  - 학습 결과(점수) 조회.
  - 발급된 수료증 목록 및 상세 조회.
  - 공개 수료증 유효성 검증.
  - 학습자 대시보드 데이터 제공.
- **`content`** (DRF): LMS 콘텐츠 관리 기능.
  - 학습 모듈용 파일(동영상, PDF 등) 업로드, 조회, 삭제.
  - 퀴즈 정의(JSON) 생성, 조회, 수정, 삭제.
- **`adminpanel`** (DRF): 관리자 기능.
  - 과정별 수강 신청자 목록 조회.
  - 수강 신청 상태 변경.
  - 특정 퀴즈 모듈 응시 결과 통계 조회.
  - 수료증 발급 처리.
- **`cms`** (DRF): 콘텐츠 관리 시스템 (CMS) 기능.
  - 게시판(Board) 관리: 생성, 조회, 수정, 삭제, 권한 관리.
  - 게시글(Post) 관리: 생성, 조회, 수정, 삭제, 검색, 공지 기능.
  - 첨부파일(Attachment) 관리: 업로드, 다운로드, 삭제.
- **`portal`** (DRF): 프론트엔드 포털 제공용 API.
  - 메인 페이지 데이터 집계 (최신 공지, 신규/인기 강좌 등).
  - 기관 소개 콘텐츠 제공.
  - 포털용 공지사항, FAQ 목록 제공.
  - 교육 일정 조회.

## API 문서

본 프로젝트는 Django Ninja와 Django Rest Framework(DRF)를 함께 사용하며, 각 프레임워크로 개발된 API 문서는 다음 경로에서 접근할 수 있습니다:

- **Django Ninja API 문서 (Swagger UI):** `users`, `lms` 앱

  - URL: `http://127.0.0.1:8000/api/v1/core/docs`

- **Django Rest Framework API 문서 (Swagger UI / Browsable API):** `courses`, `learning`, `content`, `adminpanel`, `cms`, `portal` 앱
  - 통합 Swagger UI: `http://127.0.0.1:8000/swagger/`
  - 각 앱의 API 엔드포인트 URL로 직접 접속하여 Browsable API 확인 및 테스트 가능. (예: `http://127.0.0.1:8000/api/v1/cms/boards/`)

## 개발셋팅 셋팅

- uv를 설치하세요. (`brew install uv`)
- `uv sync` 해서 가상환경 셋팅 및 의존성 설치하세요.
- 패키지 추가하려면 `uv add 패키지명`, 지우려면 `uv remove 패키지명` 하시면 됩니다.
- 가상환경 기반 실행하려면 `uv run`을 붙이시면 됩니다.
  - `uv run python main.py` 이런식으로..
  - 걍 가상환경 활성화해서 쓰셔도 됩니다.
    - `. ./venv/bin/activate`

## Frontend 실행

node server.js

- frontend: /public
- npm install express

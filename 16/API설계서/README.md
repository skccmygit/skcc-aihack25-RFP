# API 설계서

본 문서는 체육인재개발원 학습포털의 API 설계서를 관리합니다.

## API 목록

### 과정 관리 API

| API ID              | Method | Endpoint                         | 설명              | 관련 화면   | 관련 요구사항 |
| ------------------- | ------ | -------------------------------- | ----------------- | ----------- | ------------- |
| COU-SCR-002-API-001 | GET    | /api/v1/admin/courses            | 과정 목록 조회    | COU-SCR-002 | COU-REQ-010   |
| COU-SCR-002-API-002 | GET    | /api/v1/admin/courses/{courseId} | 과정 상세 조회    | COU-SCR-002 | COU-REQ-008   |
| COU-SCR-002-API-003 | POST   | /api/v1/admin/courses            | 과정 등록         | COU-SCR-002 | COU-REQ-007   |
| COU-SCR-002-API-004 | PUT    | /api/v1/admin/courses/{courseId} | 과정 수정         | COU-SCR-002 | COU-REQ-008   |
| COU-SCR-002-API-005 | GET    | /api/v1/admin/courses/check-id   | 과정 ID 중복 확인 | COU-SCR-002 | COU-REQ-007   |

### 사용자 관리 API

| API ID              | Method | Endpoint                    | 설명                | 관련 화면   | 관련 요구사항 |
| ------------------- | ------ | --------------------------- | ------------------- | ----------- | ------------- |
| USR-SCR-002-API-001 | POST   | /api/v1/auth/register       | 회원가입            | USR-SCR-002 | USR-REQ-002   |
| USR-SCR-001-API-001 | POST   | /api/v1/auth/login          | 로그인              | USR-SCR-001 | USR-REQ-003   |
| USR-SCR-003-API-001 | GET    | /api/v1/users               | 사용자 목록 조회    | USR-SCR-003 | USR-REQ-004   |
| USR-SCR-003-API-002 | GET    | /api/v1/users/{id}          | 사용자 상세 조회    | USR-SCR-003 | USR-REQ-004   |
| USR-SCR-003-API-003 | PUT    | /api/v1/users/{id}          | 사용자 정보 수정    | USR-SCR-003 | USR-REQ-004   |
| USR-SCR-003-API-004 | DELETE | /api/v1/users/{id}          | 사용자 삭제         | USR-SCR-003 | USR-REQ-004   |
| USR-SCR-003-API-005 | PUT    | /api/v1/users/{userId}/role | 사용자 역할 수정    | USR-SCR-003 | USR-REQ-004   |
| USR-SCR-003-API-006 | GET    | /api/v1/users/{userId}/role | 사용자 역할 조회    | USR-SCR-003 | USR-REQ-004   |
| USR-SCR-002-API-002 | GET    | /check-id/{loginId}         | 로그인 ID 중복 확인 | USR-SCR-002 | USR-REQ-002   |

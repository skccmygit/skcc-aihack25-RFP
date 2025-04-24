# 과정 목록 조회 API

## 개요

- **API ID**: COU-SCR-002-API-001
- **엔드포인트**: `/api/v1/admin/courses`
- **메소드**: `GET`
- **설명**: 관리자가 등록된 교육 과정 목록을 조회합니다.
- **관련 화면**: COU-SCR-002 (과정 관리 화면)
- **관련 요구사항**: COU-REQ-010 (등록된 교육 과정 목록 조회 - 관리자)

## 요청 (Request)

### 헤더 (Headers)

```json
{
  "Content-Type": "application/json",
  "Authorization": "Bearer {access_token}"
}
```

### 파라미터 (Parameters)

#### Query Parameters

- **검색 조건 (CourseSearchCondition)**

  - `keyword` (string, optional): 검색어
  - `courseType` (string, optional): 과정 유형 (ONLINE/OFFLINE/BLENDED)
  - `status` (string, optional): 과정 상태
  - `categoryId` (string, optional): 카테고리 ID
  - `targetAudience` (array, optional): 교육 대상

- **페이징 정보 (Pageable)**
  - `page` (number, optional): 페이지 번호 (0부터 시작)
  - `size` (number, optional): 페이지 크기
  - `sort` (string, optional): 정렬 기준 (예: "name,asc")

## 응답 (Response)

### 성공 응답 (200 OK)

```json
{
  "content": [
    {
      "courseId": "string",
      "name": "string",
      "description": "string",
      "courseType": "string",
      "categoryId": "string",
      "difficulty": "string",
      "targetAudience": ["string"],
      "status": "string",
      "thumbnailUrl": "string"
    }
  ],
  "pageable": {
    "pageNumber": 0,
    "pageSize": 10,
    "sort": {
      "sorted": true,
      "unsorted": false,
      "empty": false
    },
    "offset": 0,
    "paged": true,
    "unpaged": false
  },
  "totalElements": 0,
  "totalPages": 0,
  "last": true,
  "size": 10,
  "number": 0,
  "sort": {
    "sorted": true,
    "unsorted": false,
    "empty": false
  },
  "numberOfElements": 0,
  "first": true,
  "empty": true
}
```

### 에러 응답

#### 401 Unauthorized

```json
{
  "status": "error",
  "error": {
    "code": "UNAUTHORIZED",
    "message": "인증이 필요합니다."
  }
}
```

#### 403 Forbidden

```json
{
  "status": "error",
  "error": {
    "code": "FORBIDDEN",
    "message": "접근 권한이 없습니다."
  }
}
```

## 예시

### 요청 예시

```bash
curl -X GET \
  'http://api.example.com/api/v1/admin/courses?page=0&size=10&sort=name,asc' \
  -H 'Authorization: Bearer {access_token}' \
  -H 'Content-Type: application/json'
```

### 응답 예시

```json
{
  "content": [
    {
      "courseId": "COURSE001",
      "name": "스포츠 심리학 기초",
      "description": "스포츠 심리학의 기본 개념과 원리를 학습합니다.",
      "courseType": "ONLINE",
      "categoryId": "PSY",
      "difficulty": "BEGINNER",
      "targetAudience": ["PLAYER", "COACH"],
      "status": "OPEN",
      "thumbnailUrl": "/images/courses/COURSE001.jpg"
    }
  ],
  "pageable": {
    "pageNumber": 0,
    "pageSize": 10,
    "sort": {
      "sorted": true,
      "unsorted": false,
      "empty": false
    },
    "offset": 0,
    "paged": true,
    "unpaged": false
  },
  "totalElements": 1,
  "totalPages": 1,
  "last": true,
  "size": 10,
  "number": 0,
  "sort": {
    "sorted": true,
    "unsorted": false,
    "empty": false
  },
  "numberOfElements": 1,
  "first": true,
  "empty": false
}
```

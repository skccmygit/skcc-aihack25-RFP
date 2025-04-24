# 과정 상세 조회 API

## 개요

- **API ID**: COU-SCR-002-API-002
- **엔드포인트**: `/api/v1/admin/courses/{courseId}`
- **메소드**: `GET`
- **설명**: 특정 과정의 상세 정보를 조회합니다.
- **관련 화면**: COU-SCR-002 (과정 관리 화면)
- **관련 요구사항**: COU-REQ-008 (교육 과정 정보 관리 - 과정 자체 정보)

## 요청 (Request)

### 헤더 (Headers)

```json
{
  "Content-Type": "application/json",
  "Authorization": "Bearer {access_token}"
}
```

### 파라미터 (Parameters)

#### Path Parameters

- `courseId` (string, required): 조회할 과정의 ID

## 응답 (Response)

### 성공 응답 (200 OK)

```json
{
  "courseId": "string",
  "name": "string",
  "description": "string",
  "courseType": "string",
  "categoryId": "string",
  "difficulty": "string",
  "targetAudience": ["string"],
  "status": "string",
  "thumbnailUrl": "string",
  "startDate": "string",
  "endDate": "string",
  "applicationStartDate": "string",
  "applicationEndDate": "string",
  "capacity": 0,
  "currentApplicants": 0,
  "fee": 0,
  "location": "string",
  "instructorInfo": {
    "name": "string",
    "bio": "string",
    "imageUrl": "string"
  },
  "courseInfo": {
    "description": "string",
    "learningObjectives": ["string"],
    "curriculum": [
      {
        "chapter": 0,
        "title": "string",
        "lessons": [
          {
            "lessonId": "string",
            "title": "string",
            "duration": 0
          }
        ]
      }
    ]
  },
  "completionCriteria": {
    "progressRate": 0,
    "testScore": 0,
    "attendanceRate": 0
  },
  "materials": [
    {
      "name": "string",
      "downloadUrl": "string"
    }
  ]
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

#### 404 Not Found

```json
{
  "status": "error",
  "error": {
    "code": "COURSE_NOT_FOUND",
    "message": "해당 과정을 찾을 수 없습니다."
  }
}
```

## 예시

### 요청 예시

```bash
curl -X GET \
  'http://api.example.com/api/v1/admin/courses/COURSE001' \
  -H 'Authorization: Bearer {access_token}' \
  -H 'Content-Type: application/json'
```

### 응답 예시

```json
{
  "courseId": "COURSE001",
  "name": "스포츠 심리학 기초",
  "description": "스포츠 심리학의 기본 개념과 원리를 학습합니다.",
  "courseType": "ONLINE",
  "categoryId": "PSY",
  "difficulty": "BEGINNER",
  "targetAudience": ["PLAYER", "COACH"],
  "status": "OPEN",
  "thumbnailUrl": "/images/courses/COURSE001.jpg",
  "startDate": "2024-03-01",
  "endDate": "2024-03-31",
  "applicationStartDate": "2024-02-01",
  "applicationEndDate": "2024-02-29",
  "capacity": 100,
  "currentApplicants": 50,
  "fee": 0,
  "location": null,
  "instructorInfo": {
    "name": "김철수",
    "bio": "스포츠 심리학 전문가",
    "imageUrl": "/images/instructors/kim.jpg"
  },
  "courseInfo": {
    "description": "본 과정은 스포츠 심리학의 기초를 다룹니다.",
    "learningObjectives": [
      "스포츠 심리학의 기본 개념 이해",
      "심리적 기술 훈련의 원리 습득"
    ],
    "curriculum": [
      {
        "chapter": 1,
        "title": "스포츠 심리학 개요",
        "lessons": [
          {
            "lessonId": "L001",
            "title": "스포츠 심리학이란?",
            "duration": 30
          }
        ]
      }
    ]
  },
  "completionCriteria": {
    "progressRate": 80,
    "testScore": 70,
    "attendanceRate": null
  },
  "materials": [
    {
      "name": "학습 교재",
      "downloadUrl": "/materials/COURSE001/textbook.pdf"
    }
  ]
}
```

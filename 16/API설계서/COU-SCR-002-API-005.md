# 과정 ID 중복 확인 API

## 개요

- **API ID**: COU-SCR-002-API-005
- **엔드포인트**: `/api/v1/admin/courses/check-id`
- **메소드**: `GET`
- **설명**: 과정 등록 시 사용할 과정 ID의 중복 여부를 확인합니다.
- **관련 화면**: COU-SCR-002 (과정 관리 화면)
- **관련 요구사항**: COU-REQ-007 (교육 과정 개설 관리 - 과정 원형 생성)

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

- `courseId` (string, required): 중복 확인할 과정 ID

## 응답 (Response)

### 성공 응답 (200 OK)

```json
{
  "available": true
}
```

- `available` (boolean)
  - `true`: 사용 가능한 과정 ID
  - `false`: 이미 사용 중인 과정 ID

### 에러 응답

#### 400 Bad Request

```json
{
  "status": "error",
  "error": {
    "code": "INVALID_REQUEST",
    "message": "과정 ID는 필수 입력값입니다."
  }
}
```

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
  'http://api.example.com/api/v1/admin/courses/check-id?courseId=COURSE001' \
  -H 'Authorization: Bearer {access_token}' \
  -H 'Content-Type: application/json'
```

### 응답 예시

```json
{
  "available": false
}
```

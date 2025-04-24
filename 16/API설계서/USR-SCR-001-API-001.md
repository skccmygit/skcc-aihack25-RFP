# 로그인 API

## 1. API 개요

- API ID: USR-SCR-001-API-001
- API Name: 로그인
- 설명: 사용자 인증을 수행하고 JWT 토큰을 발급합니다.

## 2. API 사양

### 2.1 기본 사양

| 항목           | 값                 |
| -------------- | ------------------ |
| URL            | /api/v1/auth/login |
| Method         | POST               |
| Content-Type   | application/json   |
| Authentication | 불필요             |

### 2.2 요청 파라미터

#### Request Body

```json
{
  "loginId": "string", // 로그인 ID (필수)
  "password": "string" // 비밀번호 (필수)
}
```

### 2.3 응답 파라미터

#### Success Response (200 OK)

```json
{
  "success": true,
  "data": {
    "accessToken": "string", // JWT 액세스 토큰
    "refreshToken": "string", // JWT 리프레시 토큰
    "tokenType": "Bearer", // 토큰 타입
    "expiresIn": "number" // 토큰 만료 시간(초)
  },
  "error": null
}
```

#### Error Response

| Status Code | Error Code            | Message                                   | Description                 |
| ----------- | --------------------- | ----------------------------------------- | --------------------------- |
| 400         | BAD_REQUEST           | 필수 입력값이 누락되었습니다.             | 필수 파라미터가 누락된 경우 |
| 401         | INVALID_CREDENTIALS   | 아이디 또는 비밀번호가 일치하지 않습니다. | 인증 실패 시                |
| 500         | INTERNAL_SERVER_ERROR | 서버 오류가 발생했습니다.                 | 서버 내부 오류 발생 시      |

## 3. 특이사항

- 발급된 액세스 토큰은 모든 인증이 필요한 API 요청 시 Authorization 헤더에 포함되어야 합니다.
- 토큰 형식: `Authorization: Bearer {accessToken}`
- 리프레시 토큰은 액세스 토큰 갱신에 사용됩니다.
- 로그인 실패 시 보안을 위해 구체적인 실패 사유를 반환하지 않습니다.

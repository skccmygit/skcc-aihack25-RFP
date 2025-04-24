# 토큰 갱신 API

## 1. API 개요

- API ID: USR-SCR-001-API-002
- API Name: 토큰 갱신
- 설명: 만료된 액세스 토큰을 리프레시 토큰을 사용하여 갱신합니다.

## 2. API 사양

### 2.1 기본 사양

| 항목           | 값                    |
| -------------- | --------------------- |
| URL            | /api/v1/auth/refresh  |
| Method         | POST                  |
| Content-Type   | application/json      |
| Authentication | Bearer {refreshToken} |

### 2.2 요청 파라미터

#### Headers

```
Authorization: Bearer {refreshToken}
```

### 2.3 응답 파라미터

#### Success Response (200 OK)

```json
{
  "success": true,
  "data": {
    "accessToken": "string", // 새로운 JWT 액세스 토큰
    "refreshToken": "string", // 새로운 JWT 리프레시 토큰 (선택적)
    "tokenType": "Bearer", // 토큰 타입
    "expiresIn": "number" // 토큰 만료 시간(초)
  },
  "error": null
}
```

#### Error Response

| Status Code | Error Code            | Message                   | Description                        |
| ----------- | --------------------- | ------------------------- | ---------------------------------- |
| 401         | INVALID_TOKEN         | 유효하지 않은 토큰입니다. | 리프레시 토큰이 유효하지 않은 경우 |
| 401         | EXPIRED_TOKEN         | 만료된 토큰입니다.        | 리프레시 토큰이 만료된 경우        |
| 500         | INTERNAL_SERVER_ERROR | 서버 오류가 발생했습니다. | 서버 내부 오류 발생 시             |

## 3. 특이사항

- 리프레시 토큰은 Authorization 헤더에 Bearer 스키마로 포함되어야 합니다.
- 리프레시 토큰이 만료된 경우, 사용자는 재로그인해야 합니다.
- 보안상의 이유로 리프레시 토큰의 유효 기간은 액세스 토큰보다 길게 설정됩니다.
- 새로운 리프레시 토큰은 보안 정책에 따라 선택적으로 발급될 수 있습니다.

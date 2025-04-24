# 회원가입 API

## 1. API 개요

- API ID: USR-SCR-002-API-001
- API Name: 회원가입
- 설명: 새로운 사용자를 시스템에 등록합니다.

## 2. API 사양

### 2.1 기본 사양

| 항목           | 값                    |
| -------------- | --------------------- |
| URL            | /api/v1/auth/register |
| Method         | POST                  |
| Content-Type   | application/json      |
| Authentication | 불필요                |

### 2.2 요청 파라미터

#### Request Body

```json
{
  "loginId": "string", // 로그인 ID (필수)
  "password": "string", // 비밀번호 (필수)
  "name": "string", // 이름 (필수)
  "email": "string", // 이메일 (필수)
  "phoneNumber": "string", // 전화번호 (필수)
  "birthDate": "string", // 생년월일 (YYYY-MM-DD) (필수)
  "gender": "string", // 성별 (M/F) (필수)
  "address": "string", // 주소 (선택)
  "detailAddress": "string", // 상세주소 (선택)
  "zipCode": "string" // 우편번호 (선택)
}
```

### 2.3 응답 파라미터

#### Success Response (200 OK)

```json
{
  "success": true,
  "data": {
    "id": "number", // 사용자 ID
    "loginId": "string", // 로그인 ID
    "name": "string", // 이름
    "email": "string", // 이메일
    "phoneNumber": "string", // 전화번호
    "birthDate": "string", // 생년월일
    "gender": "string", // 성별
    "address": "string", // 주소
    "detailAddress": "string", // 상세주소
    "zipCode": "string", // 우편번호
    "role": "string" // 사용자 역할
  },
  "error": null
}
```

#### Error Response

| Status Code | Error Code            | Message                        | Description                 |
| ----------- | --------------------- | ------------------------------ | --------------------------- |
| 400         | BAD_REQUEST           | 필수 입력값이 누락되었습니다.  | 필수 파라미터가 누락된 경우 |
| 409         | DUPLICATE_LOGIN_ID    | 이미 사용중인 로그인 ID입니다. | 중복된 로그인 ID인 경우     |
| 500         | INTERNAL_SERVER_ERROR | 서버 오류가 발생했습니다.      | 서버 내부 오류 발생 시      |

## 3. 특이사항

- 비밀번호는 암호화되어 저장됩니다.
- 회원가입 시 기본 역할은 'USER'로 설정됩니다.
- 이메일과 전화번호는 유효성 검사를 수행합니다.

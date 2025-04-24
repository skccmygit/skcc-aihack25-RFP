-- 학습자(STUDENT) 2명, 강사(INSTRUCTOR) 1명, 관리자(ADMIN) 1명, 탈퇴 사용자 1명
INSERT INTO TB_USER (user_id, user_type, username, email, password, phone, birth_date, gender, address, profile_image, social_provider, social_id, is_active, last_login, reg_date, mod_date, withdraw_date, withdraw_reason) VALUES
('user001', 'STUDENT', '김학생', 'student1@example.com', '$2a$10$dP.Q6WzQTF.d7XsqfR8KI.EOPR6BbX0PjAgP5cjJFE3JcXcqnlJl6', '010-1234-5678', '1995-05-15', 'M', '서울시 강남구 테헤란로 123', '/profiles/user001.jpg', NULL, NULL, TRUE, '2025-04-20 10:30:45', CURRENT_TIMESTAMP, '2025-03-10 09:15:20', NULL, NULL),
('user002', 'STUDENT', '이학생', 'student2@example.com', '$2a$10$PQjkLZ.LgCNK./MiSX7DZOXg1MQLjFkuKB7Zfz9H/w1C8CdT4VzFK', '010-2345-6789', '1998-12-03', 'F', '부산시 해운대구 해운대로 456', '/profiles/user002.jpg', 'KAKAO', 'kakao_123456789', TRUE, '2025-04-21 08:45:12', CURRENT_TIMESTAMP, NULL, NULL, NULL),
('inst001', 'INSTRUCTOR', '박강사', 'instructor1@example.com', '$2a$10$Nt5QZ7L2QeI8bqYI9Mlc2.XdWnUJJ.I4I7sCXtVR7NR0bAZH6pXSO', '010-3456-7890', '1985-07-20', 'M', '서울시 서초구 서초대로 789', '/profiles/inst001.jpg', NULL, NULL, TRUE, '2025-04-22 14:20:30', CURRENT_TIMESTAMP, '2025-01-15 11:30:45', NULL, NULL),
('admin001', 'ADMIN', '최관리자', 'admin@example.com', '$2a$10$fD.t7EkrnSzJXpOE9OJ1wu/I3OLzGI8MdwuOY5FiGPjYeQcx.P4Ri', '010-9876-5432', '1980-11-11', 'F', '서울시 중구 세종대로 100', '/profiles/admin001.jpg', NULL, NULL, TRUE, '2025-04-21 16:50:22', CURRENT_TIMESTAMP, '2025-02-25 14:40:10', NULL, NULL),
('user003', 'STUDENT', '정탈퇴', 'withdrawn@example.com', '$2a$10$SbmY9Tge7JLkY.Mpkr1TXu7QVwKN1LXJ9XazO8qHv4mPUM06WAusW', '010-1111-2222', '1992-03-25', 'M', '경기도 성남시 분당구 판교로 123', NULL, NULL, NULL, FALSE, '2025-01-05 09:30:00', CURRENT_TIMESTAMP, '2025-01-10 15:20:30', '2025-04-10 11:25:40', '다른 사이트를 이용하게 되어서 탈퇴합니다.');


-- 학습자 역할 2개, 강사 역할 1개, 관리자 역할 1개, 다중 역할 1개
INSERT INTO TB_USER_ROLE (role_id, user_id, role_name, reg_date) VALUES
(1, 'user001', 'ROLE_STUDENT', CURRENT_TIMESTAMP),
(2, 'user002', 'ROLE_STUDENT', CURRENT_TIMESTAMP),
(3, 'inst001', 'ROLE_INSTRUCTOR', CURRENT_TIMESTAMP),
(4, 'admin001', 'ROLE_ADMIN', CURRENT_TIMESTAMP),
(5, 'inst001', 'ROLE_STUDENT', CURRENT_TIMESTAMP); -- 강사이면서 학습자 역할도 가짐

-- 이메일 인증 2건, 비밀번호 재설정 2건, 소셜 로그인 인증 1건
INSERT INTO TB_USER_AUTH (auth_id, user_id, auth_key, auth_type, expire_date, is_used, reg_date) VALUES
(1, 'user001', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidXNlcjAwMSJ9', 'EMAIL_VERIFY', '2025-04-23 23:59:59', TRUE, CURRENT_TIMESTAMP),
(2, 'user002', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidXNlcjAwMiJ9', 'EMAIL_VERIFY', '2025-04-25 23:59:59', FALSE, CURRENT_TIMESTAMP),
(3, 'user001', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidXNlcjAwMSIsInB3ZCJ9', 'PASSWORD_RESET', '2025-04-24 12:00:00', TRUE, CURRENT_TIMESTAMP),
(4, 'inst001', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiaW5zdDAwMSIsInB3ZCJ9', 'PASSWORD_RESET', '2025-04-26 12:00:00', FALSE, CURRENT_TIMESTAMP),
(5, 'user002', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidXNlcjAwMiIsInNvY2lhbCJ9', 'SOCIAL_AUTH', '2025-12-31 23:59:59', FALSE, CURRENT_TIMESTAMP);

-- 내부 강사 2명, 외부 강사 2명, 전문 강사 1명
INSERT INTO TB_INSTRUCTOR (instructor_id, user_id, instructor_type, specialty, career, profile, bank_name, account_number, account_holder, rating, status, reg_date, mod_date) VALUES
(101, 'inst001', 'INTERNAL', '프로그래밍, 웹개발', '- 10년 이상 개발 경력\n- 전 XX기업 수석 개발자\n- 웹 프로그래밍 전문 강사 5년', '열정적인, 학생 중심의 강의를 지향합니다.', '국민은행', '123-45-6789', '박강사', 4.75, 'APPROVED', CURRENT_TIMESTAMP, NULL),
(102, 'user002', 'EXTERNAL', 'UX/UI 디자인', '- 디자인 에이전시 근무 8년\n- 프리랜서 디자이너 3년', '실무 중심의 디자인 강의를 제공합니다.', '신한은행', '987-65-4321', '이학생', 4.20, 'APPROVED', CURRENT_TIMESTAMP, '2025-03-15 10:25:00'),
(103, 'admin001', 'INTERNAL', '데이터베이스, 서버 관리', '- 대기업 DBA 7년\n- 클라우드 아키텍트 3년', '데이터베이스 설계부터 운영까지 전체 과정을 알려드립니다.', '우리은행', '111-22-3333', '최관리자', 4.95, 'APPROVED', CURRENT_TIMESTAMP, '2025-02-10 14:30:00'),
(104, 'user001', 'EXTERNAL', '마케팅, SNS 광고', '- 디지털 마케팅 에이전시 팀장 5년\n- 소셜미디어 컨설턴트 3년', '실제 캠페인 사례를 바탕으로 실무 지식을 전달합니다.', '하나은행', '444-55-6666', '김학생', 3.85, 'PENDING', CURRENT_TIMESTAMP, NULL),
(105, 'user003', 'PROFESSIONAL', '인공지능, 머신러닝', '- AI 연구소 책임 연구원 10년\n- 국제 학회 논문 다수 발표\n- 대학 겸임교수 4년', '어려운 AI 개념을 쉽게 전달하는 강의를 제공합니다.', 'NH농협', '777-88-9999', '정탈퇴', NULL, 'REJECTED', CURRENT_TIMESTAMP, '2025-04-05 09:15:00');

-- 다양한 점수대 평가 5건
INSERT INTO TB_INSTRUCTOR_EVALUATION (eval_id, instructor_id, course_id, class_id, user_id, score, comment, reg_date) VALUES
(1, 101, 1, 1, 'user001', 5.00, '매우 명확한 설명과 좋은 예제로 쉽게 이해할 수 있었습니다.', CURRENT_TIMESTAMP),
(2, 102, 3, 3, 'user002', 4.50, '실무에 도움이 되는 좋은 강의였습니다. 다만 진도가 조금 빨랐어요.', CURRENT_TIMESTAMP),
(3, 103, 4, 4, 'inst001', 4.80, '전문성이 돋보이는 강의였습니다. 많은 것을 배웠습니다.', CURRENT_TIMESTAMP), 
(4, 101, 2, 2, 'admin001', 3.50, '내용은 좋았으나 강의 자료가 부족했습니다.', CURRENT_TIMESTAMP),
(5, 104, 7, 7, 'user001', 2.20, '설명이 불분명하고 질문에 대한 답변이 충분하지 않았습니다.', CURRENT_TIMESTAMP);

-- 다양한 유형의 로그 5건
INSERT INTO TB_USER_LOG (log_id, user_id, log_type, ip_address, action, action_result, log_date) VALUES
(1, 'user001', 'LOGIN', '192.168.1.101', '/api/auth/login', 'SUCCESS', CURRENT_TIMESTAMP),
(2, 'user002', 'LOGIN', '192.168.1.102', '/api/auth/login', 'FAIL', CURRENT_TIMESTAMP),
(3, 'inst001', 'LOGOUT', '192.168.1.103', '/api/auth/logout', 'SUCCESS', CURRENT_TIMESTAMP),
(4, 'admin001', 'VIEW_COURSE', '192.168.1.104', '/api/courses/3', 'SUCCESS', CURRENT_TIMESTAMP),
(5, 'user001', 'VIEW_CONTENT', '192.168.1.101', '/api/contents/10/view', 'SUCCESS', CURRENT_TIMESTAMP);

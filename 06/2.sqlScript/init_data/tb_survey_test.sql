-- 1. 과정 설문 (활성, 필수, 익명)
INSERT INTO TB_SURVEY (survey_id, survey_name, survey_desc, survey_type, course_id, class_id, 
    start_date, end_date, is_anonymous, is_required, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (1, '파이썬 기초 과정 만족도 조사', '과정 내용과 강사에 대한 만족도를 조사합니다.', 
    'COURSE', 1, 1, '2025-06-25 00:00:00', '2025-07-10 23:59:59', 
    TRUE, TRUE, TRUE, 'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 2. 강사 설문 (활성, 선택, 익명 아님)
INSERT INTO TB_SURVEY (survey_id, survey_name, survey_desc, survey_type, course_id, class_id, 
    start_date, end_date, is_anonymous, is_required, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (2, '강사 평가 설문', '강사의 강의 스킬과 전문성에 대한 평가입니다.', 
    'INSTRUCTOR', 2, 2, '2025-05-15 00:00:00', '2025-05-30 23:59:59', 
    FALSE, FALSE, TRUE, 'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-05-10 15:30:00');

-- 3. 일반 설문 (활성, 선택, 익명)
INSERT INTO TB_SURVEY (survey_id, survey_name, survey_desc, survey_type, course_id, class_id, 
    start_date, end_date, is_anonymous, is_required, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (3, '학습 플랫폼 개선 의견 조사', '학습 플랫폼의 사용성과 개선점에 대한 의견을 수집합니다.', 
    'GENERAL', NULL, NULL, '2025-04-01 00:00:00', '2025-04-30 23:59:59', 
    TRUE, FALSE, TRUE, 'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 4. 과정 설문 (비활성, 필수, 익명)
INSERT INTO TB_SURVEY (survey_id, survey_name, survey_desc, survey_type, course_id, class_id, 
    start_date, end_date, is_anonymous, is_required, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (4, 'Java 중급 과정 설문', 'Java 중급 과정의 교육 내용과 환경에 대한 설문입니다.', 
    'COURSE', 2, NULL, '2025-03-10 00:00:00', '2025-03-25 23:59:59', 
    TRUE, TRUE, FALSE, 'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-03-26 10:15:00');

-- 5. 시설 이용 설문 (활성, 선택, 익명)
INSERT INTO TB_SURVEY (survey_id, survey_name, survey_desc, survey_type, course_id, class_id, 
    start_date, end_date, is_anonymous, is_required, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (5, '교육 시설 만족도 조사', '교육 시설과 학습 환경에 대한 만족도를 조사합니다.', 
    'FACILITY', NULL, NULL, '2025-05-01 00:00:00', '2025-05-31 23:59:59', 
    TRUE, FALSE, TRUE, 'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 1. 파이썬 과정 만족도 조사 - 객관식 단일 선택 문항
INSERT INTO TB_SURVEY_QUESTION (question_id, survey_id, question_text, question_type, is_required, 
    order_no, reg_date, mod_date) 
VALUES (1, 1, '과정의 전반적인 만족도는 어떠셨습니까?', 'SINGLE', 
    TRUE, 1, CURRENT_TIMESTAMP, NULL);

-- 2. 파이썬 과정 만족도 조사 - 객관식 복수 선택 문항
INSERT INTO TB_SURVEY_QUESTION (question_id, survey_id, question_text, question_type, is_required, 
    order_no, reg_date, mod_date) 
VALUES (2, 1, '가장 유익했던 주제는 무엇입니까? (복수 선택 가능)', 'MULTIPLE', 
    TRUE, 2, CURRENT_TIMESTAMP, NULL);

-- 3. 파이썬 과정 만족도 조사 - 주관식 문항 (선택 응답)
INSERT INTO TB_SURVEY_QUESTION (question_id, survey_id, question_text, question_type, is_required, 
    order_no, reg_date, mod_date) 
VALUES (3, 1, '과정 개선을 위한 제안사항이 있으면 자유롭게 작성해주세요.', 'TEXT', 
    FALSE, 3, CURRENT_TIMESTAMP, NULL);

-- 4. 강사 평가 설문 - 객관식 단일 선택 문항
INSERT INTO TB_SURVEY_QUESTION (question_id, survey_id, question_text, question_type, is_required, 
    order_no, reg_date, mod_date) 
VALUES (4, 2, '강사의 강의 전달력은 어떠했습니까?', 'SINGLE', 
    TRUE, 1, CURRENT_TIMESTAMP, '2025-05-10 15:30:00');

-- 5. 학습 플랫폼 개선 의견 조사 - 객관식 단일 선택 문항
INSERT INTO TB_SURVEY_QUESTION (question_id, survey_id, question_text, question_type, is_required, 
    order_no, reg_date, mod_date) 
VALUES (5, 3, '학습 플랫폼의 사용 편의성은 어떠합니까?', 'SINGLE', 
    TRUE, 1, CURRENT_TIMESTAMP, NULL);


-- 문항 1(과정 만족도)의 선택지들
INSERT INTO TB_SURVEY_OPTION (option_id, question_id, option_text, score, order_no, reg_date, mod_date)
VALUES 
(1, 1, '매우 만족', 5, 1, CURRENT_TIMESTAMP, NULL),
(2, 1, '만족', 4, 2, CURRENT_TIMESTAMP, NULL),
(3, 1, '보통', 3, 3, CURRENT_TIMESTAMP, NULL),
(4, 1, '불만족', 2, 4, CURRENT_TIMESTAMP, NULL),
(5, 1, '매우 불만족', 1, 5, CURRENT_TIMESTAMP, NULL);


-- 1. 완료된 익명 설문 응답
INSERT INTO TB_SURVEY_RESPONSE (response_id, survey_id, user_id, enrollment_id, response_date, 
    is_complete, complete_date, ip_address)
VALUES (1, 1, NULL, 1, CURRENT_TIMESTAMP, 
    TRUE, CURRENT_TIMESTAMP, '192.168.1.101');

-- 2. 진행 중인 설문 응답 (비익명)
INSERT INTO TB_SURVEY_RESPONSE (response_id, survey_id, user_id, enrollment_id, response_date, 
    is_complete, complete_date, ip_address)
VALUES (2, 2, 'user001', 2, CURRENT_TIMESTAMP, 
    FALSE, NULL, '192.168.1.102');

-- 3. 완료된 설문 응답 (과정 설문, 비익명)
INSERT INTO TB_SURVEY_RESPONSE (response_id, survey_id, user_id, enrollment_id, response_date, 
    is_complete, complete_date, ip_address)
VALUES (3, 1, 'user002', 3, CURRENT_TIMESTAMP, 
    TRUE, CURRENT_TIMESTAMP, '192.168.1.103');

-- 4. 완료된 설문 응답 (일반 설문, 익명)
INSERT INTO TB_SURVEY_RESPONSE (response_id, survey_id, user_id, enrollment_id, response_date, 
    is_complete, complete_date, ip_address)
VALUES (4, 3, NULL, NULL, CURRENT_TIMESTAMP, 
    TRUE, CURRENT_TIMESTAMP, '192.168.1.104');

-- 5. 진행 중인 설문 응답 (과정 설문, 익명)
INSERT INTO TB_SURVEY_RESPONSE (response_id, survey_id, user_id, enrollment_id, response_date, 
    is_complete, complete_date, ip_address)
VALUES (5, 1, NULL, 5, CURRENT_TIMESTAMP, 
    FALSE, NULL, '192.168.1.105');

-- 1. 객관식 문항 답변 (만족도 - 매우 만족)
INSERT INTO TB_SURVEY_ANSWER (answer_id, response_id, question_id, option_id, text_answer, reg_date)
VALUES (1, 1, 1, 1, NULL, CURRENT_TIMESTAMP);

-- 2. 객관식 문항 답변 (강사 평가 - 만족)
INSERT INTO TB_SURVEY_ANSWER (answer_id, response_id, question_id, option_id, text_answer, reg_date)
VALUES (2, 2, 4, 2, NULL, CURRENT_TIMESTAMP);

-- 3. 주관식 문항 답변
INSERT INTO TB_SURVEY_ANSWER (answer_id, response_id, question_id, option_id, text_answer, reg_date)
VALUES (3, 1, 3, NULL, '실습 시간이 더 많았으면 좋겠습니다. 전반적으로 만족스러웠습니다.', CURRENT_TIMESTAMP);

-- 4. 객관식 문항 답변 (플랫폼 평가 - 보통)
INSERT INTO TB_SURVEY_ANSWER (answer_id, response_id, question_id, option_id, text_answer, reg_date)
VALUES (4, 4, 5, 3, NULL, CURRENT_TIMESTAMP);

-- 5. 객관식 문항 답변 (만족도 - 불만족)
INSERT INTO TB_SURVEY_ANSWER (answer_id, response_id, question_id, option_id, text_answer, reg_date)
VALUES (5, 3, 1, 4, NULL, CURRENT_TIMESTAMP);


-- 1. 사용자 유형 코드 그룹
INSERT INTO TB_CODE_GROUP (group_id, group_name, group_desc, use_yn, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES ('USER_TYPE', '사용자 유형', '시스템 사용자 유형 분류', 'Y', 
    'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 2. 과정 유형 코드 그룹
INSERT INTO TB_CODE_GROUP (group_id, group_name, group_desc, use_yn, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES ('COURSE_TYPE', '과정 유형', '교육 과정 유형 분류', 'Y', 
    'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 3. 설문 유형 코드 그룹 (수정됨)
INSERT INTO TB_CODE_GROUP (group_id, group_name, group_desc, use_yn, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES ('SURVEY_TYPE', '설문 유형', '설문조사 유형 분류', 'Y', 
    'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-01-15 14:30:00');

-- 4. 강의실 유형 코드 그룹
INSERT INTO TB_CODE_GROUP (group_id, group_name, group_desc, use_yn, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES ('CLASSROOM_TYPE', '강의실 유형', '강의실 유형 분류', 'Y', 
    'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 5. 비활성화된 코드 그룹
INSERT INTO TB_CODE_GROUP (group_id, group_name, group_desc, use_yn, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES ('OLD_STATUS', '이전 상태 코드', '시스템 업데이트 이전에 사용되던 상태 코드', 'N', 
    'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-02-10 09:15:00');


-- 사용자 유형 코드들
INSERT INTO TB_CODE (code_id, group_id, code_name, code_desc, order_no, use_yn, 
    attribute1, attribute2, attribute3, attribute4, attribute5,
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES 
('USER_TYPE_STUDENT', 'USER_TYPE', '학습자', '교육 과정을 수강하는 학습자', 1, 'Y', 
NULL, NULL, NULL, NULL, NULL,
'admin001', CURRENT_TIMESTAMP, NULL, NULL),

('USER_TYPE_INSTRUCTOR', 'USER_TYPE', '강사', '교육 과정을 진행하는 강사', 2, 'Y', 
NULL, NULL, NULL, NULL, NULL,
'admin001', CURRENT_TIMESTAMP, NULL, NULL),

('USER_TYPE_ADMIN', 'USER_TYPE', '관리자', '시스템 관리자', 3, 'Y', 
NULL, NULL, NULL, NULL, NULL,
'admin001', CURRENT_TIMESTAMP, NULL, NULL),

('COURSE_TYPE_ONLINE', 'COURSE_TYPE', '온라인', '온라인으로 진행되는 교육 과정', 1, 'Y', 
NULL, NULL, NULL, NULL, NULL,
'admin001', CURRENT_TIMESTAMP, NULL, NULL),

('COURSE_TYPE_OFFLINE', 'COURSE_TYPE', '오프라인', '오프라인 교육장에서 진행되는 교육 과정', 2, 'Y', 
'교육장 주소 필수', NULL, NULL, NULL, NULL,
'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-03-05 16:20:00');


-- 1. 본사 교육센터
INSERT INTO TB_FACILITY (facility_id, facility_name, facility_type, address, contact, 
    capacity, facility_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (1, '본사 교육센터', 'CENTER', '서울시 강남구 테헤란로 123', '02-123-4567', 
    300, '본사 내 위치한 메인 교육 시설로, 5개의 강의실과 2개의 실습실을 보유하고 있습니다.', TRUE, 
    'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 2. 분당 교육센터 (수정됨)
INSERT INTO TB_FACILITY (facility_id, facility_name, facility_type, address, contact, 
    capacity, facility_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (2, '분당 교육센터', 'CENTER', '경기도 성남시 분당구 판교로 456', '031-456-7890', 
    200, '판교 테크노밸리 내 위치한 교육 시설로, IT 실습에 최적화되어 있습니다.', TRUE, 
    'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-01-15 14:30:00');

-- 3. 부산 교육센터 (비활성화)
INSERT INTO TB_FACILITY (facility_id, facility_name, facility_type, address, contact, 
    capacity, facility_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (3, '부산 교육센터', 'CENTER', '부산광역시 해운대구 마린시티 789', '051-789-0123', 
    150, '부산 지역 교육생을 위한 교육 시설입니다. 현재 리모델링 중입니다.', FALSE, 
    'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-02-20 11:45:00');

-- 4. 대전 교육장
INSERT INTO TB_FACILITY (facility_id, facility_name, facility_type, address, contact, 
    capacity, facility_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (4, '대전 교육장', 'BUILDING', '대전광역시 유성구 대학로 101', '042-345-6789', 
    100, '대전 지역 교육생을 위한 소규모 교육 시설입니다.', TRUE, 
    'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 5. 광주 임시 교육장
INSERT INTO TB_FACILITY (facility_id, facility_name, facility_type, address, contact, 
    capacity, facility_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (5, '광주 임시 교육장', 'TEMPORARY', '광주광역시 북구 첨단과기로 234', '062-567-8901', 
    50, '광주 지역 일회성 교육을 위한 임시 교육 시설입니다.', TRUE, 
    'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 1. 본사 강의실
INSERT INTO TB_CLASSROOM (classroom_id, facility_id, classroom_name, classroom_type, capacity, 
    equipment, classroom_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (1, 1, '101호 강의실', 'LECTURE', 30, 
    '프로젝터, 전자칠판, 마이크 시스템', '기본 강의에 적합한 중형 강의실입니다.', TRUE, 
    'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 2. 본사 전산실습실 (수정됨)
INSERT INTO TB_CLASSROOM (classroom_id, facility_id, classroom_name, classroom_type, capacity, 
    equipment, classroom_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (2, 1, '201호 전산실습실', 'LAB', 25, 
    'PC 25대, 프로젝터, 강사용 컴퓨터', '프로그래밍 실습에 최적화된 전산실습실입니다.', TRUE, 
    'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-01-20 10:15:00');

-- 3. 분당 강의실
INSERT INTO TB_CLASSROOM (classroom_id, facility_id, classroom_name, classroom_type, capacity, 
    equipment, classroom_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (3, 2, 'A101 강의실', 'LECTURE', 40, 
    '프로젝터, 음향시스템, 화상회의 장비', '대형 강의에 적합한 강의실로, 화상 교육도 가능합니다.', TRUE, 
    'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 4. 분당 소그룹실
INSERT INTO TB_CLASSROOM (classroom_id, facility_id, classroom_name, classroom_type, capacity, 
    equipment, classroom_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (4, 2, 'B102 소그룹실', 'SEMINAR', 15, 
    '원형 테이블, 화이트보드, 노트북 연결 장치', '토론식 수업과 소그룹 활동에 적합한 세미나실입니다.', TRUE, 
    'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 5. 대전 강의실 (비활성화)
INSERT INTO TB_CLASSROOM (classroom_id, facility_id, classroom_name, classroom_type, capacity, 
    equipment, classroom_desc, is_active, 
    reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (5, 4, '대전 1강의실', 'LECTURE', 20, 
    '프로젝터, 화이트보드', '기본적인 강의 장비를 갖춘 소형 강의실입니다. 현재 수리 중입니다.', FALSE, 
    'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-03-05 16:20:00');

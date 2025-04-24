-- 1. Python 기초 과정
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (1, 2, 'COURSE_005', 'Python 기초', '오프라인', 'BASIC', 'Python 기초 과정에 대한 상세 설명입니다.', '/images/course_1.png', 132, 'Python 기초 과정의 학습 목표입니다.', TRUE, 64544.54, 200, TRUE, 'user_10', '2024-10-20 00:43:18', 'user_10', '2025-02-26 04:26:00');

-- 2. Java 중급 과정
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (2, 2, 'COURSE_006', 'Java 중급', '혼합', 'INTERMEDIATE', 'Java 중급 과정에 대한 상세 설명입니다.', '/images/course_2.png', 34, 'Java 중급 과정의 학습 목표입니다.', FALSE, NULL, 200, FALSE, 'user_7', '2025-01-21 11:47:47', 'user_6', '2025-03-17 16:13:32');

-- 3. React 입문 과정 (수정자 없음)
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (3, 4, 'COURSE_013', 'React 입문', '온라인', 'ADVANCED', 'React 입문 과정에 대한 상세 설명입니다.', '/images/course_3.png', 174, 'React 입문 과정의 학습 목표입니다.', TRUE, 390513.95, 100, TRUE, 'user_5', '2025-02-24 12:25:03', NULL, NULL);

-- 4. 데이터 분석 과정
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (4, 3, 'COURSE_001', '데이터 분석', '온라인', 'BASIC', '데이터 분석 과정에 대한 상세 설명입니다.', '/images/course_4.png', 223, '데이터 분석 과정의 학습 목표입니다.', TRUE, 323895.32, 20, TRUE, 'user_4', '2025-01-11 21:47:34', 'user_10', '2025-01-15 05:57:51');

-- 5. 머신러닝 과정 (무료 과정, 수강 인원 제한 없음)
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (5, 2, 'COURSE_015', '머신러닝', '혼합', 'BASIC', '머신러닝 과정에 대한 상세 설명입니다.', '/images/course_5.png', 90, '머신러닝 과정의 학습 목표입니다.', FALSE, NULL, NULL, TRUE, 'user_8', '2024-07-12 22:59:29', 'user_4', '2025-02-07 18:37:50');

-- 6. 프로젝트 관리 과정 (비활성화 상태, 수강 인원 제한 없음)
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (6, 1, 'COURSE_003', '프로젝트 관리', '오프라인', 'BASIC', '프로젝트 관리 과정에 대한 상세 설명입니다.', '/images/course_6.png', 50, '프로젝트 관리 과정의 학습 목표입니다.', TRUE, 454491.49, NULL, FALSE, 'user_6', '2025-01-01 06:32:01', 'user_7', '2025-02-05 02:13:33');

-- 7. 디지털 마케팅 과정 (수정자 없음, 비활성화 상태)
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (7, 4, 'COURSE_004', '디지털 마케팅', '혼합', 'INTERMEDIATE', '디지털 마케팅 과정에 대한 상세 설명입니다.', '/images/course_7.png', 38, '디지털 마케팅 과정의 학습 목표입니다.', FALSE, NULL, 20, FALSE, 'user_7', '2024-12-19 18:40:21', NULL, NULL);

-- 8. UI/UX 디자인 과정 (수정자 없음)
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (8, 4, 'COURSE_019', 'UI/UX 디자인', '혼합', 'INTERMEDIATE', 'UI/UX 디자인 과정에 대한 상세 설명입니다.', '/images/course_8.png', 230, 'UI/UX 디자인 과정의 학습 목표입니다.', FALSE, NULL, 50, TRUE, 'user_2', '2024-07-22 13:09:31', NULL, NULL);

-- 9. 그래픽 디자인 과정 (비활성화 상태)
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (9, 1, 'COURSE_020', '그래픽 디자인', '혼합', 'INTERMEDIATE', '그래픽 디자인 과정에 대한 상세 설명입니다.', '/images/course_9.png', 52, '그래픽 디자인 과정의 학습 목표입니다.', FALSE, NULL, 50, FALSE, 'user_8', '2024-10-12 03:07:29', 'user_7', '2025-02-21 04:51:16');

-- 10. 클라우드 컴퓨팅 과정 (비활성화 상태)
INSERT INTO TB_COURSE (course_id, category_id, course_code, course_name, course_type, course_level, course_desc, course_image, learning_time, learning_goal, is_charged, price, max_students, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (10, 3, 'COURSE_018', '클라우드 컴퓨팅', '오프라인', 'INTERMEDIATE', '클라우드 컴퓨팅 과정에 대한 상세 설명입니다.', '/images/course_10.png', 111, '클라우드 컴퓨팅 과정의 학습 목표입니다.', FALSE, NULL, 100, FALSE, 'user_9', '2024-10-23 14:04:28', 'user_1', '2025-03-12 04:34:05');

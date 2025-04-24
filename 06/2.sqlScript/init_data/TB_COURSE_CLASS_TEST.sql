-- 1. Python 기초 1기 (준비중)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (1, 1, 'Python 기초 1기', 1, '2025-05-01', '2025-06-30', '2025-03-15 09:00:00', '2025-04-15 18:00:00', 101, 30, 0, 0, FALSE, 'READY', TRUE, 'admin1', CURRENT_TIMESTAMP, NULL, NULL);

-- 2. Java 중급 3기 (접수중, 대기열 활성화)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (2, 2, 'Java 중급 3기', 3, '2025-06-15', '2025-08-15', '2025-04-01 09:00:00', '2025-05-31 18:00:00', 102, 25, 25, 3, TRUE, 'ACCEPTING', TRUE, 'admin2', CURRENT_TIMESTAMP, 'admin5', '2025-04-05 14:30:00');

-- 3. React 입문 2기 (진행중, 온라인 과정)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (3, 3, 'React 입문 2기', 2, '2025-03-10', '2025-05-10', '2025-01-20 09:00:00', '2025-02-28 18:00:00', NULL, 50, 45, 0, FALSE, 'IN_PROGRESS', TRUE, 'admin3', CURRENT_TIMESTAMP, NULL, NULL);

-- 4. 데이터 분석 1기 (종료됨)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (4, 4, '데이터 분석 1기', 1, '2025-01-05', '2025-03-05', '2024-11-15 09:00:00', '2024-12-20 18:00:00', 103, 20, 20, 0, FALSE, 'COMPLETED', FALSE, 'admin2', CURRENT_TIMESTAMP, 'admin1', '2025-03-06 10:15:00');

-- 5. 머신러닝 5기 (진행중, 인원 제한 없음)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (5, 5, '머신러닝 5기', 5, '2025-02-15', '2025-04-15', '2025-01-01 09:00:00', '2025-02-10 18:00:00', NULL, NULL, 78, 0, FALSE, 'IN_PROGRESS', TRUE, 'admin3', CURRENT_TIMESTAMP, NULL, NULL);

-- 6. 프로젝트 관리 2기 (접수중, 대기열 활성화)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (6, 6, '프로젝트 관리 2기', 2, '2025-07-01', '2025-08-30', '2025-05-01 09:00:00', '2025-06-15 18:00:00', 105, 40, 35, 5, TRUE, 'ACCEPTING', TRUE, 'admin4', CURRENT_TIMESTAMP, 'admin2', '2025-05-10 11:20:00');

-- 7. 디지털 마케팅 3기 (준비중, 비활성화)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (7, 7, '디지털 마케팅 3기', 3, '2025-08-15', '2025-10-15', '2025-06-01 09:00:00', '2025-07-31 18:00:00', 106, 30, 0, 0, FALSE, 'READY', FALSE, 'admin5', CURRENT_TIMESTAMP, 'admin3', '2025-04-25 09:40:00');

-- 8. UI/UX 디자인 1기 (접수 마감, 진행 전)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (8, 8, 'UI/UX 디자인 1기', 1, '2025-05-20', '2025-07-20', '2025-03-01 09:00:00', '2025-04-30 18:00:00', NULL, 35, 32, 0, FALSE, 'CLOSED', TRUE, 'admin1', CURRENT_TIMESTAMP, 'admin5', '2025-05-01 16:45:00');

-- 9. 그래픽 디자인 4기 (진행중, 혼합수업)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (9, 9, '그래픽 디자인 4기', 4, '2025-04-10', '2025-06-10', '2025-02-15 09:00:00', '2025-03-31 18:00:00', 107, 25, 24, 0, FALSE, 'IN_PROGRESS', TRUE, 'admin2', CURRENT_TIMESTAMP, NULL, NULL);

-- 10. 클라우드 컴퓨팅 2기 (접수 예정)
INSERT INTO TB_COURSE_CLASS (class_id, course_id, class_name, class_number, start_date, end_date, apply_start_date, apply_end_date, classroom_id, max_students, current_students, waiting_students, is_waiting_enabled, status, is_active, reg_user_id, reg_date, mod_user_id, mod_date)
VALUES (10, 10, '클라우드 컴퓨팅 2기', 2, '2025-09-01', '2025-11-30', '2025-06-15 09:00:00', '2025-08-15 18:00:00', 108, 40, 0, 0, TRUE, 'READY', TRUE, 'admin3', CURRENT_TIMESTAMP, 'admin4', '2025-05-20 13:10:00');

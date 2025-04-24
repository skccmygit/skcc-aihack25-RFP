-- 1. Python 기초 과정의 주강사 - 모든 차수, 모든 과목 담당
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (1, 1, NULL, 101, NULL, '주강사', 1200000.00, CURRENT_TIMESTAMP, NULL);

-- 2. Java 중급 과정의 3기 특정 과목 담당 강사
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (2, 2, 2, 102, 3, '주강사', 850000.00, CURRENT_TIMESTAMP, '2025-03-15 14:30:00');

-- 3. React 입문 과정의 보조 강사
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (3, 3, 3, 103, 4, '보조강사', 500000.00, CURRENT_TIMESTAMP, NULL);

-- 4. 데이터 분석 과정의 특강 강사 - 특정 과목만 담당
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (4, 4, 4, 104, 5, '특강강사', 350000.00, CURRENT_TIMESTAMP, '2025-02-10 09:45:00');

-- 5. 머신러닝 과정의 주강사 - 모든 차수 담당, 특정 과목
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (5, 5, NULL, 105, 6, '주강사', 1500000.00, CURRENT_TIMESTAMP, NULL);

-- 6. 프로젝트 관리 과정의 외부 전문가 - 특정 차수, 모든 과목
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (6, 6, 6, 106, NULL, '외부전문가', 2000000.00, CURRENT_TIMESTAMP, '2025-04-20 11:15:00');

-- 7. 디지털 마케팅 과정 - 무료 자원봉사 강사
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (7, 7, 7, 107, 8, '자원봉사', NULL, CURRENT_TIMESTAMP, NULL);

-- 8. UI/UX 디자인 과정 - 온라인 콘텐츠 제작자, 모든 차수
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (8, 8, NULL, 108, 9, '콘텐츠제작자', 750000.00, CURRENT_TIMESTAMP, '2025-03-05 16:20:00');

-- 9. 그래픽 디자인 과정 - 특정 차수의 모든 과목 담당 (복수 강사 중 1명)
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (9, 9, 9, 109, NULL, '주강사', 900000.00, CURRENT_TIMESTAMP, NULL);

-- 10. 클라우드 컴퓨팅 과정 - 산학연계 전문가
INSERT INTO TB_COURSE_INSTRUCTOR (course_instructor_id, course_id, class_id, instructor_id, subject_id, role, fee, reg_date, mod_date)
VALUES (10, 10, 10, 110, 10, '산학연계전문가', 1000000.00, CURRENT_TIMESTAMP, '2025-04-10 10:30:00');

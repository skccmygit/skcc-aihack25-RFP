-- 1. 최상위 카테고리: IT/프로그래밍
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(1, NULL, 'IT/프로그래밍', 'IT 및 프로그래밍 관련 과정', 1, 1, TRUE, CURRENT_TIMESTAMP, NULL);

-- 2. 최상위 카테고리: 비즈니스/경영
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(2, NULL, '비즈니스/경영', '비즈니스 및 경영 관련 과정', 2, 1, TRUE, CURRENT_TIMESTAMP, NULL);

-- 3. 최상위 카테고리: 디자인/예술
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(3, NULL, '디자인/예술', '디자인 및 예술 관련 과정', 3, 1, TRUE, CURRENT_TIMESTAMP, NULL);

-- 4. 2차 카테고리: 웹 개발 (IT/프로그래밍 하위)
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(4, 1, '웹 개발', '웹 프론트엔드 및 백엔드 개발 과정', 1, 2, TRUE, CURRENT_TIMESTAMP, NULL);

-- 5. 2차 카테고리: 모바일 앱 개발 (IT/프로그래밍 하위)
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(5, 1, '모바일 앱 개발', 'iOS, Android, 크로스 플랫폼 앱 개발 과정', 2, 2, TRUE, CURRENT_TIMESTAMP, NULL);

-- 6. 2차 카테고리: 데이터 사이언스 (IT/프로그래밍 하위)
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(6, 1, '데이터 사이언스', '데이터 분석, 머신러닝, 인공지능 과정', 3, 2, TRUE, CURRENT_TIMESTAMP, NULL);

-- 7. 2차 카테고리: 마케팅 (비즈니스/경영 하위)
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(7, 2, '마케팅', '디지털 마케팅, 브랜드 마케팅, 콘텐츠 마케팅 과정', 1, 2, TRUE, CURRENT_TIMESTAMP, NULL);

-- 8. 2차 카테고리: 리더십 (비즈니스/경영 하위)
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(8, 2, '리더십', '조직 관리, 리더십 스킬, 팀 빌딩 과정', 2, 2, TRUE, CURRENT_TIMESTAMP, NULL);

-- 9. 2차 카테고리: UI/UX 디자인 (디자인/예술 하위)
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(9, 3, 'UI/UX 디자인', '사용자 인터페이스, 사용자 경험 디자인 과정', 1, 2, TRUE, CURRENT_TIMESTAMP, NULL);

-- 10. 2차 카테고리: 그래픽 디자인 (디자인/예술 하위, 비활성화 상태)
INSERT INTO TB_COURSE_CATEGORY 
(category_id, parent_id, category_name, category_desc, order_no, depth, is_active, reg_date, mod_date)
VALUES 
(10, 3, '그래픽 디자인', '포토샵, 일러스트레이터 등 그래픽 디자인 과정', 2, 2, FALSE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

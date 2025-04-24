-- 1. Python 기초 과정의 '파이썬 기본 문법' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (1, 1, '파이썬 기본 문법', '파이썬 언어의 기본 문법과 자료형에 대해 학습합니다.', 240, 1, CURRENT_TIMESTAMP, NULL);

-- 2. Python 기초 과정의 '파이썬 함수와 모듈' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (2, 1, '파이썬 함수와 모듈', '파이썬의 함수 정의 방법과 모듈 활용법에 대해 배웁니다.', 180, 2, CURRENT_TIMESTAMP, '2025-01-15 14:30:00');

-- 3. Java 중급 과정의 'Java 객체지향 프로그래밍' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (3, 2, 'Java 객체지향 프로그래밍', '자바의 클래스, 상속, 다형성 등 객체지향 개념을 심화 학습합니다.', 300, 1, CURRENT_TIMESTAMP, NULL);

-- 4. React 입문 과정의 'React 컴포넌트' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (4, 3, 'React 컴포넌트', 'React의 컴포넌트 구조와 속성(props) 관리에 대해 배웁니다.', 120, 2, CURRENT_TIMESTAMP, '2025-02-10 09:45:00');

-- 5. 데이터 분석 과정의 '데이터 전처리' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (5, 4, '데이터 전처리', '실제 데이터를 분석하기 전 필요한 데이터 정제와 전처리 방법을 학습합니다.', 180, 1, CURRENT_TIMESTAMP, NULL);

-- 6. 머신러닝 과정의 '지도학습 알고리즘' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (6, 5, '지도학습 알고리즘', '회귀, 분류 등 지도학습 알고리즘의 원리와 구현 방법을 배웁니다.', 240, 2, CURRENT_TIMESTAMP, '2025-03-05 16:20:00');

-- 7. 프로젝트 관리 과정의 '애자일 방법론' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (7, 6, '애자일 방법론', '스크럼, 칸반 등 애자일 프로젝트 관리 방법론에 대해 학습합니다.', 150, 3, CURRENT_TIMESTAMP, NULL);

-- 8. 디지털 마케팅 과정의 'SEO 최적화' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (8, 7, 'SEO 최적화', '검색 엔진 최적화 전략과 기법에 대해 실습을 통해 배웁니다.', 90, 2, CURRENT_TIMESTAMP, '2025-01-20 11:15:00');

-- 9. UI/UX 디자인 과정의 '사용자 리서치' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (9, 8, '사용자 리서치', '사용자 중심 디자인을 위한 리서치 방법과 인터뷰 기법을 학습합니다.', 120, 1, CURRENT_TIMESTAMP, NULL);

-- 10. 클라우드 컴퓨팅 과정의 'AWS 기초' 과목
INSERT INTO TB_COURSE_SUBJECT (subject_id, course_id, subject_name, subject_desc, learning_time, order_no, reg_date, mod_date)
VALUES (10, 10, 'AWS 기초', 'Amazon Web Services의 주요 서비스와 아키텍처 설계 방법을 배웁니다.', 210, 1, CURRENT_TIMESTAMP, '2025-02-28 13:40:00');

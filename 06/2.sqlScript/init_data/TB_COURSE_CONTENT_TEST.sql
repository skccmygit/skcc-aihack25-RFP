-- 1. 파이썬 기본 문법 과목의 동영상 강의
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (1, 1, 'VIDEO', '파이썬 시작하기: 변수와 자료형', '파이썬 프로그래밍의 기초와 변수 및 기본 자료형에 대해 설명합니다.', '/contents/videos/python/', 'python_basics_01.mp4', 256480000, 1845, 1, TRUE, CURRENT_TIMESTAMP, NULL);

-- 2. 파이썬 함수와 모듈 과목의 PDF 문서
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (2, 2, 'DOCUMENT', '파이썬 함수 정의 및 활용 가이드', '파이썬에서 함수를 정의하고 활용하는 방법을 상세히 설명한 문서입니다.', '/contents/documents/python/', 'python_functions_guide.pdf', 4280000, NULL, 1, TRUE, CURRENT_TIMESTAMP, '2025-02-15 10:30:00');

-- 3. Java 객체지향 프로그래밍 과목의 퀴즈
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (3, 3, 'QUIZ', '객체지향 개념 확인 퀴즈', '상속, 다형성, 캡슐화 등 객체지향 프로그래밍의 핵심 개념에 대한 이해도를 확인하는 퀴즈입니다.', '/contents/quizzes/java/', 'java_oop_quiz.json', 524288, 1800, 3, TRUE, CURRENT_TIMESTAMP, NULL);

-- 4. React 컴포넌트 과목의 과제
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (4, 4, 'ASSIGNMENT', 'React 컴포넌트 구현 실습', '주어진 요구사항에 맞게 재사용 가능한 React 컴포넌트를 설계하고 구현하는 과제입니다.', '/contents/assignments/react/', 'react_component_assignment.zip', 1420000, NULL, 2, TRUE, CURRENT_TIMESTAMP, '2025-03-10 14:45:00');

-- 5. 데이터 전처리 과목의 웹 세미나
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (5, 5, 'WEBINAR', '실무에서의 데이터 전처리 기법', '현업 데이터 분석가가 진행하는 실제 업무에서 활용되는 데이터 전처리 기법 웨비나입니다.', '/contents/webinars/data/', 'data_preprocessing_webinar.mp4', 512000000, 3600, 2, FALSE, CURRENT_TIMESTAMP, NULL);

-- 6. 지도학습 알고리즘 과목의 동영상 강의
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (6, 6, 'VIDEO', '결정 트리와 랜덤 포레스트 알고리즘', '분류 문제 해결에 효과적인 결정 트리와 랜덤 포레스트 알고리즘의 원리와 파이썬 구현 방법을 설명합니다.', '/contents/videos/ml/', 'decision_tree_random_forest.mp4', 320000000, 2400, 1, TRUE, CURRENT_TIMESTAMP, '2025-03-22 09:15:00');

-- 7. 애자일 방법론 과목의 문서
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (7, 7, 'DOCUMENT', '스크럼 가이드: 팀 협업의 핵심', '스크럼 방법론의 핵심 요소와 실제 프로젝트에 적용하는 방법을 설명한 가이드 문서입니다.', '/contents/documents/agile/', 'scrum_guide.pdf', 3540000, NULL, 1, TRUE, CURRENT_TIMESTAMP, NULL);

-- 8. SEO 최적화 과목의 외부 링크
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (8, 8, 'LINK', 'Google 검색 엔진 최적화 가이드', 'Google에서 제공하는 공식 SEO 가이드 문서로 최신 검색 엔진 최적화 방법을 안내합니다.', 'https://developers.google.com/search/docs/fundamentals/seo-starter-guide', NULL, NULL, NULL, 3, FALSE, CURRENT_TIMESTAMP, '2025-04-05 16:20:00');

-- 9. 사용자 리서치 과목의 동영상 강의 (선택 학습)
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (9, 9, 'VIDEO', '효과적인 사용자 인터뷰 기법', '사용자 리서치에서 필수적인 인터뷰 기법과 유의사항에 대해 설명합니다.', '/contents/videos/ux/', 'user_interview_techniques.mp4', 285000000, 1920, 2, FALSE, CURRENT_TIMESTAMP, NULL);

-- 10. AWS 기초 과목의 퀴즈
INSERT INTO TB_COURSE_CONTENT (content_id, subject_id, content_type, content_title, content_desc, file_path, file_name, file_size, duration, order_no, is_required, reg_date, mod_date)
VALUES (10, 10, 'QUIZ', 'AWS 핵심 서비스 이해도 평가', 'EC2, S3, RDS 등 AWS의 핵심 서비스에 대한 이해도를 확인하는 퀴즈입니다.', '/contents/quizzes/aws/', 'aws_core_services_quiz.json', 680000, 1200, 4, TRUE, CURRENT_TIMESTAMP, '2025-04-12 11:30:00');

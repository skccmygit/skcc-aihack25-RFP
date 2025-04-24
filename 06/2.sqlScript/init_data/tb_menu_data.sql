-- 먼저 최상위 메뉴 항목 삽입 (depth=1, 상위 메뉴 없음)
INSERT INTO TB_MENU (menu_id, parent_menu_id, menu_name, menu_desc, menu_url, menu_type, icon, order_no, depth, use_yn) VALUES
(1, NULL, '교육과정 관리', '과정 관련 전반적인 관리 메뉴', '#', 'MAIN', 'fas fa-chevron-down', 1, 1, 'Y'),
(2, NULL, '수강 관리', '수강신청 및 학습 관련 관리 메뉴', '#', 'MAIN', 'fas fa-chevron-down', 2, 1, 'Y'),
(3, NULL, '시설 관리', '교육 시설 관련 관리 메뉴', '#', 'MAIN', 'fas fa-chevron-down', 3, 1, 'Y'),
(4, NULL, '설문 관리', '설문조사 관련 관리 메뉴', '#', 'MAIN', 'fas fa-chevron-down', 4, 1, 'Y'),
(5, NULL, '마이페이지', '개인 정보 및 학습 관리 메뉴', '#', 'MAIN', 'fas fa-chevron-down', 5, 1, 'Y'),
(6, NULL, '시스템 관리', '시스템 설정 및 관리자 메뉴', '#', 'MAIN', 'fas fa-chevron-down', 6, 1, 'Y');

-- 중간 카테고리 삽입 (depth=2, 상위 메뉴 있음)
INSERT INTO TB_MENU (menu_id, parent_menu_id, menu_name, menu_desc, menu_url, menu_type, icon, order_no, depth, use_yn) VALUES
-- 교육과정 관리 하위 카테고리
(11, 1, '과정 기본 관리', '과정 및 카테고리 기본 관리', NULL, 'CATEGORY', NULL, 1, 2, 'Y'),
(12, 1, '과정 운영 관리', '과정 차수 및 콘텐츠 관리', NULL, 'CATEGORY', NULL, 2, 2, 'Y'),

-- 수강 관리 하위 카테고리
(21, 2, '수강 신청', '수강신청 관련 메뉴', NULL, 'CATEGORY', NULL, 1, 2, 'Y'),
(22, 2, '학습 관리', '학습 진도 및 출결 관리', NULL, 'CATEGORY', NULL, 2, 2, 'Y'),
(23, 2, '평가/수료', '평가 및 수료 관리', NULL, 'CATEGORY', NULL, 3, 2, 'Y'),

-- 시설 관리 하위 카테고리
(31, 3, '시설 관리', '교육 시설 및 강의실 관리', NULL, 'CATEGORY', NULL, 1, 2, 'Y'),

-- 설문 관리 하위 카테고리
(41, 4, '설문 생성', '설문 및 문항 생성 관리', NULL, 'CATEGORY', NULL, 1, 2, 'Y'),
(42, 4, '설문 결과', '설문 응답 관리', NULL, 'CATEGORY', NULL, 2, 2, 'Y'),

-- 마이페이지 하위 카테고리
(51, 5, '내 정보', '개인 정보 관리', NULL, 'CATEGORY', NULL, 1, 2, 'Y'),
(52, 5, '내 학습', '개인 학습 관리', NULL, 'CATEGORY', NULL, 2, 2, 'Y'),

-- 시스템 관리 하위 카테고리
(61, 6, '사용자 관리', '회원 및 강사 관리', NULL, 'CATEGORY', NULL, 1, 2, 'Y'),
(62, 6, '시스템 설정', '코드 및 권한 관리', NULL, 'CATEGORY', NULL, 2, 2, 'Y'),
(63, 6, '통계 및 보고서', '각종 통계 리포트', NULL, 'CATEGORY', NULL, 3, 2, 'Y');

-- 최종 메뉴 항목 삽입 (depth=3, 카테고리 하위 메뉴)
INSERT INTO TB_MENU (menu_id, parent_menu_id, menu_name, menu_desc, menu_url, menu_type, icon, order_no, depth, use_yn) VALUES
-- 과정 기본 관리 하위 메뉴
(111, 11, '카테고리 관리', '교육과정 카테고리 관리', '/admin/course/category', 'MENU', NULL, 1, 3, 'Y'),
(112, 11, '과정 관리', '교육과정 관리', '/admin/course/management', 'MENU', NULL, 2, 3, 'Y'),

-- 과정 운영 관리 하위 메뉴
(121, 12, '과정 차수 관리', '교육과정 차수 관리', '/admin/course/class', 'MENU', NULL, 1, 3, 'Y'),
(122, 12, '과목 및 콘텐츠 관리', '교육과정 과목 및 콘텐츠 관리', '/admin/course/content', 'MENU', NULL, 2, 3, 'Y'),

-- 수강 신청 하위 메뉴
(211, 21, '수강신청 관리', '수강신청 현황 관리', '/admin/enrollment/management', 'MENU', NULL, 1, 3, 'Y'),

-- 학습 관리 하위 메뉴
(221, 22, '학습 진도 관리', '학습자 진도 관리', '/admin/learning/progress', 'MENU', NULL, 1, 3, 'Y'),
(222, 22, '출결 관리', '학습자 출결 관리', '/admin/learning/attendance', 'MENU', NULL, 2, 3, 'Y'),

-- 평가/수료 하위 메뉴
(231, 23, '평가 관리', '학습자 평가 관리', '/admin/assessment/management', 'MENU', NULL, 1, 3, 'Y'),
(232, 23, '수료 관리', '학습자 수료 관리', '/admin/completion/management', 'MENU', NULL, 2, 3, 'Y'),

-- 시설 관리 하위 메뉴
(311, 31, '교육 시설 관리', '교육 시설 정보 관리', '/admin/facility/management', 'MENU', NULL, 1, 3, 'Y'),
(312, 31, '강의실 관리', '강의실 정보 관리', '/admin/classroom/management', 'MENU', NULL, 2, 3, 'Y'),

-- 설문 생성 하위 메뉴
(411, 41, '설문 생성 관리', '설문 정보 관리', '/admin/survey/management', 'MENU', NULL, 1, 3, 'Y'),
(412, 41, '설문 문항 관리', '설문 문항 관리', '/admin/survey/question', 'MENU', NULL, 2, 3, 'Y'),

-- 설문 결과 하위 메뉴
(421, 42, '설문 응답 관리', '설문 응답 데이터 관리', '/admin/survey/response', 'MENU', NULL, 1, 3, 'Y'),

-- 내 정보 하위 메뉴
(511, 51, '내 정보 관리', '개인 정보 관리', '/mypage/profile', 'MENU', NULL, 1, 3, 'Y'),

-- 내 학습 하위 메뉴
(521, 52, '내 수강 관리', '내 수강 과정 관리', '/mypage/enrollment', 'MENU', NULL, 1, 3, 'Y'),
(522, 52, '내 평가 및 수료증', '내 평가 결과 및 수료증 관리', '/mypage/assessment', 'MENU', NULL, 2, 3, 'Y'),

-- 사용자 관리 하위 메뉴
(611, 61, '회원 관리', '일반 회원 관리', '/admin/user/management', 'MENU', NULL, 1, 3, 'Y'),
(612, 61, '강사 관리', '강사 정보 관리', '/admin/instructor/management', 'MENU', NULL, 2, 3, 'Y'),

-- 시스템 설정 하위 메뉴
(621, 62, '공통 코드 관리', '시스템 공통 코드 관리', '/admin/system/code', 'MENU', NULL, 1, 3, 'Y'),
(622, 62, '사용자 권한 관리', '사용자 권한 설정', '/admin/system/role', 'MENU', NULL, 2, 3, 'Y'),
(623, 62, '메뉴 관리', '시스템 메뉴 관리', '/admin/system/menu', 'MENU', NULL, 3, 3, 'Y'),

-- 통계 및 보고서 하위 메뉴
(631, 63, '과정별 통계', '교육과정별 통계 현황', '/admin/statistics/course', 'MENU', NULL, 1, 3, 'Y'),
(632, 63, '사용자별 통계', '사용자별 통계 현황', '/admin/statistics/user', 'MENU', NULL, 2, 3, 'Y'),
(633, 63, '설문 결과 분석', '설문 결과 분석 리포트', '/admin/statistics/survey', 'MENU', NULL, 3, 3, 'Y');
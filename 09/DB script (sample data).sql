-- 체육인재개발원 학습운영시스템 샘플 데이터
-- 모든 테이블에 대한 기본 샘플 데이터를 삽입합니다.


-- 트랜잭션 시작
BEGIN;


-- 1. 코드 그룹 및 코드 데이터 --------------------------------------------------
INSERT INTO sys_code_group (code_group_id, group_name, description, use_yn, created_at, created_by)
VALUES 
('COURSE_TYPE', '교육과정 유형', '온라인, 오프라인, 혼합 등의 교육과정 유형', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_LEVEL', '교육과정 난이도', '입문, 초급, 중급, 고급 등의 난이도', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('FACILITY_TYPE', '시설 유형', '강의실, 세미나실, 회의실 등의 시설 유형', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('PAYMENT_METHOD', '결제 방법', '카드, 계좌이체, 무통장입금 등의 결제 방법', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MEMBER_STATUS', '회원 상태', '활성, 휴면, 탈퇴 등의 회원 상태', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('USER_ROLE', '사용자 역할', '관리자, 학습자, 강사 등의 사용자 역할', 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

INSERT INTO sys_code (code_id, code_group_id, code_name, code_value, sort_order, description, use_yn, created_at, created_by)
VALUES 
-- 교육과정 유형
('COURSE_TYPE_ONLINE', 'COURSE_TYPE', '온라인', 'ONLINE', 1, '온라인으로 진행되는 교육과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_TYPE_OFFLINE', 'COURSE_TYPE', '오프라인', 'OFFLINE', 2, '오프라인으로 진행되는 교육과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_TYPE_BLENDED', 'COURSE_TYPE', '혼합', 'BLENDED', 3, '온라인과 오프라인이 혼합된 교육과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 교육과정 난이도
('COURSE_LEVEL_BEGINNER', 'COURSE_LEVEL', '입문', 'BEGINNER', 1, '입문자를 위한 교육과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_LEVEL_BASIC', 'COURSE_LEVEL', '초급', 'BASIC', 2, '초급자를 위한 교육과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_LEVEL_INTER', 'COURSE_LEVEL', '중급', 'INTERMEDIATE', 3, '중급자를 위한 교육과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_LEVEL_ADV', 'COURSE_LEVEL', '고급', 'ADVANCED', 4, '고급자를 위한 교육과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 시설 유형
('FACILITY_CLASSROOM', 'FACILITY_TYPE', '강의실', 'CLASSROOM', 1, '정규 강의가 진행되는 강의실', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('FACILITY_SEMINAR', 'FACILITY_TYPE', '세미나실', 'SEMINAR', 2, '세미나가 진행되는 공간', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('FACILITY_MEETING', 'FACILITY_TYPE', '회의실', 'MEETING', 3, '회의가 진행되는 공간', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('FACILITY_GYM', 'FACILITY_TYPE', '체육관', 'GYM', 4, '체육 활동이 진행되는 공간', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('FACILITY_FIELD', 'FACILITY_TYPE', '운동장', 'FIELD', 5, '야외 체육 활동이 진행되는 공간', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 결제 방법
('PAYMENT_CARD', 'PAYMENT_METHOD', '신용카드', 'CARD', 1, '신용카드 결제', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('PAYMENT_TRANSFER', 'PAYMENT_METHOD', '계좌이체', 'BANK_TRANSFER', 2, '계좌이체 결제', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('PAYMENT_VBANK', 'PAYMENT_METHOD', '가상계좌', 'VIRTUAL_ACCOUNT', 3, '가상계좌 입금', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('PAYMENT_FREE', 'PAYMENT_METHOD', '무료', 'FREE', 4, '무료 과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 회원 상태
('MEMBER_ACTIVE', 'MEMBER_STATUS', '활성', 'ACTIVE', 1, '활성 상태의 회원', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MEMBER_DORMANT', 'MEMBER_STATUS', '휴면', 'DORMANT', 2, '휴면 상태의 회원', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MEMBER_WITHDRAW', 'MEMBER_STATUS', '탈퇴', 'WITHDRAWAL', 3, '탈퇴한 회원', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 사용자 역할
('ROLE_ADMIN', 'USER_ROLE', '관리자', 'ADMIN', 1, '시스템 관리자', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_STUDENT', 'USER_ROLE', '학습자', 'STUDENT', 2, '교육과정 학습자', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_INSTRUCTOR', 'USER_ROLE', '강사', 'INSTRUCTOR', 3, '교육과정 강사', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_MANAGER', 'USER_ROLE', '운영자', 'MANAGER', 4, '교육과정 운영자', 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 2. 사용자 역할 데이터 ------------------------------------------------------
INSERT INTO user_role (role_id, role_name, description, use_yn, created_at, created_by)
VALUES 
('ROLE_ADMIN', '관리자', '시스템 관리자', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_STUDENT', '학습자', '교육과정 학습자', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_INSTRUCTOR', '강사', '교육과정 강사', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_MANAGER', '운영자', '교육과정 운영자', 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 3. 사용자 정보 데이터 ------------------------------------------------------
-- 관리자 사용자 (비밀번호는 해시 처리되어야 함 - 실제 적용 시 암호화 필요)
INSERT INTO user_info (user_id, user_name, password, email, phone, birth_date, gender, address, zipcode, profile_image, registration_date, status, created_at, created_by)
VALUES 
('admin', '시스템관리자', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'admin@sports.kr', '010-1234-5678', '1980-01-01', 'M', '서울특별시 송파구 올림픽로 424', '05540', '/profiles/admin.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),
('manager1', '교육운영자1', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'manager1@sports.kr', '010-2345-6789', '1985-02-15', 'F', '서울특별시 중구 을지로 123', '04533', '/profiles/manager1.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),
('manager2', '교육운영자2', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'manager2@sports.kr', '010-3456-7890', '1988-05-20', 'M', '서울특별시 종로구 세종대로 175', '03172', '/profiles/manager2.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM');

-- 강사 사용자
INSERT INTO user_info (user_id, user_name, password, email, phone, birth_date, gender, address, zipcode, profile_image, registration_date, status, created_at, created_by)
VALUES 
('instructor1', '김강사', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'instructor1@sports.kr', '010-4567-8901', '1975-03-10', 'M', '서울특별시 마포구 월드컵로 240', '03925', '/profiles/instructor1.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),
('instructor2', '이강사', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'instructor2@sports.kr', '010-5678-9012', '1980-07-22', 'F', '서울특별시 서초구 반포대로 58', '06651', '/profiles/instructor2.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),
('instructor3', '박강사', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'instructor3@sports.kr', '010-6789-0123', '1978-11-15', 'M', '서울특별시 강남구 테헤란로 152', '06236', '/profiles/instructor3.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM');

-- 학습자 사용자
INSERT INTO user_info (user_id, user_name, password, email, phone, birth_date, gender, address, zipcode, profile_image, registration_date, status, created_at, created_by)
VALUES 
('student1', '홍길동', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'student1@example.com', '010-7890-1234', '1995-04-15', 'M', '서울특별시 강서구 화곡로 302', '07730', '/profiles/student1.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),
('student2', '김철수', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'student2@example.com', '010-8901-2345', '1998-08-25', 'M', '서울특별시 동작구 사당로 244', '06987', '/profiles/student2.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),
('student3', '이영희', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'student3@example.com', '010-9012-3456', '1997-12-05', 'F', '서울특별시 광진구 능동로 120', '05061', '/profiles/student3.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),
('student4', '박지민', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'student4@example.com', '010-0123-4567', '1996-06-30', 'F', '서울특별시 성북구 보문로 168', '02844', '/profiles/student4.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),
('student5', '정태현', '$2a$10$J5hgDF9jKYbr5vTRhT8WAOutsQgVqo0wBpJiBYtbQjT1WElrqVLZa', 'student5@example.com', '010-1122-3344', '1999-02-18', 'M', '서울특별시 용산구 이태원로 200', '04350', '/profiles/student5.jpg', CURRENT_TIMESTAMP, 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM');

-- 4. 사용자-역할 매핑 데이터 -------------------------------------------------
-- 관리자 역할 매핑
INSERT INTO user_role_mapping (user_id, role_id, created_at, created_by)
VALUES 
('admin', 'ROLE_ADMIN', CURRENT_TIMESTAMP, 'SYSTEM'),
('manager1', 'ROLE_MANAGER', CURRENT_TIMESTAMP, 'SYSTEM'),
('manager2', 'ROLE_MANAGER', CURRENT_TIMESTAMP, 'SYSTEM');

-- 강사 역할 매핑
INSERT INTO user_role_mapping (user_id, role_id, created_at, created_by)
VALUES 
('instructor1', 'ROLE_INSTRUCTOR', CURRENT_TIMESTAMP, 'SYSTEM'),
('instructor2', 'ROLE_INSTRUCTOR', CURRENT_TIMESTAMP, 'SYSTEM'),
('instructor3', 'ROLE_INSTRUCTOR', CURRENT_TIMESTAMP, 'SYSTEM');

-- 학습자 역할 매핑
INSERT INTO user_role_mapping (user_id, role_id, created_at, created_by)
VALUES 
('student1', 'ROLE_STUDENT', CURRENT_TIMESTAMP, 'SYSTEM'),
('student2', 'ROLE_STUDENT', CURRENT_TIMESTAMP, 'SYSTEM'),
('student3', 'ROLE_STUDENT', CURRENT_TIMESTAMP, 'SYSTEM'),
('student4', 'ROLE_STUDENT', CURRENT_TIMESTAMP, 'SYSTEM'),
('student5', 'ROLE_STUDENT', CURRENT_TIMESTAMP, 'SYSTEM');

-- 5. 메뉴 데이터 ------------------------------------------------------
-- 최상위 메뉴
INSERT INTO menu (menu_id, menu_name, menu_url, menu_icon, description, sort_order, menu_level, use_yn, created_at, created_by)
VALUES 
('MENU_MAIN', '메인', '/', 'home', '메인 페이지', 1, 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ABOUT', '개발원소개', '/about', 'info-circle', '체육인재개발원 소개', 2, 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_COURSE', '교육과정', '/courses', 'book', '교육과정 목록 및 신청', 3, 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_MYPAGE', '마이페이지', '/mypage', 'user', '사용자 마이페이지', 4, 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_COMMUNITY', '커뮤니티', '/community', 'comments', '커뮤니티 게시판', 5, 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_FACILITY', '시설안내', '/facility', 'building', '시설 안내 및 대관', 6, 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ADMIN', '관리자', '/admin', 'cog', '관리자 메뉴', 7, 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 서브 메뉴 (개발원소개)
INSERT INTO menu (menu_id, parent_menu_id, menu_name, menu_url, description, sort_order, menu_level, use_yn, created_at, created_by)
VALUES 
('MENU_ABOUT_INTRO', 'MENU_ABOUT', '인사말', '/about/intro', '인사말', 1, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ABOUT_HISTORY', 'MENU_ABOUT', '연혁', '/about/history', '연혁', 2, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ABOUT_VISION', 'MENU_ABOUT', '교육비전', '/about/vision', '교육비전', 3, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ABOUT_LOCATION', 'MENU_ABOUT', '오시는길', '/about/location', '오시는길', 4, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 서브 메뉴 (교육과정)
INSERT INTO menu (menu_id, parent_menu_id, menu_name, menu_url, description, sort_order, menu_level, use_yn, created_at, created_by)
VALUES 
('MENU_COURSE_LIST', 'MENU_COURSE', '교육과정목록', '/courses/list', '교육과정 목록', 1, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_COURSE_ONLINE', 'MENU_COURSE', '온라인교육', '/courses/online', '온라인 교육과정', 2, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_COURSE_OFFLINE', 'MENU_COURSE', '집합교육', '/courses/offline', '오프라인 집합 교육과정', 3, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_COURSE_CALENDAR', 'MENU_COURSE', '교육일정', '/courses/calendar', '교육 일정 캘린더', 4, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 서브 메뉴 (마이페이지)
INSERT INTO menu (menu_id, parent_menu_id, menu_name, menu_url, description, sort_order, menu_level, use_yn, created_at, created_by)
VALUES 
('MENU_MYPAGE_DASHBOARD', 'MENU_MYPAGE', '대시보드', '/mypage/dashboard', '마이페이지 대시보드', 1, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_MYPAGE_COURSE', 'MENU_MYPAGE', '내 수강과정', '/mypage/courses', '수강중인 과정 목록', 2, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_MYPAGE_HISTORY', 'MENU_MYPAGE', '학습이력', '/mypage/history', '과거 학습 이력', 3, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_MYPAGE_CERTIFICATE', 'MENU_MYPAGE', '수료증', '/mypage/certificates', '수료증 확인 및 출력', 4, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_MYPAGE_PROFILE', 'MENU_MYPAGE', '회원정보', '/mypage/profile', '회원정보 수정', 5, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 서브 메뉴 (커뮤니티)
INSERT INTO menu (menu_id, parent_menu_id, menu_name, menu_url, description, sort_order, menu_level, use_yn, created_at, created_by)
VALUES 
('MENU_COMMUNITY_NOTICE', 'MENU_COMMUNITY', '공지사항', '/community/notice', '공지사항', 1, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_COMMUNITY_FAQ', 'MENU_COMMUNITY', 'FAQ', '/community/faq', '자주 묻는 질문', 2, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_COMMUNITY_QNA', 'MENU_COMMUNITY', 'Q&A', '/community/qna', '질문과 답변', 3, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 서브 메뉴 (시설안내)
INSERT INTO menu (menu_id, parent_menu_id, menu_name, menu_url, description, sort_order, menu_level, use_yn, created_at, created_by)
VALUES 
('MENU_FACILITY_INFO', 'MENU_FACILITY', '시설안내', '/facility/info', '시설 안내', 1, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_FACILITY_RENT', 'MENU_FACILITY', '대관신청', '/facility/rent', '대관 신청', 2, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_FACILITY_STATUS', 'MENU_FACILITY', '대관현황', '/facility/status', '대관 현황', 3, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 서브 메뉴 (관리자)
INSERT INTO menu (menu_id, parent_menu_id, menu_name, menu_url, description, sort_order, menu_level, use_yn, created_at, created_by)
VALUES 
('MENU_ADMIN_DASHBOARD', 'MENU_ADMIN', '관리자 대시보드', '/admin/dashboard', '관리자 대시보드', 1, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ADMIN_USER', 'MENU_ADMIN', '회원관리', '/admin/users', '회원 관리', 2, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ADMIN_COURSE', 'MENU_ADMIN', '교육과정관리', '/admin/courses', '교육과정 관리', 3, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ADMIN_INSTRUCTOR', 'MENU_ADMIN', '강사관리', '/admin/instructors', '강사 관리', 4, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ADMIN_FACILITY', 'MENU_ADMIN', '시설관리', '/admin/facilities', '시설 관리', 5, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ADMIN_BOARD', 'MENU_ADMIN', '게시판관리', '/admin/boards', '게시판 관리', 6, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ADMIN_STATS', 'MENU_ADMIN', '통계', '/admin/statistics', '통계 관리', 7, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MENU_ADMIN_SYSTEM', 'MENU_ADMIN', '시스템관리', '/admin/system', '시스템 관리', 8, 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 6. 권한 데이터 ------------------------------------------------------
INSERT INTO permission (permission_id, permission_name, description, created_at, created_by)
VALUES 
('PERM_READ', '조회', '읽기 권한', CURRENT_TIMESTAMP, 'SYSTEM'),
('PERM_WRITE', '등록', '쓰기 권한', CURRENT_TIMESTAMP, 'SYSTEM'),
('PERM_EDIT', '수정', '수정 권한', CURRENT_TIMESTAMP, 'SYSTEM'),
('PERM_DELETE', '삭제', '삭제 권한', CURRENT_TIMESTAMP, 'SYSTEM'),
('PERM_ADMIN', '관리', '관리 권한', CURRENT_TIMESTAMP, 'SYSTEM');

-- 7. 역할-메뉴-권한 매핑 데이터 ----------------------------------------------
-- 관리자 권한 매핑 (모든 메뉴에 대한 모든 권한) - 일부만 예시로 작성
INSERT INTO role_menu_permission (role_id, menu_id, permission_id, created_at, created_by)
VALUES 
('ROLE_ADMIN', 'MENU_ADMIN', 'PERM_READ', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_ADMIN', 'MENU_ADMIN', 'PERM_WRITE', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_ADMIN', 'MENU_ADMIN', 'PERM_EDIT', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_ADMIN', 'MENU_ADMIN', 'PERM_DELETE', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_ADMIN', 'MENU_ADMIN', 'PERM_ADMIN', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 운영자 권한 매핑 (일부 메뉴에 대한 일부 권한) - 일부만 예시로 작성
('ROLE_MANAGER', 'MENU_ADMIN_COURSE', 'PERM_READ', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_MANAGER', 'MENU_ADMIN_COURSE', 'PERM_WRITE', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_MANAGER', 'MENU_ADMIN_COURSE', 'PERM_EDIT', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 강사 권한 매핑 - 일부만 예시로 작성
('ROLE_INSTRUCTOR', 'MENU_COURSE', 'PERM_READ', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_INSTRUCTOR', 'MENU_MYPAGE', 'PERM_READ', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_INSTRUCTOR', 'MENU_MYPAGE', 'PERM_EDIT', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 학습자 권한 매핑 - 일부만 예시로 작성
('ROLE_STUDENT', 'MENU_COURSE', 'PERM_READ', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_STUDENT', 'MENU_MYPAGE', 'PERM_READ', CURRENT_TIMESTAMP, 'SYSTEM'),
('ROLE_STUDENT', 'MENU_MYPAGE_PROFILE', 'PERM_EDIT', CURRENT_TIMESTAMP, 'SYSTEM');

-- 8. 교육과정 카테고리 데이터 ----------------------------------------------
INSERT INTO course_category (category_id, category_name, category_level, sort_order, description, use_yn, created_at, created_by)
VALUES 
('CAT_SPORTS_BASIC', '스포츠 기초', 1, 1, '스포츠 기초 이론 및 실습', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('CAT_LEADERSHIP', '리더십/지도자', 1, 2, '스포츠 리더십 및 지도자 과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('CAT_HEALTH', '건강/체력', 1, 3, '건강 증진 및 체력 향상 관련 과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('CAT_SPORTS_SCIENCE', '스포츠과학', 1, 4, '스포츠 과학 및 분석 관련 과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('CAT_REFEREE', '심판/경기운영', 1, 5, '심판 및 경기 운영 관련 과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('CAT_ADMIN', '행정/관리', 1, 6, '스포츠 행정 및 시설 관리 관련 과정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 9. 교육과정 데이터 ------------------------------------------------------
INSERT INTO course (course_id, category_id, course_name, course_type, course_level, credit_hours, max_students, description, learning_objectives, target_audience, prerequisites, thumbnail_image, course_fee, is_free, is_certificate, course_status, is_recommended, created_at, created_by)
VALUES 
-- 온라인 교육과정
('COURSE_OL_001', 'CAT_SPORTS_BASIC', '스포츠 기초 이론', 'ONLINE', 'BEGINNER', 10, 100, 
'스포츠의 기본 원리와 이론에 대해 학습하는 온라인 강좌입니다.', 
'스포츠의 기본적인 이론을 이해하고 적용할 수 있다. 스포츠 분야의 주요 개념을 설명할 수 있다.', 
'스포츠 분야 입문자 및 스포츠에 관심있는 일반인', 
NULL, 
'/images/courses/sports_basic.jpg', 
50000, false, true, 'PUBLISHED', true, 
CURRENT_TIMESTAMP, 'SYSTEM'),

('COURSE_OL_002', 'CAT_LEADERSHIP', '스포츠 지도자 기본과정', 'ONLINE', 'INTERMEDIATE', 15, 80, 
'스포츠 지도자로서 필요한 기본 지식과 기술을 학습하는 온라인 강좌입니다.', 
'스포츠 지도의 원리를 이해하고 현장에서 적용할 수 있다. 효과적인 지도 방법을 습득한다.', 
'기초 스포츠 이론을 알고 있는 예비 지도자, 현직 지도자', 
'스포츠 기초 이론 또는 관련 경험', 
'/images/courses/sports_leader.jpg', 
80000, false, true, 'PUBLISHED', true, 
CURRENT_TIMESTAMP, 'SYSTEM'),

('COURSE_OL_003', 'CAT_HEALTH', '스포츠와 건강관리', 'ONLINE', 'BEGINNER', 8, 120, 
'스포츠를 통한 건강관리 방법과 체력 향상 방법을 배우는 온라인 강좌입니다.', 
'건강한 생활을 위한 운동 방법을 이해하고 실천할 수 있다. 개인별 체력 관리 계획을 수립할 수 있다.', 
'건강관리에 관심있는 일반인, 생활체육 지도자', 
NULL, 
'/images/courses/sports_health.jpg', 
40000, false, true, 'PUBLISHED', false, 
CURRENT_TIMESTAMP, 'SYSTEM'),

-- 오프라인 교육과정
('COURSE_OFF_001', 'CAT_SPORTS_SCIENCE', '스포츠 데이터 분석 실습', 'OFFLINE', 'ADVANCED', 20, 30, 
'스포츠 경기 데이터를 수집하고 분석하는 방법을 실습하는 오프라인 강좌입니다.', 
'스포츠 데이터를 수집하고 분석하는 방법을 익힌다. 데이터 기반의 전략 수립 방법을 배운다.', 
'스포츠 분석가, 지도자, 구단 관계자', 
'기초 통계 지식 필요', 
'/images/courses/sports_data.jpg', 
150000, false, true, 'PUBLISHED', true, 
CURRENT_TIMESTAMP, 'SYSTEM'),

('COURSE_OFF_002', 'CAT_REFEREE', '축구 심판 과정', 'OFFLINE', 'INTERMEDIATE', 30, 25, 
'축구 심판으로 활동하기 위한 이론과 실습을 진행하는 오프라인 강좌입니다.', 
'축구 경기 규칙을 이해하고 적용할 수 있다. 실제 심판 활동을 수행할 수 있는 역량을 갖춘다.', 
'축구 심판에 관심있는 사람, 축구 지도자', 
'축구에 대한 기본 지식 필요', 
'/images/courses/soccer_referee.jpg', 
120000, false, true, 'PUBLISHED', false, 
CURRENT_TIMESTAMP, 'SYSTEM'),

-- 혼합 교육과정
('COURSE_BL_001', 'CAT_ADMIN', '스포츠 시설 안전관리', 'BLENDED', 'INTERMEDIATE', 25, 40, 
'스포츠 시설의 안전한 관리와 운영에 대해 학습하는 온/오프라인 혼합 강좌입니다.', 
'스포츠 시설의 안전 요소를 파악하고 관리할 수 있다. 시설 운영 계획을 수립할 수 있다.', 
'스포츠 시설 관리자, 체육관 운영자', 
'스포츠 시설 관련 기초 지식', 
'/images/courses/facility_safety.jpg', 
100000, false, true, 'PUBLISHED', true, 
CURRENT_TIMESTAMP, 'SYSTEM'),

('COURSE_BL_002', 'CAT_LEADERSHIP', '엘리트 선수 지도과정', 'BLENDED', 'ADVANCED', 40, 20, 
'엘리트 선수를 효과적으로 지도하는 방법에 대한 온/오프라인 혼합 강좌입니다.', 
'엘리트 선수의 특성을 이해하고 효과적인 지도 방법을 익힌다. 심리적 지원과 기술 향상을 위한 코칭 방법을 배운다.', 
'현직 코치, 엘리트 선수 지도자', 
'스포츠 지도 경험 3년 이상', 
'/images/courses/elite_coaching.jpg', 
200000, false, true, 'PUBLISHED', true, 
CURRENT_TIMESTAMP, 'SYSTEM');

-- 10. 교육과정 차수 데이터 ----------------------------------------------
INSERT INTO course_run (run_id, course_id, run_name, run_number, start_date, end_date, registration_start_date, registration_end_date, min_enrollment, max_enrollment, enrollment_count, run_status, created_at, created_by)
VALUES 
-- 온라인 과정 차수
('RUN_OL_001_1', 'COURSE_OL_001', '스포츠 기초 이론 2025년 1기', 1, '2025-05-01', '2025-05-31', '2025-04-01', '2025-04-25', 10, 100, 0, 'UPCOMING', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OL_001_2', 'COURSE_OL_001', '스포츠 기초 이론 2025년 2기', 2, '2025-07-01', '2025-07-31', '2025-06-01', '2025-06-25', 10, 100, 0, 'UPCOMING', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OL_002_1', 'COURSE_OL_002', '스포츠 지도자 기본과정 2025년 1기', 1, '2025-06-01', '2025-07-15', '2025-05-01', '2025-05-25', 15, 80, 0, 'UPCOMING', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OL_003_1', 'COURSE_OL_003', '스포츠와 건강관리 2025년 1기', 1, '2025-05-15', '2025-06-15', '2025-04-15', '2025-05-10', 20, 120, 0, 'UPCOMING', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 오프라인 과정 차수
('RUN_OFF_001_1', 'COURSE_OFF_001', '스포츠 데이터 분석 실습 2025년 1기', 1, '2025-06-10', '2025-06-14', '2025-05-01', '2025-05-31', 10, 30, 0, 'UPCOMING', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OFF_002_1', 'COURSE_OFF_002', '축구 심판 과정 2025년 1기', 1, '2025-05-20', '2025-05-24', '2025-04-01', '2025-04-30', 15, 25, 0, 'UPCOMING', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 혼합 과정 차수
('RUN_BL_001_1', 'COURSE_BL_001', '스포츠 시설 안전관리 2025년 1기', 1, '2025-07-01', '2025-07-31', '2025-06-01', '2025-06-20', 15, 40, 0, 'UPCOMING', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_BL_002_1', 'COURSE_BL_002', '엘리트 선수 지도과정 2025년 1기', 1, '2025-08-01', '2025-08-31', '2025-07-01', '2025-07-20', 10, 20, 0, 'UPCOMING', CURRENT_TIMESTAMP, 'SYSTEM');

-- 11. 교육 일정 데이터 (오프라인 및 혼합 과정) ----------------------------------
INSERT INTO course_schedule (run_id, schedule_date, start_time, end_time, instructor_id, title, description, created_at, created_by)
VALUES 
-- 오프라인 과정 일정
('RUN_OFF_001_1', '2025-06-10', '09:00:00', '17:00:00', 'instructor1', '데이터 분석 이론 과정', '스포츠 데이터 분석의 기본 개념 및 이론 학습', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OFF_001_1', '2025-06-11', '09:00:00', '17:00:00', 'instructor1', '데이터 수집 방법론', '스포츠 경기 데이터 수집 방법 및 도구 활용', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OFF_001_1', '2025-06-12', '09:00:00', '17:00:00', 'instructor1', '데이터 처리 및 시각화', '수집된 데이터의 처리 및 시각화 방법', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OFF_001_1', '2025-06-13', '09:00:00', '17:00:00', 'instructor1', '통계 분석 및 해석', '스포츠 데이터 통계 분석 및 결과 해석', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OFF_001_1', '2025-06-14', '09:00:00', '17:00:00', 'instructor1', '실전 프로젝트', '실제 경기 데이터를 활용한 분석 프로젝트', CURRENT_TIMESTAMP, 'SYSTEM'),

('RUN_OFF_002_1', '2025-05-20', '09:00:00', '17:00:00', 'instructor2', '축구 규칙 이해', '국제 축구 규칙의 이해와 적용', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OFF_002_1', '2025-05-21', '09:00:00', '17:00:00', 'instructor2', '심판 주요 업무', '주심, 부심, 대기심의 역할과 업무', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OFF_002_1', '2025-05-22', '09:00:00', '17:00:00', 'instructor2', '판정 실습 1', '기본적인 반칙과 판정에 대한 실습', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OFF_002_1', '2025-05-23', '09:00:00', '17:00:00', 'instructor2', '판정 실습 2', '복잡한 상황에서의 판정 실습', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_OFF_002_1', '2025-05-24', '09:00:00', '17:00:00', 'instructor2', '실전 모의 경기', '실전 모의 경기를 통한 심판 역할 수행', CURRENT_TIMESTAMP, 'SYSTEM'),

-- 혼합 과정 오프라인 일정
('RUN_BL_001_1', '2025-07-05', '09:00:00', '17:00:00', 'instructor3', '시설 안전 점검 실습', '스포츠 시설 안전 점검 방법 실습', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_BL_001_1', '2025-07-12', '09:00:00', '17:00:00', 'instructor3', '비상 상황 대처 훈련', '비상 상황 발생 시 대처 방법 훈련', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_BL_001_1', '2025-07-19', '09:00:00', '17:00:00', 'instructor3', '안전 관리 계획 수립', '시설별 안전 관리 계획 수립 실습', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_BL_001_1', '2025-07-26', '09:00:00', '17:00:00', 'instructor3', '종합 평가 및 피드백', '안전 관리 계획 발표 및 피드백', CURRENT_TIMESTAMP, 'SYSTEM'),

('RUN_BL_002_1', '2025-08-08', '09:00:00', '17:00:00', 'instructor1', '선수 분석 방법론', '엘리트 선수 분석 및 평가 방법', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_BL_002_1', '2025-08-15', '09:00:00', '17:00:00', 'instructor1', '훈련 프로그램 설계', '개인별 맞춤형 훈련 프로그램 설계', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_BL_002_1', '2025-08-22', '09:00:00', '17:00:00', 'instructor1', '심리 지원 기법', '선수 심리 지원 및 동기 부여 기법', CURRENT_TIMESTAMP, 'SYSTEM'),
('RUN_BL_002_1', '2025-08-29', '09:00:00', '17:00:00', 'instructor1', '종합 코칭 실습', '실전 코칭 시연 및 피드백', CURRENT_TIMESTAMP, 'SYSTEM');

-- 12. 강사 정보 데이터 ------------------------------------------------------
INSERT INTO instructor (instructor_id, user_id, specialty, profile, career, education, profile_image, hourly_rate, bank_name, account_number, account_holder, contract_status, created_at, created_by)
VALUES 
('INST_001', 'instructor1', '스포츠 데이터 분석, 엘리트 선수 지도', 
'스포츠과학 전문가로 다년간의 데이터 분석 및 선수 지도 경험을 보유하고 있습니다.', 
'- 국가대표팀 데이터 분석관 (2018~2022)\n- 프로스포츠팀 기술 분석관 (2015~2018)\n- 스포츠과학연구소 연구원 (2012~2015)', 
'서울대학교 스포츠과학과 박사\n한국체육대학교 스포츠정보학과 석사', 
'/profiles/instructor1.jpg', 
100000, '우리은행', '1002-456-789012', '김강사', 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),

('INST_002', 'instructor2', '심판 교육, 경기 규칙', 
'국제 공인 심판으로 다양한 국내외 대회에서 심판으로 활동한 경험이 있습니다.', 
'- FIFA 국제 심판 (2015~2020)\n- K리그 심판 (2010~2015)\n- 대한축구협회 심판위원회 위원 (2020~현재)', 
'연세대학교 체육학과 학사\nFIFA 국제 심판 과정 수료', 
'/profiles/instructor2.jpg', 
120000, '국민은행', '123-45-6789012', '이강사', 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),

('INST_003', 'instructor3', '스포츠 시설 관리, 안전 관리', 
'다양한 스포츠 시설의 관리 및 운영 경험을 보유한 전문가입니다.', 
'- 대형 스포츠센터 총괄 매니저 (2017~2022)\n- 국제 스포츠 이벤트 시설 담당자 (2014~2017)\n- 체육시설 안전 컨설턴트 (2022~현재)', 
'고려대학교 스포츠산업학과 석사\n안전관리자 1급 자격증 보유', 
'/profiles/instructor3.jpg', 
90000, '신한은행', '110-345-678901', '박강사', 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM');

-- 13. 교육과정 콘텐츠 (온라인 과정) ----------------------------------------------
INSERT INTO course_content (course_id, content_type, title, description, content_url, duration, sort_order, is_required, created_at, created_by)
VALUES 
-- 스포츠 기초 이론 과정 콘텐츠
('COURSE_OL_001', 'VIDEO', '스포츠의 이해', '스포츠의 정의와 역사, 현대 스포츠의 의미', '/contents/videos/sports_basic_01.mp4', 30, 1, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_001', 'VIDEO', '스포츠 생리학 기초', '인체의 움직임과 운동 생리학 기본 원리', '/contents/videos/sports_basic_02.mp4', 45, 2, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_001', 'DOCUMENT', '스포츠 생리학 자료', '스포츠 생리학 주요 개념 정리 자료', '/contents/docs/sports_physiology.pdf', 0, 3, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_001', 'VIDEO', '스포츠 심리학 기초', '스포츠와 심리적 요인의 관계', '/contents/videos/sports_basic_03.mp4', 40, 4, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_001', 'VIDEO', '스포츠 영양학 기초', '운동 선수의 영양 관리와 주요 영양소', '/contents/videos/sports_basic_04.mp4', 35, 5, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_001', 'QUIZ', '1주차 퀴즈', '스포츠 기초 이론 1주차 학습 평가', NULL, 20, 6, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_001', 'VIDEO', '스포츠 역학 기초', '움직임과 힘의 관계, 기본 역학 원리', '/contents/videos/sports_basic_05.mp4', 50, 7, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_001', 'ASSIGNMENT', '기말 과제', '스포츠 과학의 실생활 적용 사례 분석', NULL, 0, 8, true, CURRENT_TIMESTAMP, 'SYSTEM'),

-- 스포츠 지도자 기본과정 콘텐츠
('COURSE_OL_002', 'VIDEO', '스포츠 지도자의 역할', '현대 스포츠에서 지도자의 의미와 역할', '/contents/videos/sports_leader_01.mp4', 40, 1, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_002', 'VIDEO', '효과적인 코칭 방법', '다양한 상황에서의 효과적인 코칭 기법', '/contents/videos/sports_leader_02.mp4', 55, 2, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_002', 'DOCUMENT', '코칭 체크리스트', '효과적인 코칭을 위한 체크리스트', '/contents/docs/coaching_checklist.pdf', 0, 3, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_002', 'VIDEO', '선수 상담 기법', '선수와의 효과적인 의사소통 및 상담 방법', '/contents/videos/sports_leader_03.mp4', 45, 4, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_002', 'VIDEO', '훈련 프로그램 설계', '목표에 맞는 훈련 프로그램 설계 방법', '/contents/videos/sports_leader_04.mp4', 60, 5, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_002', 'QUIZ', '중간 평가', '스포츠 지도자 기본 역량 평가', NULL, 30, 6, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_002', 'VIDEO', '경기 전략과 전술', '종목별 기본 전략과 전술의 이해', '/contents/videos/sports_leader_05.mp4', 50, 7, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_002', 'VIDEO', '스포츠 윤리와 지도자', '스포츠 지도자의 윤리적 책임과 의무', '/contents/videos/sports_leader_06.mp4', 35, 8, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_002', 'ASSIGNMENT', '최종 과제', '맞춤형 코칭 계획 수립', NULL, 0, 9, true, CURRENT_TIMESTAMP, 'SYSTEM'),

-- 스포츠와 건강관리 콘텐츠
('COURSE_OL_003', 'VIDEO', '건강한 생활과 운동', '일상생활에서 운동의 중요성과 효과', '/contents/videos/sports_health_01.mp4', 30, 1, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_003', 'VIDEO', '체력의 구성요소', '건강 체력과 운동 체력의 이해', '/contents/videos/sports_health_02.mp4', 40, 2, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_003', 'DOCUMENT', '체력 측정 방법', '자가 체력 측정 방법 안내', '/contents/docs/fitness_test.pdf', 0, 3, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_003', 'VIDEO', '유산소 운동의 이해', '유산소 운동의 원리와 효과', '/contents/videos/sports_health_03.mp4', 35, 4, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_003', 'VIDEO', '근력 운동의 이해', '근력 운동의 원리와 효과', '/contents/videos/sports_health_04.mp4', 35, 5, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_003', 'QUIZ', '건강 운동 퀴즈', '건강 관리를 위한 운동 지식 평가', NULL, 20, 6, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_003', 'VIDEO', '맞춤형 운동 처방', '개인별 특성에 맞는 운동 처방 방법', '/contents/videos/sports_health_05.mp4', 45, 7, true, CURRENT_TIMESTAMP, 'SYSTEM'),
('COURSE_OL_003', 'ASSIGNMENT', '개인 운동 계획', '4주간의 개인 운동 계획 수립', NULL, 0, 8, true, CURRENT_TIMESTAMP, 'SYSTEM');

-- 14. 교육장 시설 정보 ------------------------------------------------------
INSERT INTO facility (facility_id, facility_name, facility_type, address, zipcode, contact_phone, contact_email, description, image_url, capacity, amenities, created_at, created_by)
VALUES 
('FACILITY_01', '체육인재개발원 본관', 'TRAINING_CENTER', '서울특별시 송파구 올림픽로 424', '05540', '02-123-4567', 'facility@sports.kr', 
'체육인재개발원의 주요 교육 시설로, 다양한 강의실과 실습실을 갖추고 있습니다.', 
'/images/facilities/main_building.jpg', 
500, 
'강의실, 세미나실, 컴퓨터실, 체력단련실, 카페테리아', 
CURRENT_TIMESTAMP, 'SYSTEM'),

('FACILITY_02', '체육인재개발원 실내체육관', 'GYM', '서울특별시 송파구 올림픽로 424', '05540', '02-123-4568', 'gym@sports.kr', 
'다양한 실내 스포츠 활동 및 실습이 가능한 체육관입니다.', 
'/images/facilities/indoor_gym.jpg', 
300, 
'농구장, 배구장, 배드민턴장, 탈의실, 샤워실', 
CURRENT_TIMESTAMP, 'SYSTEM'),

('FACILITY_03', '체육인재개발원 야외운동장', 'FIELD', '서울특별시 송파구 올림픽로 426', '05540', '02-123-4569', 'field@sports.kr', 
'야외 스포츠 활동 및 실습이 가능한 운동장입니다.', 
'/images/facilities/outdoor_field.jpg', 
200, 
'축구장, 육상트랙, 관중석', 
CURRENT_TIMESTAMP, 'SYSTEM');

-- 15. 교육장 강의실 정보 --------------------------------------------------------
INSERT INTO facility_room (room_id, facility_id, room_name, room_type, capacity, equipment, description, image_url, is_available, created_at, created_by)
VALUES 
-- 본관 강의실
('ROOM_101', 'FACILITY_01', '대강의실 101호', 'CLASSROOM', 100, '빔프로젝터, 음향시설, 전자교탁, 화이트보드', 
'100명 수용 가능한 대형 강의실로, 대규모 강의 및 세미나에 적합합니다.', 
'/images/rooms/large_classroom.jpg', true, CURRENT_TIMESTAMP, 'SYSTEM'),

('ROOM_102', 'FACILITY_01', '중강의실 102호', 'CLASSROOM', 50, '빔프로젝터, 음향시설, 전자교탁, 화이트보드', 
'50명 수용 가능한 중형 강의실로, 중규모 강의 및 워크숍에 적합합니다.', 
'/images/rooms/medium_classroom.jpg', true, CURRENT_TIMESTAMP, 'SYSTEM'),

('ROOM_103', 'FACILITY_01', '소강의실 103호', 'CLASSROOM', 30, '빔프로젝터, 음향시설, 화이트보드', 
'30명 수용 가능한 소형 강의실로, 소규모 강의 및 토론에 적합합니다.', 
'/images/rooms/small_classroom.jpg', true, CURRENT_TIMESTAMP, 'SYSTEM'),

('ROOM_201', 'FACILITY_01', '컴퓨터실 201호', 'LAB', 40, '컴퓨터 40대, 빔프로젝터, 강사용 컴퓨터, 음향시설', 
'데이터 분석 및 IT 실습을 위한 컴퓨터실입니다.', 
'/images/rooms/computer_lab.jpg', true, CURRENT_TIMESTAMP, 'SYSTEM'),

('ROOM_202', 'FACILITY_01', '세미나실 202호', 'SEMINAR', 20, '원형 테이블, 빔프로젝터, 화이트보드, 음향시설', 
'소규모 세미나 및 토론을 위한 세미나실입니다.', 
'/images/rooms/seminar_room.jpg', true, CURRENT_TIMESTAMP, 'SYSTEM'),

-- 실내체육관 공간
('ROOM_GYM_01', 'FACILITY_02', '주경기장', 'GYM', 200, '농구골대, 배구네트, 배드민턴네트, 음향시설', 
'다목적 실내 경기장으로 다양한 실내 스포츠 활동이 가능합니다.', 
'/images/rooms/main_gym.jpg', true, CURRENT_TIMESTAMP, 'SYSTEM'),

('ROOM_GYM_02', 'FACILITY_02', '보조경기장', 'GYM', 100, '배드민턴네트, 탁구대, 음향시설', 
'소규모 실내 스포츠 활동을 위한 보조 경기장입니다.', 
'/images/rooms/sub_gym.jpg', true, CURRENT_TIMESTAMP, 'SYSTEM'),

('ROOM_GYM_03', 'FACILITY_02', '체력단련실', 'LAB', 30, '러닝머신, 웨이트 기구, 스트레칭 공간', 
'체력 측정 및 단련을 위한 전문 시설입니다.', 
'/images/rooms/fitness_lab.jpg', true, CURRENT_TIMESTAMP, 'SYSTEM');

-- 16. 게시판 정보 --------------------------------------------------------
INSERT INTO board (board_id, board_name, board_type, description, use_category, use_comment, use_file, read_permission, write_permission, sort_order, use_yn, created_at, created_by)
VALUES 
('BOARD_NOTICE', '공지사항', 'NOTICE', '체육인재개발원의 주요 공지사항을 안내하는 게시판입니다.', false, false, true, 'ALL', 'ROLE', 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_FAQ', 'FAQ', 'FAQ', '자주 묻는 질문과 답변을 모아놓은 게시판입니다.', true, false, false, 'ALL', 'ROLE', 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_QNA', 'Q&A', 'QNA', '질문과 답변을 위한 게시판입니다.', true, true, true, 'ALL', 'MEMBER', 3, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_FREE', '자유게시판', 'COMMUNITY', '자유롭게 의견을 나눌 수 있는 게시판입니다.', false, true, true, 'MEMBER', 'MEMBER', 4, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_GALLERY', '갤러리', 'GALLERY', '교육 및 행사 관련 사진을 공유하는 게시판입니다.', false, true, true, 'ALL', 'MEMBER', 5, 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 17. 게시판 카테고리 (FAQ, Q&A 게시판용) ------------------------------------
INSERT INTO board_category (board_id, category_name, sort_order, use_yn, created_at, created_by)
VALUES 
-- FAQ 카테고리
('BOARD_FAQ', '회원 관련', 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_FAQ', '교육과정 관련', 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_FAQ', '수강신청 관련', 3, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_FAQ', '결제/환불 관련', 4, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_FAQ', '시설 이용 관련', 5, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),

-- Q&A 카테고리
('BOARD_QNA', '회원 문의', 1, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_QNA', '교육과정 문의', 2, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_QNA', '수강신청 문의', 3, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_QNA', '결제/환불 문의', 4, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_QNA', '시스템 오류 문의', 5, 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('BOARD_QNA', '기타 문의', 6, 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 18. 공지사항 게시글 ----------------------------------------------------
INSERT INTO post (board_id, user_id, title, content, is_notice, view_count, created_at)
VALUES 
('BOARD_NOTICE', 'admin', '2025년 체육인재개발원 교육과정 안내', 
'안녕하세요, 체육인재개발원입니다.\n\n2025년 체육인재개발원의 다양한 교육과정을 안내드립니다. 올해는 온라인, 오프라인, 혼합 과정 등 다양한 방식으로 교육을 제공할 예정입니다.\n\n자세한 교육 일정 및 내용은 홈페이지의 교육과정 메뉴에서 확인하실 수 있습니다.\n\n많은 관심과 참여 부탁드립니다.', 
true, 145, CURRENT_TIMESTAMP - INTERVAL '10 days'),

('BOARD_NOTICE', 'admin', '교육과정 신청 방법 안내', 
'안녕하세요, 체육인재개발원입니다.\n\n교육과정 신청 방법을 안내드립니다.\n\n1. 회원가입 후 로그인\n2. 교육과정 메뉴에서 희망 과정 검색\n3. 과정 상세 페이지에서 신청 버튼 클릭\n4. 신청 정보 입력 후 결제(무료 과정은 결제 단계 생략)\n5. 신청 완료\n\n신청 관련 문의사항은 Q&A 게시판 또는 전화(02-123-4567)로 문의해 주시기 바랍니다.', 
true, 120, CURRENT_TIMESTAMP - INTERVAL '8 days'),

('BOARD_NOTICE', 'admin', '사이트 점검 안내 (5월 1일 00시~04시)', 
'안녕하세요, 체육인재개발원입니다.\n\n시스템 안정화를 위한 정기 점검을 실시합니다.\n\n- 점검 일시: 2025년 5월 1일 00시~04시\n- 점검 내용: 서버 안정화 및 보안 업데이트\n\n점검 시간 동안에는 사이트 이용이 제한될 수 있습니다. 이용에 참고해 주시기 바랍니다.\n\n감사합니다.', 
true, 95, CURRENT_TIMESTAMP - INTERVAL '5 days'),

('BOARD_NOTICE', 'admin', '체육인재개발원 모바일 앱 출시 안내', 
'안녕하세요, 체육인재개발원입니다.\n\n이제 모바일에서도 편리하게 체육인재개발원의 교육과정을 수강하실 수 있습니다.\n\n- 주요 기능\n  * 교육과정 검색 및 신청\n  * 온라인 강의 수강\n  * 학습 진도 관리\n  * 알림 서비스\n\n앱스토어와 구글 플레이에서 \"체육인재개발원\"을 검색하여 다운로드해 주세요.\n\n더욱 편리한 서비스로 찾아뵙겠습니다.', 
false, 78, CURRENT_TIMESTAMP - INTERVAL '3 days'),

('BOARD_NOTICE', 'admin', '2025년 2분기 신규 교육과정 오픈 안내', 
'안녕하세요, 체육인재개발원입니다.\n\n2025년 2분기 신규 교육과정이 오픈되었습니다.\n\n- 스포츠 심리학 기초\n- 선수 부상 예방 및 관리\n- 스포츠 시설 안전 관리\n- 유소년 스포츠 지도법\n\n자세한 내용은 교육과정 페이지에서 확인하실 수 있습니다.\n\n많은 관심과 참여 부탁드립니다.', 
false, 62, CURRENT_TIMESTAMP - INTERVAL '1 day');

-- 19. FAQ 게시글 --------------------------------------------------------
INSERT INTO FAQ (category_id, question, answer, view_count, sort_order, created_at, created_by)
VALUES 
-- 회원 관련 FAQ
(1, '회원가입은 어떻게 하나요?', 
'홈페이지 우측 상단의 회원가입 버튼을 클릭하여 가입 절차를 진행할 수 있습니다. 이메일 인증 후 가입이 완료됩니다.', 
85, 1, CURRENT_TIMESTAMP, 'admin'),

(1, '비밀번호를 잊어버렸습니다. 어떻게 해야 하나요?', 
'로그인 페이지에서 "비밀번호 찾기" 버튼을 클릭하여 가입 시 등록한 이메일로 임시 비밀번호를 받으실 수 있습니다.', 
76, 2, CURRENT_TIMESTAMP, 'admin'),

-- 교육과정 관련 FAQ
(2, '교육과정은 어떤 종류가 있나요?', 
'온라인 과정, 오프라인 과정, 혼합 과정으로 구분됩니다. 온라인 과정은 인터넷을 통해 언제 어디서나 수강 가능하며, 오프라인 과정은 지정된 장소에서 대면으로 진행됩니다. 혼합 과정은 온라인과 오프라인을 병행하는, 온·오프라인 과정은 조회된 웹상에서 세부내용을 확인할 수 있습니다.', 
92, 3, CURRENT_TIMESTAMP, 'admin'),

(2, '교육과정 이수 기준은 무엇인가요?', 
'온라인 과정은 총 차시의 80% 이상 수강 및 과제/평가 60점 이상 취득 시 이수로 인정됩니다. 오프라인 과정은 출석률 80% 이상 및 과제/평가 60점 이상 취득 시 이수로 인정됩니다.', 
88, 4, CURRENT_TIMESTAMP, 'admin'),

-- 수강신청 관련 FAQ
(3, '수강신청은 어떻게 하나요?', 
'로그인 후 교육과정 메뉴에서 원하는 과정을 선택하여 상세 페이지로 이동한 후, "수강신청" 버튼을 클릭하여 신청할 수 있습니다.', 
105, 5, CURRENT_TIMESTAMP, 'admin'),

(3, '단체 수강신청도 가능한가요?', 
'네, 가능합니다. 교육과정 상세 페이지에서 "단체 수강신청" 버튼을 클릭하여 신청할 수 있습니다. 10명 이상 단체 신청 시 담당자에게 문의해 주시기 바랍니다.', 
72, 6, CURRENT_TIMESTAMP, 'admin'),

-- 결제/환불 관련 FAQ
(4, '수강료 결제 방법은 어떻게 되나요?', 
'신용카드, 계좌이체, 가상계좌 등 다양한 결제 방법을 지원합니다. 수강신청 시 결제 페이지에서 원하는 결제 방법을 선택할 수 있습니다.', 
94, 7, CURRENT_TIMESTAMP, 'admin'),

(4, '환불 규정은 어떻게 되나요?', 
'과정 시작 7일 전까지 100% 환불, 과정 시작 3일 전까지 70% 환불, 과정 시작 1일 전까지 50% 환불이 가능합니다. 과정 시작 후에는 규정에 따라 환불 금액이 차감될 수 있습니다. 자세한 내용은 고객센터로 문의해 주세요.', 
103, 8, CURRENT_TIMESTAMP, 'admin'),

-- 시설 이용 관련 FAQ
(5, '시설 대관은 어떻게 신청하나요?', 
'로그인 후 시설안내 메뉴에서 대관 신청 페이지로 이동하여 원하는 시설과 일정을 선택 후 신청할 수 있습니다. 대관 승인 후 이용이 가능합니다.', 
67, 9, CURRENT_TIMESTAMP, 'admin'),

(5, '시설 이용 시간은 어떻게 되나요?', 
'일반적으로 오전 9시부터 오후 6시까지 이용 가능합니다. 단, 시설별로 이용 시간이 다를 수 있으니 시설안내 페이지에서 확인해 주시기 바랍니다.', 
71, 10, CURRENT_TIMESTAMP, 'admin');

-- 20. 시스템 설정 데이터 --------------------------------------------------
INSERT INTO system_config (config_id, config_name, config_value, config_type, description, use_yn, created_at, created_by)
VALUES 
('EMAIL_SENDER', '이메일 발신자', 'noreply@sports.kr', 'STRING', '시스템 이메일 발신자 주소', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('EMAIL_TITLE_PREFIX', '이메일 제목 접두사', '[체육인재개발원]', 'STRING', '발송되는 이메일의 제목 접두사', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('SMS_SENDER', 'SMS 발신번호', '0212345678', 'STRING', 'SMS 발신번호', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('FILE_UPLOAD_PATH', '파일 업로드 경로', '/var/www/uploads', 'STRING', '파일 업로드 저장 경로', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MAX_FILE_SIZE', '최대 파일 크기', '10485760', 'NUMBER', '업로드 가능한 최대 파일 크기(바이트)', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('ALLOWED_FILE_TYPES', '허용 파일 형식', 'jpg,jpeg,png,gif,pdf,doc,docx,xls,xlsx,ppt,pptx,zip', 'STRING', '업로드 허용 파일 확장자', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('SESSION_TIMEOUT', '세션 타임아웃', '3600', 'NUMBER', '세션 타임아웃 시간(초)', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('USE_CAPTCHA', 'CAPTCHA 사용 여부', 'Y', 'BOOLEAN', '로그인 CAPTCHA 사용 여부', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('MAINTENANCE_MODE', '유지보수 모드', 'N', 'BOOLEAN', '사이트 유지보수 모드 설정', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('SERVICE_TERMS', '서비스 이용약관', '{"version": "1.0", "last_updated": "2025-01-01", "content": "체육인재개발원 서비스 이용약관..."}', 'JSON', '서비스 이용약관 정보', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),
('PRIVACY_POLICY', '개인정보처리방침', '{"version": "1.0", "last_updated": "2025-01-01", "content": "체육인재개발원 개인정보처리방침..."}', 'JSON', '개인정보처리방침 정보', 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 21. 약관 정보 ----------------------------------------------------------
INSERT INTO terms (terms_type, terms_title, terms_content, required, version, apply_date, status, created_at, created_by)
VALUES 
('SERVICE', '서비스 이용약관', '제1조 (목적)\n이 약관은 체육인재개발원(이하 "개발원"이라 합니다)이 제공하는 서비스의 이용 조건 및 절차, 이용자와 개발원의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.\n\n제2조 (용어의 정의)\n이 약관에서 사용하는 용어의 정의는 다음과 같습니다.\n1. "서비스"라 함은 개발원이 제공하는 교육과정, 시설 대관 등의 서비스를 의미합니다.\n2. "이용자"라 함은 개발원에 접속하여 이 약관에 따라 개발원이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.\n3. "회원"이라 함은 개발원에 개인정보를 제공하여 회원등록을 한 자로서, 개발원의 정보를 지속적으로 제공받으며, 개발원이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.\n\n... (이하 생략) ...', 
true, '1.0', '2025-01-01', 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),

('PRIVACY', '개인정보처리방침', '체육인재개발원(이하 "개발원"이라 함)은 개인정보보호법 등 관련 법령상의 개인정보보호 규정을 준수하며, 이용자의 개인정보 보호에 최선을 다하고 있습니다.\n\n1. 수집하는 개인정보 항목\n- 필수항목: 이름, 생년월일, 성별, 아이디, 비밀번호, 이메일, 휴대폰번호\n- 선택항목: 주소, 직업, 관심분야\n\n2. 개인정보의 수집 및 이용목적\n- 회원 관리: 회원제 서비스 이용에 따른 본인확인, 개인식별, 가입의사 확인, 불만처리 등 민원처리, 공지사항 전달\n- 서비스 제공: 교육과정 신청 및 관리, 수료증 발급, 시설 예약 서비스 등\n\n... (이하 생략) ...', 
true, '1.0', '2025-01-01', 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM'),

('MARKETING', '마케팅 정보 수신 동의', '체육인재개발원(이하 "개발원"이라 함)에서 제공하는 교육과정, 이벤트 등의 다양한 정보를 이메일, SMS 등을 통해 받아보실 수 있습니다.\n\n1. 마케팅 정보 수신 동의 안내\n- 수신 정보: 신규 교육과정 안내, 이벤트 정보, 맞춤형 교육과정 추천 등\n- 수신 방법: 이메일, SMS, 푸시알림 등\n\n2. 수신 동의 거부 권리\n- 마케팅 정보 수신 동의를 거부할 수 있으며, 거부 시에도 기본 서비스 이용에는 제한이 없습니다.\n- 단, 중요 공지사항 등 서비스 이용에 필요한 정보는 수신 동의 여부와 관계없이 발송됩니다.\n\n... (이하 생략) ...', 
false, '1.0', '2025-01-01', 'ACTIVE', CURRENT_TIMESTAMP, 'SYSTEM');

-- 22. 이메일 템플릿 -------------------------------------------------------
INSERT INTO email_template (template_name, template_code, subject, content, template_type, use_yn, created_at, created_by)
VALUES 
('회원가입 환영', 'WELCOME', '[체육인재개발원] 회원가입을 환영합니다.', 
'<div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px;">\n
<h2 style="color: #0066cc;">체육인재개발원 회원가입을 환영합니다!</h2>\n
<p>안녕하세요, {{user_name}}님!</p>\n
<p>체육인재개발원 회원이 되신 것을 진심으로 환영합니다.</p>\n
<p>이제 다양한 교육과정을 수강하고, 전문적인 스포츠 지식을 습득하실 수 있습니다.</p>\n
<p>궁금한 점이 있으시면 언제든지 고객센터로 문의해 주세요.</p>\n
<p>감사합니다.</p>\n
<div style="margin-top: 30px; padding-top: 10px; border-top: 1px solid #ddd; font-size: 12px; color: #666;">\n
<p>본 메일은 발신 전용이며, 문의사항은 고객센터(02-123-4567)로 연락해 주시기 바랍니다.</p>\n
</div>\n
</div>', 
'HTML', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),

('수강신청 완료', 'ENROLLMENT', '[체육인재개발원] 수강신청이 완료되었습니다.', 
'<div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px;">\n
<h2 style="color: #0066cc;">수강신청이 완료되었습니다.</h2>\n
<p>안녕하세요, {{user_name}}님!</p>\n
<p><strong>{{course_name}}</strong> 과정의 수강신청이 완료되었습니다.</p>\n
<p><strong>교육 기간:</strong> {{start_date}} ~ {{end_date}}</p>\n
<p><strong>교육 방식:</strong> {{course_type}}</p>\n
<p>교육과정에 대한 자세한 정보는 마이페이지에서 확인하실 수 있습니다.</p>\n
<p><a href="https://sports.kr/mypage" style="display: inline-block; padding: 10px 20px; background-color: #0066cc; color: white; text-decoration: none; border-radius: 3px;">마이페이지 바로가기</a></p>\n
<p>감사합니다.</p>\n
<div style="margin-top: 30px; padding-top: 10px; border-top: 1px solid #ddd; font-size: 12px; color: #666;">\n
<p>본 메일은 발신 전용이며, 문의사항은 고객센터(02-123-4567)로 연락해 주시기 바랍니다.</p>\n
</div>\n
</div>', 
'HTML', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),


('교육과정 시작 안내', 'COURSE_START', '[체육인재개발원] 교육과정 시작 안내', 
'<div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px;">\n
<h2 style="color: #0066cc;">교육과정이 곧 시작됩니다!</h2>\n
<p>안녕하세요, {{user_name}}님!</p>\n
<p>신청하신 <strong>{{course_name}}</strong> 과정이 내일부터 시작됩니다.</p>\n
<p><strong>교육 기간:</strong> {{start_date}} ~ {{end_date}}</p>\n
<p><strong>교육 방식:</strong> {{course_type}}</p>\n
<p>온라인 과정은 LMS에 접속하여 수강하실 수 있으며, 오프라인 과정은 지정된 장소에서 진행됩니다.</p>\n
<p>교육과정에 대한 자세한 정보는 마이페이지에서 확인하실 수 있습니다.</p>\n
<p><a href="https://sports.kr/mypage" style="display: inline-block; padding: 10px 20px; background-color: #0066cc; color: white; text-decoration: none; border-radius: 3px;">마이페이지 바로가기</a></p>\n
<p>감사합니다.</p>\n
<div style="margin-top: 30px; padding-top: 10px; border-top: 1px solid #ddd; font-size: 12px; color: #666;">\n
<p>본 메일은 발신 전용이며, 문의사항은 고객센터(02-123-4567)로 연락해 주시기 바랍니다.</p>\n
</div>\n
</div>', 
'HTML', 'Y', CURRENT_TIMESTAMP, 'SYSTEM'),

('수료증 발급 안내', 'CERTIFICATE', '[체육인재개발원] 교육과정 수료증 발급 안내', 
'<div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px;">\n
<h2 style="color: #0066cc;">교육과정 수료를 축하합니다!</h2>\n
<p>안녕하세요, {{user_name}}님!</p>\n
<p><strong>{{course_name}}</strong> 과정을 성공적으로 수료하셨습니다.</p>\n
<p>수료증은 마이페이지에서 확인 및 출력하실 수 있습니다.</p>\n
<p><strong>수료증 번호:</strong> {{certificate_number}}</p>\n
<p><strong>수료일:</strong> {{completion_date}}</p>\n
<p><a href="https://sports.kr/mypage/certificates" style="display: inline-block; padding: 10px 20px; background-color: #0066cc; color: white; text-decoration: none; border-radius: 3px;">수료증 확인하기</a></p>\n
<p>앞으로도 체육인재개발원의 다양한 교육과정에 참여해 주시기 바랍니다.</p>\n
<p>감사합니다.</p>\n
<div style="margin-top: 30px; padding-top: 10px; border-top: 1px solid #ddd; font-size: 12px; color: #666;">\n
<p>본 메일은 발신 전용이며, 문의사항은 고객센터(02-123-4567)로 연락해 주시기 바랍니다.</p>\n
</div>\n
</div>', 
'HTML', 'Y', CURRENT_TIMESTAMP, 'SYSTEM');

-- 23. 수강신청 데이터 (몇 개의 예시 데이터) ----------------------------------
INSERT INTO enrollment (user_id, course_id, run_id, enrollment_status, enrollment_date, created_at, created_by)
VALUES 
-- 학생1의 수강신청
('student1', 'COURSE_OL_001', 'RUN_OL_001_1', 'APPROVED', CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days', 'student1'),
('student1', 'COURSE_OFF_001', 'RUN_OFF_001_1', 'APPROVED', CURRENT_TIMESTAMP - INTERVAL '4 days', CURRENT_TIMESTAMP - INTERVAL '4 days', 'student1'),

-- 학생2의 수강신청
('student2', 'COURSE_OL_002', 'RUN_OL_002_1', 'APPROVED', CURRENT_TIMESTAMP - INTERVAL '6 days', CURRENT_TIMESTAMP - INTERVAL '6 days', 'student2'),
('student2', 'COURSE_BL_001', 'RUN_BL_001_1', 'PENDING', CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day', 'student2'),

-- 학생3의 수강신청
('student3', 'COURSE_OL_001', 'RUN_OL_001_1', 'APPROVED', CURRENT_TIMESTAMP - INTERVAL '7 days', CURRENT_TIMESTAMP - INTERVAL '7 days', 'student3'),
('student3', 'COURSE_OL_003', 'RUN_OL_003_1', 'APPROVED', CURRENT_TIMESTAMP - INTERVAL '3 days', CURRENT_TIMESTAMP - INTERVAL '3 days', 'student3'),

-- 학생4의 수강신청
('student4', 'COURSE_OL_002', 'RUN_OL_002_1', 'APPROVED', CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days', 'student4'),
('student4', 'COURSE_OFF_002', 'RUN_OFF_002_1', 'APPROVED', CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '2 days', 'student4'),

-- 학생5의 수강신청
('student5', 'COURSE_OL_003', 'RUN_OL_003_1', 'APPROVED', CURRENT_TIMESTAMP - INTERVAL '4 days', CURRENT_TIMESTAMP - INTERVAL '4 days', 'student5'),
('student5', 'COURSE_BL_002', 'RUN_BL_002_1', 'PENDING', CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day', 'student5');

-- 24. 교육과정 차수 카운트 업데이트 ------------------------------------------
UPDATE course_run SET enrollment_count = (
    SELECT COUNT(*) FROM enrollment 
    WHERE enrollment.run_id = course_run.run_id AND enrollment_status != 'CANCELLED'
);

-- 25. 온라인 학습 진도 데이터 (몇 개의 예시 데이터) ---------------------------
INSERT INTO learning_progress (user_id, course_id, run_id, content_id, start_time, end_time, progress_rate, is_completed, last_position, created_at, updated_at)
VALUES 
-- 학생1의 학습 진도
('student1', 'COURSE_OL_001', 'RUN_OL_001_1', 1, CURRENT_TIMESTAMP - INTERVAL '4 days', CURRENT_TIMESTAMP - INTERVAL '4 days' + INTERVAL '30 minutes', 100, true, 1800, CURRENT_TIMESTAMP - INTERVAL '4 days', CURRENT_TIMESTAMP - INTERVAL '4 days' + INTERVAL '30 minutes'),
('student1', 'COURSE_OL_001', 'RUN_OL_001_1', 2, CURRENT_TIMESTAMP - INTERVAL '3 days', CURRENT_TIMESTAMP - INTERVAL '3 days' + INTERVAL '45 minutes', 100, true, 2700, CURRENT_TIMESTAMP - INTERVAL '3 days', CURRENT_TIMESTAMP - INTERVAL '3 days' + INTERVAL '45 minutes'),
('student1', 'COURSE_OL_001', 'RUN_OL_001_1', 3, CURRENT_TIMESTAMP - INTERVAL '3 days', CURRENT_TIMESTAMP - INTERVAL '3 days' + INTERVAL '10 minutes', 100, true, 0, CURRENT_TIMESTAMP - INTERVAL '3 days', CURRENT_TIMESTAMP - INTERVAL '3 days' + INTERVAL '10 minutes'),
('student1', 'COURSE_OL_001', 'RUN_OL_001_1', 4, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '2 days' + INTERVAL '40 minutes', 100, true, 2400, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '2 days' + INTERVAL '40 minutes'),
('student1', 'COURSE_OL_001', 'RUN_OL_001_1', 5, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '35 minutes', 100, true, 2100, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '35 minutes'),
('student1', 'COURSE_OL_001', 'RUN_OL_001_1', 6, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '20 minutes', 100, true, 0, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '20 minutes'),
('student1', 'COURSE_OL_001', 'RUN_OL_001_1', 7, CURRENT_TIMESTAMP - INTERVAL '12 hours', NULL, 60, false, 1800, CURRENT_TIMESTAMP - INTERVAL '12 hours', CURRENT_TIMESTAMP - INTERVAL '12 hours'),

-- 학생3의 학습 진도
('student3', 'COURSE_OL_001', 'RUN_OL_001_1', 1, CURRENT_TIMESTAMP - INTERVAL '6 days', CURRENT_TIMESTAMP - INTERVAL '6 days' + INTERVAL '30 minutes', 100, true, 1800, CURRENT_TIMESTAMP - INTERVAL '6 days', CURRENT_TIMESTAMP - INTERVAL '6 days' + INTERVAL '30 minutes'),
('student3', 'COURSE_OL_001', 'RUN_OL_001_1', 2, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days' + INTERVAL '45 minutes', 100, true, 2700, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days' + INTERVAL '45 minutes'),
('student3', 'COURSE_OL_001', 'RUN_OL_001_1', 3, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days' + INTERVAL '10 minutes', 100, true, 0, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days' + INTERVAL '10 minutes'),
('student3', 'COURSE_OL_001', 'RUN_OL_001_1', 4, CURRENT_TIMESTAMP - INTERVAL '4 days', CURRENT_TIMESTAMP - INTERVAL '4 days' + INTERVAL '40 minutes', 100, true, 2400, CURRENT_TIMESTAMP - INTERVAL '4 days', CURRENT_TIMESTAMP - INTERVAL '4 days' + INTERVAL '40 minutes'),
('student3', 'COURSE_OL_001', 'RUN_OL_001_1', 5, CURRENT_TIMESTAMP - INTERVAL '3 days', CURRENT_TIMESTAMP - INTERVAL '3 days' + INTERVAL '35 minutes', 100, true, 2100, CURRENT_TIMESTAMP - INTERVAL '3 days', CURRENT_TIMESTAMP - INTERVAL '3 days' + INTERVAL '35 minutes'),
('student3', 'COURSE_OL_001', 'RUN_OL_001_1', 6, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '2 days' + INTERVAL '20 minutes', 100, true, 0, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '2 days' + INTERVAL '20 minutes'),
('student3', 'COURSE_OL_001', 'RUN_OL_001_1', 7, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '50 minutes', 100, true, 3000, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '50 minutes'),
('student3', 'COURSE_OL_001', 'RUN_OL_001_1', 8, CURRENT_TIMESTAMP - INTERVAL '12 hours', NULL, 80, false, 0, CURRENT_TIMESTAMP - INTERVAL '12 hours', CURRENT_TIMESTAMP - INTERVAL '12 hours'),

-- 학생3의 다른 과정 학습 진도
('student3', 'COURSE_OL_003', 'RUN_OL_003_1', 1, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '2 days' + INTERVAL '30 minutes', 100, true, 1800, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '2 days' + INTERVAL '30 minutes'),
('student3', 'COURSE_OL_003', 'RUN_OL_003_1', 2, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '2 days' + INTERVAL '40 minutes', 100, true, 2400, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '2 days' + INTERVAL '40 minutes'),
('student3', 'COURSE_OL_003', 'RUN_OL_003_1', 3, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '10 minutes', 100, true, 0, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '10 minutes'),
('student3', 'COURSE_OL_003', 'RUN_OL_003_1', 4, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '35 minutes', 100, true, 2100, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day' + INTERVAL '35 minutes'),
('student3', 'COURSE_OL_003', 'RUN_OL_003_1', 5, CURRENT_TIMESTAMP - INTERVAL '6 hours', NULL, 40, false, 840, CURRENT_TIMESTAMP - INTERVAL '6 hours', CURRENT_TIMESTAMP - INTERVAL '6 hours');

-- 26. 시험 데이터 -----------------------------------------------------------
INSERT INTO exam (course_id, run_id, exam_name, exam_type, total_score, passing_score, exam_duration, available_from, available_until, description, created_at, created_by)
VALUES 
('COURSE_OL_001', 'RUN_OL_001_1', '스포츠 기초 이론 중간평가', 'MIDTERM', 100, 60, 60, 
 CURRENT_TIMESTAMP + INTERVAL '10 days', CURRENT_TIMESTAMP + INTERVAL '12 days', 
 '스포츠 기초 이론 1~4주차 내용에 대한 중간평가입니다. 60분 동안 20문항을 풀이해야 합니다.', 
 CURRENT_TIMESTAMP, 'admin'),
 
('COURSE_OL_001', 'RUN_OL_001_1', '스포츠 기초 이론 최종평가', 'FINAL', 100, 60, 90, 
 CURRENT_TIMESTAMP + INTERVAL '25 days', CURRENT_TIMESTAMP + INTERVAL '27 days', 
 '스포츠 기초 이론 전체 내용에 대한 최종평가입니다. 90분 동안 30문항을 풀이해야 합니다.', 
 CURRENT_TIMESTAMP, 'admin'),
 
('COURSE_OL_002', 'RUN_OL_002_1', '스포츠 지도자 기본과정 평가', 'FINAL', 100, 70, 120, 
 CURRENT_TIMESTAMP + INTERVAL '40 days', CURRENT_TIMESTAMP + INTERVAL '42 days', 
 '스포츠 지도자 기본과정 전체 내용에 대한 평가입니다. 120분 동안 객관식과 주관식 문항을 풀이해야 합니다.', 
 CURRENT_TIMESTAMP, 'admin');

-- 27. 시험 문항 데이터 -------------------------------------------------------
INSERT INTO question (exam_id, question_type, question_text, options, correct_answer, score, difficulty, explanation, sort_order, created_at, created_by)
VALUES 
-- 스포츠 기초 이론 중간평가 문항 (일부만 예시로 작성)
(1, 'MULTIPLE_CHOICE', '다음 중 스포츠의 정의로 가장 적절한 것은?', 
 '{"a": "육체적 경쟁을 통한 승패를 겨루는 활동", "b": "규칙에 따라 경쟁하는 신체적 활동", "c": "건강 증진을 위한 모든 신체 활동", "d": "여가 시간에 즐기는 모든 활동"}', 
 'b', 5, 'EASY', 
 '스포츠는 규칙에 따라 경쟁하는 신체적 활동을 의미합니다.', 
 1, CURRENT_TIMESTAMP, 'admin'),

(1, 'MULTIPLE_CHOICE', '다음 중 유산소 운동의 특징이 아닌 것은?', 
 '{"a": "장시간 지속적으로 수행한다.", "b": "낮은 강도로 진행된다.", "c": "산소를 많이 사용한다.", "d": "근육의 크기를 증가시키는 것이 주목적이다."}', 
 'd', 5, 'MEDIUM', 
 '유산소 운동은 지속적으로 산소를 사용하여 장시간 낮은 강도로 수행하는 운동입니다. 근육의 크기 증가는 주로 무산소 운동(근력 운동)의 효과입니다.', 
 2, CURRENT_TIMESTAMP, 'admin'),

(1, 'TRUE_FALSE', '스포츠 심리학은 운동 선수들의 심리 상태만을 연구하는 학문이다.', 
 NULL, 
 'false', 5, 'EASY', 
 '스포츠 심리학은 운동 선수뿐만 아니라 일반인의 운동 참여와 관련된 심리적 요인, 지도자의 심리, 팀 역학 등 다양한 영역을 연구합니다.', 
 3, CURRENT_TIMESTAMP, 'admin'),

(1, 'MULTIPLE_CHOICE', '다음 중 근력 운동의 원리로 가장 적절한 것은?', 
 '{"a": "과부하의 원리", "b": "균형의 원리", "c": "자율성의 원리", "d": "연속성의 원리"}', 
 'a', 5, 'MEDIUM', 
 '과부하의 원리는 근육이 평소보다 더 큰 부하에 노출될 때 적응하여 더 강해진다는 원리로, 근력 운동의 기본 원리입니다.', 
 4, CURRENT_TIMESTAMP, 'admin'),

(1, 'SHORT_ANSWER', '스포츠 영양학에서 경기 전에 섭취하기 좋은 영양소는 무엇인가?', 
 NULL, 
 '탄수화물', 5, 'MEDIUM', 
 '탄수화물은 경기 중 에너지원으로 빠르게 사용될 수 있어 경기 전에 섭취하기 좋은 영양소입니다.', 
 5, CURRENT_TIMESTAMP, 'admin');

-- 28. 설문조사 데이터 --------------------------------------------------------
INSERT INTO survey (survey_name, description, survey_type, target_type, course_id, run_id, is_anonymous, is_required, available_from, available_until, status, created_at, created_by)
VALUES 
('교육 만족도 조사', '교육과정 수료 후 만족도를 평가하기 위한 설문조사입니다.', 'COURSE', 'STUDENT', 'COURSE_OL_001', 'RUN_OL_001_1', 
 true, true, CURRENT_TIMESTAMP + INTERVAL '28 days', CURRENT_TIMESTAMP + INTERVAL '35 days', 'PUBLISHED', CURRENT_TIMESTAMP, 'admin'),

('강사 평가', '강사의 강의 능력과 교육 내용에 대한 평가를 위한 설문조사입니다.', 'COURSE', 'STUDENT', 'COURSE_OFF_001', 'RUN_OFF_001_1', 
 true, true, CURRENT_TIMESTAMP + INTERVAL '14 days', CURRENT_TIMESTAMP + INTERVAL '21 days', 'PUBLISHED', CURRENT_TIMESTAMP, 'admin'),

('시설 이용 만족도 조사', '교육시설 이용에 대한 만족도를 평가하기 위한 설문조사입니다.', 'GENERAL', 'ALL', NULL, NULL, 
 true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '30 days', 'PUBLISHED', CURRENT_TIMESTAMP, 'admin');

-- 29. 설문 문항 데이터 -------------------------------------------------------
INSERT INTO survey_question (survey_id, question_type, question_text, options, is_required, sort_order, created_at, created_by)
VALUES 
-- 교육 만족도 조사 문항
(1, 'RATING', '이 교육과정의 전반적인 만족도는 어떠셨습니까?', 
 '{"min": 1, "max": 5, "min_label": "매우 불만족", "max_label": "매우 만족"}', 
 true, 1, CURRENT_TIMESTAMP, 'admin'),

(1, 'MULTIPLE_CHOICE', '이 교육과정이 본인의 역량 향상에 도움이 되었습니까?', 
 '{"a": "매우 그렇다", "b": "그렇다", "c": "보통이다", "d": "그렇지 않다", "e": "전혀 그렇지 않다"}', 
 true, 2, CURRENT_TIMESTAMP, 'admin'),

(1, 'CHECKBOX', '이 교육과정에서 가장 유익했던 부분은 무엇입니까? (복수 선택 가능)', 
 '{"a": "이론적 지식", "b": "실습 내용", "c": "강사의 설명", "d": "교육 자료", "e": "질의응답 시간"}', 
 true, 3, CURRENT_TIMESTAMP, 'admin'),

(1, 'TEXT', '이 교육과정에서 개선이 필요하다고 생각하는 부분이 있다면 자유롭게 작성해 주세요.', 
 NULL, 
 false, 4, CURRENT_TIMESTAMP, 'admin'),

-- 강사 평가 문항
(2, 'RATING', '강사의 전문성은 어떠했습니까?', 
 '{"min": 1, "max": 5, "min_label": "매우 부족", "max_label": "매우 우수"}', 
 true, 1, CURRENT_TIMESTAMP, 'admin'),

(2, 'RATING', '강사의 교수법은 어떠했습니까?', 
 '{"min": 1, "max": 5, "min_label": "매우 부족", "max_label": "매우 우수"}', 
 true, 2, CURRENT_TIMESTAMP, 'admin'),

(2, 'RATING', '강의 내용의 전달력은 어떠했습니까?', 
 '{"min": 1, "max": 5, "min_label": "매우 부족", "max_label": "매우 우수"}', 
 true, 3, CURRENT_TIMESTAMP, 'admin'),

(2, 'TEXT', '강사에게 제안하고 싶은 사항이 있다면 자유롭게 작성해 주세요.', 
 NULL, 
 false, 4, CURRENT_TIMESTAMP, 'admin'),

-- 시설 이용 만족도 조사 문항
(3, 'RATING', '교육 시설의 전반적인 만족도는 어떠셨습니까?', 
 '{"min": 1, "max": 5, "min_label": "매우 불만족", "max_label": "매우 만족"}', 
 true, 1, CURRENT_TIMESTAMP, 'admin'),

(3, 'MULTIPLE_CHOICE', '교육 시설의 접근성은 어떠셨습니까?', 
 '{"a": "매우 좋음", "b": "좋음", "c": "보통", "d": "나쁨", "e": "매우 나쁨"}', 
 true, 2, CURRENT_TIMESTAMP, 'admin'),

(3, 'CHECKBOX', '교육 시설에서 개선이 필요한 부분은 무엇입니까? (복수 선택 가능)', 
 '{"a": "강의실 환경", "b": "휴게 공간", "c": "화장실", "d": "주차 시설", "e": "식당/카페테리아", "f": "냉난방 시설"}', 
 false, 3, CURRENT_TIMESTAMP, 'admin'),

(3, 'TEXT', '시설 이용에 대한 기타 의견이 있다면 자유롭게 작성해 주세요.', 
 NULL, 
 false, 4, CURRENT_TIMESTAMP, 'admin');

-- 트랜잭션 완료
COMMIT;

-- 샘플 데이터 생성 완료 메시지
SELECT 'Sample data for Sports Human Resource Development Institute has been successfully inserted.' AS result;



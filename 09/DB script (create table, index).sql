-- 1. 코드 관리 테이블 -----------------------------------------
CREATE TABLE sys_code_group (
    code_group_id VARCHAR(40) PRIMARY KEY,
    group_name VARCHAR(200) NOT NULL,
    description TEXT,
    use_yn CHAR(1) DEFAULT 'Y',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE sys_code_group IS '코드 그룹 관리';
COMMENT ON COLUMN sys_code_group.code_group_id IS '코드 그룹 ID';
COMMENT ON COLUMN sys_code_group.group_name IS '그룹명';
COMMENT ON COLUMN sys_code_group.description IS '설명';
COMMENT ON COLUMN sys_code_group.use_yn IS '사용여부';
COMMENT ON COLUMN sys_code_group.created_at IS '생성일시';
COMMENT ON COLUMN sys_code_group.created_by IS '생성자';
COMMENT ON COLUMN sys_code_group.updated_at IS '수정일시';
COMMENT ON COLUMN sys_code_group.updated_by IS '수정자';

CREATE TABLE sys_code (
    code_id VARCHAR(40) PRIMARY KEY,
    code_group_id VARCHAR(40) NOT NULL,
    code_name VARCHAR(200) NOT NULL,
    code_value VARCHAR(200),
    sort_order INTEGER DEFAULT 0,
    description TEXT,
    use_yn CHAR(1) DEFAULT 'Y',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (code_group_id) REFERENCES sys_code_group(code_group_id)
);
COMMENT ON TABLE sys_code IS '코드 상세 관리';
COMMENT ON COLUMN sys_code.code_id IS '코드 ID';
COMMENT ON COLUMN sys_code.code_group_id IS '코드 그룹 ID';
COMMENT ON COLUMN sys_code.code_name IS '코드명';
COMMENT ON COLUMN sys_code.code_value IS '코드값';
COMMENT ON COLUMN sys_code.sort_order IS '정렬순서';
COMMENT ON COLUMN sys_code.description IS '설명';
COMMENT ON COLUMN sys_code.use_yn IS '사용여부';
COMMENT ON COLUMN sys_code.created_at IS '생성일시';
COMMENT ON COLUMN sys_code.created_by IS '생성자';
COMMENT ON COLUMN sys_code.updated_at IS '수정일시';
COMMENT ON COLUMN sys_code.updated_by IS '수정자';

-- 2. 사용자/회원 관리 테이블 -----------------------------------------
CREATE TABLE user_role (
    role_id VARCHAR(40) PRIMARY KEY,
    role_name VARCHAR(70) NOT NULL,
    description TEXT,
    use_yn CHAR(1) DEFAULT 'Y',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE user_role IS '사용자 역할 관리';
COMMENT ON COLUMN user_role.role_id IS '역할 ID';
COMMENT ON COLUMN user_role.role_name IS '역할명';
COMMENT ON COLUMN user_role.description IS '설명';
COMMENT ON COLUMN user_role.use_yn IS '사용여부';
COMMENT ON COLUMN user_role.created_at IS '생성일시';
COMMENT ON COLUMN user_role.created_by IS '생성자';
COMMENT ON COLUMN user_role.updated_at IS '수정일시';
COMMENT ON COLUMN user_role.updated_by IS '수정자';

CREATE TABLE user_info (
    user_id VARCHAR(70) PRIMARY KEY,
    user_name VARCHAR(200) NOT NULL,
    password VARCHAR(200) NOT NULL,
    email VARCHAR(200),
    phone VARCHAR(40),
    birth_date DATE,
    gender CHAR(1),
    address TEXT,
    zipcode VARCHAR(10),
    profile_image VARCHAR(255),
    login_type VARCHAR(40) DEFAULT 'NORMAL',  -- NORMAL, KAKAO, NAVER, GOOGLE 등
    social_id VARCHAR(200),
    last_login_at TIMESTAMP,
    is_dormant BOOLEAN DEFAULT FALSE,
    is_locked BOOLEAN DEFAULT FALSE,
    login_fail_count INTEGER DEFAULT 0,
    agree_terms BOOLEAN DEFAULT FALSE,
    agree_privacy BOOLEAN DEFAULT FALSE,
    agree_marketing BOOLEAN DEFAULT FALSE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(40) DEFAULT 'ACTIVE',  -- ACTIVE, INACTIVE, WITHDRAWAL
    withdraw_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE user_info IS '사용자 정보';
COMMENT ON COLUMN user_info.user_id IS '사용자 ID';
COMMENT ON COLUMN user_info.user_name IS '사용자 이름';
COMMENT ON COLUMN user_info.password IS '비밀번호';
COMMENT ON COLUMN user_info.email IS '이메일';
COMMENT ON COLUMN user_info.phone IS '전화번호';
COMMENT ON COLUMN user_info.birth_date IS '생년월일';
COMMENT ON COLUMN user_info.gender IS '성별';
COMMENT ON COLUMN user_info.address IS '주소';
COMMENT ON COLUMN user_info.zipcode IS '우편번호';
COMMENT ON COLUMN user_info.profile_image IS '프로필 이미지 경로';
COMMENT ON COLUMN user_info.login_type IS '로그인 유형';
COMMENT ON COLUMN user_info.social_id IS '소셜 ID';
COMMENT ON COLUMN user_info.last_login_at IS '마지막 로그인 시간';
COMMENT ON COLUMN user_info.is_dormant IS '휴면계정 여부';
COMMENT ON COLUMN user_info.is_locked IS '계정 잠금 여부';
COMMENT ON COLUMN user_info.login_fail_count IS '로그인 실패 횟수';
COMMENT ON COLUMN user_info.agree_terms IS '이용약관 동의 여부';
COMMENT ON COLUMN user_info.agree_privacy IS '개인정보 동의 여부';
COMMENT ON COLUMN user_info.agree_marketing IS '마케팅 동의 여부';
COMMENT ON COLUMN user_info.registration_date IS '가입일';
COMMENT ON COLUMN user_info.status IS '계정 상태';
COMMENT ON COLUMN user_info.withdraw_date IS '탈퇴일';
COMMENT ON COLUMN user_info.created_at IS '생성일시';
COMMENT ON COLUMN user_info.created_by IS '생성자';
COMMENT ON COLUMN user_info.updated_at IS '수정일시';
COMMENT ON COLUMN user_info.updated_by IS '수정자';

CREATE TABLE user_role_mapping (
    mapping_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    role_id VARCHAR(40) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (role_id) REFERENCES user_role(role_id)
);
COMMENT ON TABLE user_role_mapping IS '사용자-역할 매핑';
COMMENT ON COLUMN user_role_mapping.mapping_id IS '매핑 ID';
COMMENT ON COLUMN user_role_mapping.user_id IS '사용자 ID';
COMMENT ON COLUMN user_role_mapping.role_id IS '역할 ID';
COMMENT ON COLUMN user_role_mapping.created_at IS '생성일시';
COMMENT ON COLUMN user_role_mapping.created_by IS '생성자';

-- 3. 메뉴 및 권한 관리 테이블 -----------------------------------------
CREATE TABLE menu (
    menu_id VARCHAR(40) PRIMARY KEY,
    parent_menu_id VARCHAR(40),
    menu_name VARCHAR(200) NOT NULL,
    menu_url VARCHAR(255),
    menu_icon VARCHAR(200),
    description TEXT,
    sort_order INTEGER DEFAULT 0,
    menu_level INTEGER DEFAULT 1,
    use_yn CHAR(1) DEFAULT 'Y',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (parent_menu_id) REFERENCES menu(menu_id)
);
COMMENT ON TABLE menu IS '메뉴 관리';
COMMENT ON COLUMN menu.menu_id IS '메뉴 ID';
COMMENT ON COLUMN menu.parent_menu_id IS '상위 메뉴 ID';
COMMENT ON COLUMN menu.menu_name IS '메뉴명';
COMMENT ON COLUMN menu.menu_url IS '메뉴 URL';
COMMENT ON COLUMN menu.menu_icon IS '메뉴 아이콘';
COMMENT ON COLUMN menu.description IS '설명';
COMMENT ON COLUMN menu.sort_order IS '정렬순서';
COMMENT ON COLUMN menu.menu_level IS '메뉴 레벨';
COMMENT ON COLUMN menu.use_yn IS '사용여부';
COMMENT ON COLUMN menu.created_at IS '생성일시';
COMMENT ON COLUMN menu.created_by IS '생성자';
COMMENT ON COLUMN menu.updated_at IS '수정일시';
COMMENT ON COLUMN menu.updated_by IS '수정자';

CREATE TABLE permission (
    permission_id VARCHAR(30) PRIMARY KEY,
    permission_name VARCHAR(200) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE permission IS '권한 관리';
COMMENT ON COLUMN permission.permission_id IS '권한 ID';
COMMENT ON COLUMN permission.permission_name IS '권한명';
COMMENT ON COLUMN permission.description IS '설명';
COMMENT ON COLUMN permission.created_at IS '생성일시';
COMMENT ON COLUMN permission.created_by IS '생성자';
COMMENT ON COLUMN permission.updated_at IS '수정일시';
COMMENT ON COLUMN permission.updated_by IS '수정자';

CREATE TABLE role_menu_permission (
    id SERIAL PRIMARY KEY,
    role_id VARCHAR(40) NOT NULL,
    menu_id VARCHAR(40) NOT NULL,
    permission_id VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (role_id) REFERENCES user_role(role_id),
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
    FOREIGN KEY (permission_id) REFERENCES permission(permission_id)
);
COMMENT ON TABLE role_menu_permission IS '역할-메뉴-권한 매핑';
COMMENT ON COLUMN role_menu_permission.id IS '매핑 ID';
COMMENT ON COLUMN role_menu_permission.role_id IS '역할 ID';
COMMENT ON COLUMN role_menu_permission.menu_id IS '메뉴 ID';
COMMENT ON COLUMN role_menu_permission.permission_id IS '권한 ID';
COMMENT ON COLUMN role_menu_permission.created_at IS '생성일시';
COMMENT ON COLUMN role_menu_permission.created_by IS '생성자';
COMMENT ON COLUMN role_menu_permission.updated_at IS '수정일시';
COMMENT ON COLUMN role_menu_permission.updated_by IS '수정자';

-- 4. 교육과정 관리 테이블 -----------------------------------------
CREATE TABLE course_category (
    category_id VARCHAR(40) PRIMARY KEY,
    parent_category_id VARCHAR(40),
    category_name VARCHAR(200) NOT NULL,
    category_level INTEGER DEFAULT 1,
    sort_order INTEGER DEFAULT 0,
    description TEXT,
    use_yn CHAR(1) DEFAULT 'Y',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (parent_category_id) REFERENCES course_category(category_id)
);
COMMENT ON TABLE course_category IS '교육과정 카테고리';
COMMENT ON COLUMN course_category.category_id IS '카테고리 ID';
COMMENT ON COLUMN course_category.parent_category_id IS '상위 카테고리 ID';
COMMENT ON COLUMN course_category.category_name IS '카테고리명';
COMMENT ON COLUMN course_category.category_level IS '카테고리 레벨';
COMMENT ON COLUMN course_category.sort_order IS '정렬순서';
COMMENT ON COLUMN course_category.description IS '설명';
COMMENT ON COLUMN course_category.use_yn IS '사용여부';
COMMENT ON COLUMN course_category.created_at IS '생성일시';
COMMENT ON COLUMN course_category.created_by IS '생성자';
COMMENT ON COLUMN course_category.updated_at IS '수정일시';
COMMENT ON COLUMN course_category.updated_by IS '수정자';

CREATE TABLE course (
    course_id VARCHAR(40) PRIMARY KEY,
    category_id VARCHAR(40) NOT NULL,
    course_name VARCHAR(200) NOT NULL,
    course_type VARCHAR(40) NOT NULL, -- ONLINE, OFFLINE, BLENDED
    course_level VARCHAR(40), -- BEGINNER, INTERMEDIATE, ADVANCED
    credit_hours INTEGER DEFAULT 0,
    max_students INTEGER,
    description TEXT,
    learning_objectives TEXT,
    target_audience TEXT,
    prerequisites TEXT,
    thumbnail_image VARCHAR(255),
    course_fee DECIMAL(10, 2) DEFAULT 0,
    is_free BOOLEAN DEFAULT FALSE,
    is_certificate BOOLEAN DEFAULT TRUE,
    course_status VARCHAR(40) DEFAULT 'DRAFT', -- DRAFT, PUBLISHED, CLOSED
    is_recommended BOOLEAN DEFAULT FALSE,
    view_count INTEGER DEFAULT 0,
    rating_average DECIMAL(3, 2) DEFAULT 0,
    rating_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (category_id) REFERENCES course_category(category_id)
);
COMMENT ON TABLE course IS '교육과정 기본정보';
COMMENT ON COLUMN course.course_id IS '교육과정 ID';
COMMENT ON COLUMN course.category_id IS '카테고리 ID';
COMMENT ON COLUMN course.course_name IS '교육과정명';
COMMENT ON COLUMN course.course_type IS '교육 유형(온라인/오프라인/혼합)';
COMMENT ON COLUMN course.course_level IS '교육 난이도';
COMMENT ON COLUMN course.credit_hours IS '이수시간';
COMMENT ON COLUMN course.max_students IS '최대 수강인원';
COMMENT ON COLUMN course.description IS '교육과정 설명';
COMMENT ON COLUMN course.learning_objectives IS '학습 목표';
COMMENT ON COLUMN course.target_audience IS '교육 대상';
COMMENT ON COLUMN course.prerequisites IS '선수 과목';
COMMENT ON COLUMN course.thumbnail_image IS '썸네일 이미지 경로';
COMMENT ON COLUMN course.course_fee IS '수강료';
COMMENT ON COLUMN course.is_free IS '무료 여부';
COMMENT ON COLUMN course.is_certificate IS '수료증 발급 여부';
COMMENT ON COLUMN course.course_status IS '교육과정 상태';
COMMENT ON COLUMN course.is_recommended IS '추천 과정 여부';
COMMENT ON COLUMN course.view_count IS '조회수';
COMMENT ON COLUMN course.rating_average IS '평균 평점';
COMMENT ON COLUMN course.rating_count IS '평가 횟수';
COMMENT ON COLUMN course.created_at IS '생성일시';
COMMENT ON COLUMN course.created_by IS '생성자';
COMMENT ON COLUMN course.updated_at IS '수정일시';
COMMENT ON COLUMN course.updated_by IS '수정자';

CREATE TABLE course_run (
    run_id VARCHAR(40) PRIMARY KEY,
    course_id VARCHAR(40) NOT NULL,
    run_name VARCHAR(200),
    run_number INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    registration_start_date DATE NOT NULL,
    registration_end_date DATE NOT NULL,
    min_enrollment INTEGER DEFAULT 1,
    max_enrollment INTEGER,
    location_id VARCHAR(40),  -- NULL인 경우 온라인 과정
    enrollment_count INTEGER DEFAULT 0,
    waiting_count INTEGER DEFAULT 0,
    run_status VARCHAR(40) DEFAULT 'UPCOMING', -- UPCOMING, REGISTRATION, INPROGRESS, COMPLETED, CANCELLED
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);
COMMENT ON TABLE course_run IS '교육과정 기수/차수 정보';
COMMENT ON COLUMN course_run.run_id IS '교육 차수 ID';
COMMENT ON COLUMN course_run.course_id IS '교육과정 ID';
COMMENT ON COLUMN course_run.run_name IS '차수명';
COMMENT ON COLUMN course_run.run_number IS '차수 번호';
COMMENT ON COLUMN course_run.start_date IS '교육 시작일';
COMMENT ON COLUMN course_run.end_date IS '교육 종료일';
COMMENT ON COLUMN course_run.registration_start_date IS '등록 시작일';
COMMENT ON COLUMN course_run.registration_end_date IS '등록 마감일';
COMMENT ON COLUMN course_run.min_enrollment IS '최소 등록인원';
COMMENT ON COLUMN course_run.max_enrollment IS '최대 등록인원';
COMMENT ON COLUMN course_run.location_id IS '교육장소 ID';
COMMENT ON COLUMN course_run.enrollment_count IS '현재 등록인원';
COMMENT ON COLUMN course_run.waiting_count IS '대기인원';
COMMENT ON COLUMN course_run.run_status IS '차수 상태';
COMMENT ON COLUMN course_run.created_at IS '생성일시';
COMMENT ON COLUMN course_run.created_by IS '생성자';
COMMENT ON COLUMN course_run.updated_at IS '수정일시';
COMMENT ON COLUMN course_run.updated_by IS '수정자';

CREATE TABLE course_schedule (
    schedule_id SERIAL PRIMARY KEY,
    run_id VARCHAR(40) NOT NULL,
    schedule_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    instructor_id VARCHAR(70),
    location_id VARCHAR(40),
    room_id VARCHAR(40),
    title VARCHAR(200),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id)
);
COMMENT ON TABLE course_schedule IS '교육과정 일정 정보';
COMMENT ON COLUMN course_schedule.schedule_id IS '일정 ID';
COMMENT ON COLUMN course_schedule.run_id IS '교육 차수 ID';
COMMENT ON COLUMN course_schedule.schedule_date IS '교육 일자';
COMMENT ON COLUMN course_schedule.start_time IS '시작 시간';
COMMENT ON COLUMN course_schedule.end_time IS '종료 시간';
COMMENT ON COLUMN course_schedule.instructor_id IS '강사 ID';
COMMENT ON COLUMN course_schedule.location_id IS '교육장소 ID';
COMMENT ON COLUMN course_schedule.room_id IS '강의실 ID';
COMMENT ON COLUMN course_schedule.title IS '일정 제목';
COMMENT ON COLUMN course_schedule.description IS '일정 설명';
COMMENT ON COLUMN course_schedule.created_at IS '생성일시';
COMMENT ON COLUMN course_schedule.created_by IS '생성자';
COMMENT ON COLUMN course_schedule.updated_at IS '수정일시';
COMMENT ON COLUMN course_schedule.updated_by IS '수정자';

CREATE TABLE course_content (
    content_id SERIAL PRIMARY KEY,
    course_id VARCHAR(40) NOT NULL,
    content_type VARCHAR(40) NOT NULL, -- VIDEO, DOCUMENT, QUIZ, ASSIGNMENT
    title VARCHAR(200) NOT NULL,
    description TEXT,
    content_url VARCHAR(255),
    content_file VARCHAR(255),
    duration INTEGER, -- 분 단위
    sort_order INTEGER DEFAULT 0,
    is_required BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);
COMMENT ON TABLE course_content IS '교육과정 콘텐츠';
COMMENT ON COLUMN course_content.content_id IS '콘텐츠 ID';
COMMENT ON COLUMN course_content.course_id IS '교육과정 ID';
COMMENT ON COLUMN course_content.content_type IS '콘텐츠 유형';
COMMENT ON COLUMN course_content.title IS '콘텐츠 제목';
COMMENT ON COLUMN course_content.description IS '콘텐츠 설명';
COMMENT ON COLUMN course_content.content_url IS '콘텐츠 URL';
COMMENT ON COLUMN course_content.content_file IS '콘텐츠 파일 경로';
COMMENT ON COLUMN course_content.duration IS '학습 시간(분)';
COMMENT ON COLUMN course_content.sort_order IS '정렬순서';
COMMENT ON COLUMN course_content.is_required IS '필수 여부';
COMMENT ON COLUMN course_content.created_at IS '생성일시';
COMMENT ON COLUMN course_content.created_by IS '생성자';
COMMENT ON COLUMN course_content.updated_at IS '수정일시';
COMMENT ON COLUMN course_content.updated_by IS '수정자';

-- 5. 교육장 시설 관리 테이블 -----------------------------------------
CREATE TABLE facility (
    facility_id VARCHAR(40) PRIMARY KEY,
    facility_name VARCHAR(200) NOT NULL,
    facility_type VARCHAR(40) NOT NULL, -- TRAINING_CENTER, CONFERENCE_ROOM, etc
    address TEXT,
    zipcode VARCHAR(10),
    contact_phone VARCHAR(40),
    contact_email VARCHAR(200),
    description TEXT,
    image_url VARCHAR(255),
    is_available BOOLEAN DEFAULT TRUE,
    capacity INTEGER,
    amenities TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE facility IS '교육 시설 정보';
COMMENT ON COLUMN facility.facility_id IS '시설 ID';
COMMENT ON COLUMN facility.facility_name IS '시설명';
COMMENT ON COLUMN facility.facility_type IS '시설 유형';
COMMENT ON COLUMN facility.address IS '주소';
COMMENT ON COLUMN facility.zipcode IS '우편번호';
COMMENT ON COLUMN facility.contact_phone IS '연락처';
COMMENT ON COLUMN facility.contact_email IS '이메일';
COMMENT ON COLUMN facility.description IS '시설 설명';
COMMENT ON COLUMN facility.image_url IS '이미지 경로';
COMMENT ON COLUMN facility.is_available IS '사용가능 여부';
COMMENT ON COLUMN facility.capacity IS '수용 인원';
COMMENT ON COLUMN facility.amenities IS '편의시설';
COMMENT ON COLUMN facility.created_at IS '생성일시';
COMMENT ON COLUMN facility.created_by IS '생성자';
COMMENT ON COLUMN facility.updated_at IS '수정일시';
COMMENT ON COLUMN facility.updated_by IS '수정자';

CREATE TABLE facility_room (
    room_id VARCHAR(40) PRIMARY KEY,
    facility_id VARCHAR(40) NOT NULL,
    room_name VARCHAR(200) NOT NULL,
    room_type VARCHAR(40) NOT NULL, -- CLASSROOM, AUDITORIUM, LAB
    capacity INTEGER,
    equipment TEXT,
    description TEXT,
    image_url VARCHAR(255),
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (facility_id) REFERENCES facility(facility_id)
);
COMMENT ON TABLE facility_room IS '교육 시설 내 강의실';
COMMENT ON COLUMN facility_room.room_id IS '강의실 ID';
COMMENT ON COLUMN facility_room.facility_id IS '시설 ID';
COMMENT ON COLUMN facility_room.room_name IS '강의실명';
COMMENT ON COLUMN facility_room.room_type IS '강의실 유형';
COMMENT ON COLUMN facility_room.capacity IS '수용 인원';
COMMENT ON COLUMN facility_room.equipment IS '설비/장비';
COMMENT ON COLUMN facility_room.description IS '강의실 설명';
COMMENT ON COLUMN facility_room.image_url IS '이미지 경로';
COMMENT ON COLUMN facility_room.is_available IS '사용가능 여부';
COMMENT ON COLUMN facility_room.created_at IS '생성일시';
COMMENT ON COLUMN facility_room.created_by IS '생성자';
COMMENT ON COLUMN facility_room.updated_at IS '수정일시';
COMMENT ON COLUMN facility_room.updated_by IS '수정자';

CREATE TABLE facility_reservation (
    reservation_id SERIAL PRIMARY KEY,
    facility_id VARCHAR(40) NOT NULL,
    room_id VARCHAR(40),
    user_id VARCHAR(70) NOT NULL,
    reservation_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    purpose VARCHAR(200) NOT NULL,
    attendees INTEGER,
    status VARCHAR(40) DEFAULT 'PENDING', -- PENDING, APPROVED, REJECTED, CANCELLED
    approval_user_id VARCHAR(70),
    approval_date TIMESTAMP,
    reject_reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (facility_id) REFERENCES facility(facility_id),
    FOREIGN KEY (room_id) REFERENCES facility_room(room_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE facility_reservation IS '시설 예약 정보';
COMMENT ON COLUMN facility_reservation.reservation_id IS '예약 ID';
COMMENT ON COLUMN facility_reservation.facility_id IS '시설 ID';
COMMENT ON COLUMN facility_reservation.room_id IS '강의실 ID';
COMMENT ON COLUMN facility_reservation.user_id IS '예약자 ID';
COMMENT ON COLUMN facility_reservation.reservation_date IS '예약 일자';
COMMENT ON COLUMN facility_reservation.start_time IS '시작 시간';
COMMENT ON COLUMN facility_reservation.end_time IS '종료 시간';
COMMENT ON COLUMN facility_reservation.purpose IS '사용 목적';
COMMENT ON COLUMN facility_reservation.attendees IS '참석자 수';
COMMENT ON COLUMN facility_reservation.status IS '예약 상태';
COMMENT ON COLUMN facility_reservation.approval_user_id IS '승인자 ID';
COMMENT ON COLUMN facility_reservation.approval_date IS '승인 일시';
COMMENT ON COLUMN facility_reservation.reject_reason IS '거절 사유';
COMMENT ON COLUMN facility_reservation.created_at IS '생성일시';
COMMENT ON COLUMN facility_reservation.created_by IS '생성자';
COMMENT ON COLUMN facility_reservation.updated_at IS '수정일시';
COMMENT ON COLUMN facility_reservation.updated_by IS '수정자';

-- 6. 강사 관리 테이블 -----------------------------------------
CREATE TABLE instructor (
    instructor_id VARCHAR(70) PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    specialty VARCHAR(200),
    profile TEXT,
    career TEXT,
    education TEXT,
    profile_image VARCHAR(255),
    resume_file VARCHAR(255),
    hourly_rate DECIMAL(10, 2),
    bank_name VARCHAR(70),
    account_number VARCHAR(70),
    account_holder VARCHAR(200),
    contract_status VARCHAR(40) DEFAULT 'ACTIVE', -- ACTIVE, INACTIVE, PENDING
    evaluation_average DECIMAL(3, 2) DEFAULT 0,
    evaluation_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE instructor IS '강사 정보';
COMMENT ON COLUMN instructor.instructor_id IS '강사 ID';
COMMENT ON COLUMN instructor.user_id IS '사용자 ID';
COMMENT ON COLUMN instructor.specialty IS '전문 분야';
COMMENT ON COLUMN instructor.profile IS '강사 프로필';
COMMENT ON COLUMN instructor.career IS '경력 사항';
COMMENT ON COLUMN instructor.education IS '학력 사항';
COMMENT ON COLUMN instructor.profile_image IS '프로필 이미지 경로';
COMMENT ON COLUMN instructor.resume_file IS '이력서 파일 경로';
COMMENT ON COLUMN instructor.hourly_rate IS '시간당 강의료';
COMMENT ON COLUMN instructor.bank_name IS '은행명';
COMMENT ON COLUMN instructor.account_number IS '계좌번호';
COMMENT ON COLUMN instructor.account_holder IS '예금주';
COMMENT ON COLUMN instructor.contract_status IS '계약 상태';
COMMENT ON COLUMN instructor.evaluation_average IS '평가 평균 점수';
COMMENT ON COLUMN instructor.evaluation_count IS '평가 횟수';
COMMENT ON COLUMN instructor.created_at IS '생성일시';
COMMENT ON COLUMN instructor.created_by IS '생성자';
COMMENT ON COLUMN instructor.updated_at IS '수정일시';
COMMENT ON COLUMN instructor.updated_by IS '수정자';

CREATE TABLE instructor_evaluation (
    evaluation_id SERIAL PRIMARY KEY,
    instructor_id VARCHAR(70) NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40) NOT NULL,
    user_id VARCHAR(70) NOT NULL,
    rating INTEGER NOT NULL, -- 1-5 척도
    comment TEXT,
    evaluation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE instructor_evaluation IS '강사 평가';
COMMENT ON COLUMN instructor_evaluation.evaluation_id IS '평가 ID';
COMMENT ON COLUMN instructor_evaluation.instructor_id IS '강사 ID';
COMMENT ON COLUMN instructor_evaluation.course_id IS '교육과정 ID';
COMMENT ON COLUMN instructor_evaluation.run_id IS '교육 차수 ID';
COMMENT ON COLUMN instructor_evaluation.user_id IS '평가자 ID';
COMMENT ON COLUMN instructor_evaluation.rating IS '평점';
COMMENT ON COLUMN instructor_evaluation.comment IS '평가 코멘트';
COMMENT ON COLUMN instructor_evaluation.evaluation_date IS '평가 일시';
COMMENT ON COLUMN instructor_evaluation.created_at IS '생성일시';
COMMENT ON COLUMN instructor_evaluation.created_by IS '생성자';

CREATE TABLE instructor_payment (
    payment_id SERIAL PRIMARY KEY,
    instructor_id VARCHAR(70) NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40) NOT NULL,
    payment_amount DECIMAL(12, 2) NOT NULL,
    payment_date DATE,
    payment_status VARCHAR(40) DEFAULT 'PENDING', -- PENDING, COMPLETED, CANCELLED
    payment_method VARCHAR(40),
    transaction_id VARCHAR(200),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id)
);
COMMENT ON TABLE instructor_payment IS '강사 지급 정보';
COMMENT ON COLUMN instructor_payment.payment_id IS '지급 ID';
COMMENT ON COLUMN instructor_payment.instructor_id IS '강사 ID';
COMMENT ON COLUMN instructor_payment.course_id IS '교육과정 ID';
COMMENT ON COLUMN instructor_payment.run_id IS '교육 차수 ID';
COMMENT ON COLUMN instructor_payment.payment_amount IS '지급 금액';
COMMENT ON COLUMN instructor_payment.payment_date IS '지급일';
COMMENT ON COLUMN instructor_payment.payment_status IS '지급 상태';
COMMENT ON COLUMN instructor_payment.payment_method IS '지급 방법';
COMMENT ON COLUMN instructor_payment.transaction_id IS '거래 ID';
COMMENT ON COLUMN instructor_payment.description IS '비고';
COMMENT ON COLUMN instructor_payment.created_at IS '생성일시';
COMMENT ON COLUMN instructor_payment.created_by IS '생성자';
COMMENT ON COLUMN instructor_payment.updated_at IS '수정일시';
COMMENT ON COLUMN instructor_payment.updated_by IS '수정자';

-- 7. 수강신청 및 학습관리 테이블 -----------------------------------------
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40) NOT NULL,
    enrollment_status VARCHAR(40) DEFAULT 'PENDING', -- PENDING, APPROVED, REJECTED, CANCELLED, COMPLETED
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_id INTEGER,
    approval_user_id VARCHAR(70),
    approval_date TIMESTAMP,
    reject_reason TEXT,
    completion_date TIMESTAMP,
    certificate_issued BOOLEAN DEFAULT FALSE,
    certificate_issue_date TIMESTAMP,
    certificate_number VARCHAR(70),
    is_group_enrollment BOOLEAN DEFAULT FALSE,
    group_code VARCHAR(70),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id)
);
COMMENT ON TABLE enrollment IS '수강신청 정보';
COMMENT ON COLUMN enrollment.enrollment_id IS '수강신청 ID';
COMMENT ON COLUMN enrollment.user_id IS '사용자 ID';
COMMENT ON COLUMN enrollment.course_id IS '교육과정 ID';
COMMENT ON COLUMN enrollment.run_id IS '교육 차수 ID';
COMMENT ON COLUMN enrollment.enrollment_status IS '수강 상태';
COMMENT ON COLUMN enrollment.enrollment_date IS '수강신청일';
COMMENT ON COLUMN enrollment.payment_id IS '결제 ID';
COMMENT ON COLUMN enrollment.approval_user_id IS '승인자 ID';
COMMENT ON COLUMN enrollment.approval_date IS '승인일';
COMMENT ON COLUMN enrollment.reject_reason IS '거절 사유';
COMMENT ON COLUMN enrollment.completion_date IS '수료일';
COMMENT ON COLUMN enrollment.certificate_issued IS '수료증 발급 여부';
COMMENT ON COLUMN enrollment.certificate_issue_date IS '수료증 발급일';
COMMENT ON COLUMN enrollment.certificate_number IS '수료증 번호';
COMMENT ON COLUMN enrollment.is_group_enrollment IS '단체 수강 여부';
COMMENT ON COLUMN enrollment.group_code IS '단체 코드';
COMMENT ON COLUMN enrollment.created_at IS '생성일시';
COMMENT ON COLUMN enrollment.created_by IS '생성자';
COMMENT ON COLUMN enrollment.updated_at IS '수정일시';
COMMENT ON COLUMN enrollment.updated_by IS '수정자';

CREATE TABLE group_enrollment (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(200) NOT NULL,
    group_code VARCHAR(70) UNIQUE NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40) NOT NULL,
    creator_user_id VARCHAR(70) NOT NULL,
    enrollment_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id),
    FOREIGN KEY (creator_user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE group_enrollment IS '단체 수강 정보';
COMMENT ON COLUMN group_enrollment.group_id IS '단체 ID';
COMMENT ON COLUMN group_enrollment.group_name IS '단체명';
COMMENT ON COLUMN group_enrollment.group_code IS '단체 코드';
COMMENT ON COLUMN group_enrollment.course_id IS '교육과정 ID';
COMMENT ON COLUMN group_enrollment.run_id IS '교육 차수 ID';
COMMENT ON COLUMN group_enrollment.creator_user_id IS '생성자 ID';
COMMENT ON COLUMN group_enrollment.enrollment_count IS '등록 인원수';
COMMENT ON COLUMN group_enrollment.created_at IS '생성일시';
COMMENT ON COLUMN group_enrollment.created_by IS '생성자';
COMMENT ON COLUMN group_enrollment.updated_at IS '수정일시';
COMMENT ON COLUMN group_enrollment.updated_by IS '수정자';

CREATE TABLE learning_progress (
    progress_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40) NOT NULL,
    content_id INTEGER NOT NULL,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    progress_rate INTEGER DEFAULT 0, -- 0-100
    is_completed BOOLEAN DEFAULT FALSE,
    last_position INTEGER DEFAULT 0, -- 동영상 위치(초)
    completion_time TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id),
    FOREIGN KEY (content_id) REFERENCES course_content(content_id)
);
COMMENT ON TABLE learning_progress IS '학습 진도';
COMMENT ON COLUMN learning_progress.progress_id IS '진도 ID';
COMMENT ON COLUMN learning_progress.user_id IS '사용자 ID';
COMMENT ON COLUMN learning_progress.course_id IS '교육과정 ID';
COMMENT ON COLUMN learning_progress.run_id IS '교육 차수 ID';
COMMENT ON COLUMN learning_progress.content_id IS '콘텐츠 ID';
COMMENT ON COLUMN learning_progress.start_time IS '학습 시작 시간';
COMMENT ON COLUMN learning_progress.end_time IS '학습 종료 시간';
COMMENT ON COLUMN learning_progress.progress_rate IS '진도율';
COMMENT ON COLUMN learning_progress.is_completed IS '완료 여부';
COMMENT ON COLUMN learning_progress.last_position IS '마지막 학습 위치';
COMMENT ON COLUMN learning_progress.completion_time IS '완료 시간';
COMMENT ON COLUMN learning_progress.created_at IS '생성일시';
COMMENT ON COLUMN learning_progress.updated_at IS '수정일시';

CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40) NOT NULL,
    schedule_id INTEGER NOT NULL,
    attendance_status VARCHAR(40) DEFAULT 'ABSENT', -- PRESENT, LATE, ABSENT, EXCUSED
    check_in_time TIMESTAMP,
    check_out_time TIMESTAMP,
    attendance_date DATE NOT NULL,
    remark TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id),
    FOREIGN KEY (schedule_id) REFERENCES course_schedule(schedule_id)
);
COMMENT ON TABLE attendance IS '출결 정보';
COMMENT ON COLUMN attendance.attendance_id IS '출결 ID';
COMMENT ON COLUMN attendance.user_id IS '사용자 ID';
COMMENT ON COLUMN attendance.course_id IS '교육과정 ID';
COMMENT ON COLUMN attendance.run_id IS '교육 차수 ID';
COMMENT ON COLUMN attendance.schedule_id IS '일정 ID';
COMMENT ON COLUMN attendance.attendance_status IS '출결 상태';
COMMENT ON COLUMN attendance.check_in_time IS '입실 시간';
COMMENT ON COLUMN attendance.check_out_time IS '퇴실 시간';
COMMENT ON COLUMN attendance.attendance_date IS '출결 일자';
COMMENT ON COLUMN attendance.remark IS '비고';
COMMENT ON COLUMN attendance.created_at IS '생성일시';
COMMENT ON COLUMN attendance.created_by IS '생성자';
COMMENT ON COLUMN attendance.updated_at IS '수정일시';
COMMENT ON COLUMN attendance.updated_by IS '수정자';

-- 8. 결제 및 정산 관리 테이블 -----------------------------------------
CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40) NOT NULL,
    payment_amount DECIMAL(12, 2) NOT NULL,
    payment_date TIMESTAMP,
    payment_method VARCHAR(40) NOT NULL, -- CARD, BANK_TRANSFER, POINT, etc
    payment_status VARCHAR(40) DEFAULT 'PENDING', -- PENDING, COMPLETED, FAILED, CANCELLED, REFUNDED
    transaction_id VARCHAR(200),
    receipt_url VARCHAR(255),
    is_corporate BOOLEAN DEFAULT FALSE,
    corporate_name VARCHAR(200),
    business_number VARCHAR(40),
    is_tax_invoice_issued BOOLEAN DEFAULT FALSE,
    tax_invoice_issue_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id)
);
COMMENT ON TABLE payment IS '결제 정보';
COMMENT ON COLUMN payment.payment_id IS '결제 ID';
COMMENT ON COLUMN payment.user_id IS '사용자 ID';
COMMENT ON COLUMN payment.course_id IS '교육과정 ID';
COMMENT ON COLUMN payment.run_id IS '교육 차수 ID';
COMMENT ON COLUMN payment.payment_amount IS '결제 금액';
COMMENT ON COLUMN payment.payment_date IS '결제일';
COMMENT ON COLUMN payment.payment_method IS '결제 방법';
COMMENT ON COLUMN payment.payment_status IS '결제 상태';
COMMENT ON COLUMN payment.transaction_id IS '거래 ID';
COMMENT ON COLUMN payment.receipt_url IS '영수증 URL';
COMMENT ON COLUMN payment.is_corporate IS '법인 결제 여부';
COMMENT ON COLUMN payment.corporate_name IS '법인명';
COMMENT ON COLUMN payment.business_number IS '사업자번호';
COMMENT ON COLUMN payment.is_tax_invoice_issued IS '세금계산서 발행 여부';
COMMENT ON COLUMN payment.tax_invoice_issue_date IS '세금계산서 발행일';
COMMENT ON COLUMN payment.created_at IS '생성일시';
COMMENT ON COLUMN payment.created_by IS '생성자';
COMMENT ON COLUMN payment.updated_at IS '수정일시';
COMMENT ON COLUMN payment.updated_by IS '수정자';

CREATE TABLE refund (
    refund_id SERIAL PRIMARY KEY,
    payment_id INTEGER NOT NULL,
    user_id VARCHAR(70) NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40) NOT NULL,
    refund_amount DECIMAL(12, 2) NOT NULL,
    refund_date TIMESTAMP,
    refund_reason TEXT NOT NULL,
    refund_status VARCHAR(40) DEFAULT 'PENDING', -- PENDING, APPROVED, REJECTED, COMPLETED
    approval_user_id VARCHAR(70),
    approval_date TIMESTAMP,
    reject_reason TEXT,
    transaction_id VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id)
);
COMMENT ON TABLE refund IS '환불 정보';
COMMENT ON COLUMN refund.refund_id IS '환불 ID';
COMMENT ON COLUMN refund.payment_id IS '결제 ID';
COMMENT ON COLUMN refund.user_id IS '사용자 ID';
COMMENT ON COLUMN refund.course_id IS '교육과정 ID';
COMMENT ON COLUMN refund.run_id IS '교육 차수 ID';
COMMENT ON COLUMN refund.refund_amount IS '환불 금액';
COMMENT ON COLUMN refund.refund_date IS '환불일';
COMMENT ON COLUMN refund.refund_reason IS '환불 사유';
COMMENT ON COLUMN refund.refund_status IS '환불 상태';
COMMENT ON COLUMN refund.approval_user_id IS '승인자 ID';
COMMENT ON COLUMN refund.approval_date IS '승인일';
COMMENT ON COLUMN refund.reject_reason IS '거절 사유';
COMMENT ON COLUMN refund.transaction_id IS '거래 ID';
COMMENT ON COLUMN refund.created_at IS '생성일시';
COMMENT ON COLUMN refund.created_by IS '생성자';
COMMENT ON COLUMN refund.updated_at IS '수정일시';
COMMENT ON COLUMN refund.updated_by IS '수정자';

-- 9. 시험 및 평가 관리 테이블 -----------------------------------------
CREATE TABLE exam (
    exam_id SERIAL PRIMARY KEY,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40),
    exam_name VARCHAR(200) NOT NULL,
    exam_type VARCHAR(40) NOT NULL, -- QUIZ, MIDTERM, FINAL, ASSIGNMENT
    is_graded BOOLEAN DEFAULT TRUE,
    total_score INTEGER DEFAULT 100,
    passing_score INTEGER DEFAULT 60,
    exam_duration INTEGER, -- 분 단위
    available_from TIMESTAMP,
    available_until TIMESTAMP,
    is_randomized BOOLEAN DEFAULT FALSE,
    allow_retake BOOLEAN DEFAULT FALSE,
    max_attempts INTEGER DEFAULT 1,
    show_answer BOOLEAN DEFAULT FALSE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id)
);
COMMENT ON TABLE exam IS '시험 정보';
COMMENT ON COLUMN exam.exam_id IS '시험 ID';
COMMENT ON COLUMN exam.course_id IS '교육과정 ID';
COMMENT ON COLUMN exam.run_id IS '교육 차수 ID';
COMMENT ON COLUMN exam.exam_name IS '시험명';
COMMENT ON COLUMN exam.exam_type IS '시험 유형';
COMMENT ON COLUMN exam.is_graded IS '채점 여부';
COMMENT ON COLUMN exam.total_score IS '총점';
COMMENT ON COLUMN exam.passing_score IS '합격 점수';
COMMENT ON COLUMN exam.exam_duration IS '시험 시간(분)';
COMMENT ON COLUMN exam.available_from IS '시작 시간';
COMMENT ON COLUMN exam.available_until IS '종료 시간';
COMMENT ON COLUMN exam.is_randomized IS '문제 섞기 여부';
COMMENT ON COLUMN exam.allow_retake IS '재시험 허용 여부';
COMMENT ON COLUMN exam.max_attempts IS '최대 시도 횟수';
COMMENT ON COLUMN exam.show_answer IS '정답 공개 여부';
COMMENT ON COLUMN exam.description IS '시험 설명';
COMMENT ON COLUMN exam.created_at IS '생성일시';
COMMENT ON COLUMN exam.created_by IS '생성자';
COMMENT ON COLUMN exam.updated_at IS '수정일시';
COMMENT ON COLUMN exam.updated_by IS '수정자';

CREATE TABLE question (
    question_id SERIAL PRIMARY KEY,
    exam_id INTEGER NOT NULL,
    question_type VARCHAR(40) NOT NULL, -- MULTIPLE_CHOICE, TRUE_FALSE, SHORT_ANSWER, ESSAY
    question_text TEXT NOT NULL,
    options JSONB, -- 객관식 문항의 보기
    correct_answer TEXT, -- 정답
    score INTEGER DEFAULT 1,
    difficulty VARCHAR(40), -- EASY, MEDIUM, HARD
    explanation TEXT,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id)
);
COMMENT ON TABLE question IS '시험 문항';
COMMENT ON COLUMN question.question_id IS '문항 ID';
COMMENT ON COLUMN question.exam_id IS '시험 ID';
COMMENT ON COLUMN question.question_type IS '문항 유형';
COMMENT ON COLUMN question.question_text IS '문항 내용';
COMMENT ON COLUMN question.options IS '선택지';
COMMENT ON COLUMN question.correct_answer IS '정답';
COMMENT ON COLUMN question.score IS '배점';
COMMENT ON COLUMN question.difficulty IS '난이도';
COMMENT ON COLUMN question.explanation IS '해설';
COMMENT ON COLUMN question.sort_order IS '정렬순서';
COMMENT ON COLUMN question.created_at IS '생성일시';
COMMENT ON COLUMN question.created_by IS '생성자';
COMMENT ON COLUMN question.updated_at IS '수정일시';
COMMENT ON COLUMN question.updated_by IS '수정자';

CREATE TABLE exam_submission (
    submission_id SERIAL PRIMARY KEY,
    exam_id INTEGER NOT NULL,
    user_id VARCHAR(70) NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40) NOT NULL,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    total_score INTEGER,
    passing_status VARCHAR(40), -- PASS, FAIL
    attempt_number INTEGER DEFAULT 1,
    is_graded BOOLEAN DEFAULT FALSE,
    graded_by VARCHAR(70),
    graded_time TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id)
);
COMMENT ON TABLE exam_submission IS '시험 제출';
COMMENT ON COLUMN exam_submission.submission_id IS '제출 ID';
COMMENT ON COLUMN exam_submission.exam_id IS '시험 ID';
COMMENT ON COLUMN exam_submission.user_id IS '사용자 ID';
COMMENT ON COLUMN exam_submission.course_id IS '교육과정 ID';
COMMENT ON COLUMN exam_submission.run_id IS '교육 차수 ID';
COMMENT ON COLUMN exam_submission.start_time IS '시작 시간';
COMMENT ON COLUMN exam_submission.end_time IS '종료 시간';
COMMENT ON COLUMN exam_submission.total_score IS '총점';
COMMENT ON COLUMN exam_submission.passing_status IS '합격 여부';
COMMENT ON COLUMN exam_submission.attempt_number IS '시도 횟수';
COMMENT ON COLUMN exam_submission.is_graded IS '채점 여부';
COMMENT ON COLUMN exam_submission.graded_by IS '채점자';
COMMENT ON COLUMN exam_submission.graded_time IS '채점 시간';
COMMENT ON COLUMN exam_submission.created_at IS '생성일시';
COMMENT ON COLUMN exam_submission.updated_at IS '수정일시';

CREATE TABLE answer (
    answer_id SERIAL PRIMARY KEY,
    submission_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    user_answer TEXT,
    is_correct BOOLEAN,
    score INTEGER,
    feedback TEXT,
    graded_by VARCHAR(70),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (submission_id) REFERENCES exam_submission(submission_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);
COMMENT ON TABLE answer IS '답안 정보';
COMMENT ON COLUMN answer.answer_id IS '답안 ID';
COMMENT ON COLUMN answer.submission_id IS '제출 ID';
COMMENT ON COLUMN answer.question_id IS '문항 ID';
COMMENT ON COLUMN answer.user_answer IS '사용자 답변';
COMMENT ON COLUMN answer.is_correct IS '정답 여부';
COMMENT ON COLUMN answer.score IS '획득 점수';
COMMENT ON COLUMN answer.feedback IS '피드백';
COMMENT ON COLUMN answer.graded_by IS '채점자';
COMMENT ON COLUMN answer.created_at IS '생성일시';
COMMENT ON COLUMN answer.updated_at IS '수정일시';

-- 10. 설문 관리 테이블 -----------------------------------------
CREATE TABLE survey (
    survey_id SERIAL PRIMARY KEY,
    survey_name VARCHAR(200) NOT NULL,
    description TEXT,
    survey_type VARCHAR(40) NOT NULL, -- COURSE, GENERAL, EVENT
    target_type VARCHAR(40) NOT NULL, -- ALL, STUDENT, INSTRUCTOR, MANAGER
    course_id VARCHAR(40),
    run_id VARCHAR(40),
    is_anonymous BOOLEAN DEFAULT TRUE,
    is_required BOOLEAN DEFAULT FALSE,
    available_from TIMESTAMP,
    available_until TIMESTAMP,
    status VARCHAR(40) DEFAULT 'DRAFT', -- DRAFT, PUBLISHED, CLOSED
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id)
);
COMMENT ON TABLE survey IS '설문 정보';
COMMENT ON COLUMN survey.survey_id IS '설문 ID';
COMMENT ON COLUMN survey.survey_name IS '설문명';
COMMENT ON COLUMN survey.description IS '설문 설명';
COMMENT ON COLUMN survey.survey_type IS '설문 유형';
COMMENT ON COLUMN survey.target_type IS '대상 유형';
COMMENT ON COLUMN survey.course_id IS '교육과정 ID';
COMMENT ON COLUMN survey.run_id IS '교육 차수 ID';
COMMENT ON COLUMN survey.is_anonymous IS '익명 여부';
COMMENT ON COLUMN survey.is_required IS '필수 여부';
COMMENT ON COLUMN survey.available_from IS '시작 시간';
COMMENT ON COLUMN survey.available_until IS '종료 시간';
COMMENT ON COLUMN survey.status IS '설문 상태';
COMMENT ON COLUMN survey.created_at IS '생성일시';
COMMENT ON COLUMN survey.created_by IS '생성자';
COMMENT ON COLUMN survey.updated_at IS '수정일시';
COMMENT ON COLUMN survey.updated_by IS '수정자';


CREATE TABLE survey_question (
    question_id SERIAL PRIMARY KEY,
    survey_id INTEGER NOT NULL,
    question_type VARCHAR(40) NOT NULL, -- MULTIPLE_CHOICE, CHECKBOX, RATING, TEXT
    question_text TEXT NOT NULL,
    options JSONB,
    is_required BOOLEAN DEFAULT TRUE,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (survey_id) REFERENCES survey(survey_id)
);
COMMENT ON TABLE survey_question IS '설문 문항';
COMMENT ON COLUMN survey_question.question_id IS '문항 ID';
COMMENT ON COLUMN survey_question.survey_id IS '설문 ID';
COMMENT ON COLUMN survey_question.question_type IS '문항 유형';
COMMENT ON COLUMN survey_question.question_text IS '문항 내용';
COMMENT ON COLUMN survey_question.options IS '선택지';
COMMENT ON COLUMN survey_question.is_required IS '필수 여부';
COMMENT ON COLUMN survey_question.sort_order IS '정렬순서';
COMMENT ON COLUMN survey_question.created_at IS '생성일시';
COMMENT ON COLUMN survey_question.created_by IS '생성자';
COMMENT ON COLUMN survey_question.updated_at IS '수정일시';
COMMENT ON COLUMN survey_question.updated_by IS '수정자';

CREATE TABLE survey_response (
    response_id SERIAL PRIMARY KEY,
    survey_id INTEGER NOT NULL,
    user_id VARCHAR(70),
    course_id VARCHAR(40),
    run_id VARCHAR(40),
    response_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(70),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (survey_id) REFERENCES survey(survey_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id)
);
COMMENT ON TABLE survey_response IS '설문 응답';
COMMENT ON COLUMN survey_response.response_id IS '응답 ID';
COMMENT ON COLUMN survey_response.survey_id IS '설문 ID';
COMMENT ON COLUMN survey_response.user_id IS '사용자 ID';
COMMENT ON COLUMN survey_response.course_id IS '교육과정 ID';
COMMENT ON COLUMN survey_response.run_id IS '교육 차수 ID';
COMMENT ON COLUMN survey_response.response_date IS '응답 일시';
COMMENT ON COLUMN survey_response.ip_address IS 'IP 주소';
COMMENT ON COLUMN survey_response.created_at IS '생성일시';

CREATE TABLE survey_answer (
    answer_id SERIAL PRIMARY KEY,
    response_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    answer_value TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (response_id) REFERENCES survey_response(response_id),
    FOREIGN KEY (question_id) REFERENCES survey_question(question_id)
);
COMMENT ON TABLE survey_answer IS '설문 답변';
COMMENT ON COLUMN survey_answer.answer_id IS '답변 ID';
COMMENT ON COLUMN survey_answer.response_id IS '응답 ID';
COMMENT ON COLUMN survey_answer.question_id IS '문항 ID';
COMMENT ON COLUMN survey_answer.answer_value IS '답변 내용';
COMMENT ON COLUMN survey_answer.created_at IS '생성일시';


-- 11. 게시판 및 커뮤니티 관리 테이블 -----------------------------------------
CREATE TABLE board (
    board_id VARCHAR(40) PRIMARY KEY,
    board_name VARCHAR(200) NOT NULL,
    board_type VARCHAR(40) NOT NULL, -- NOTICE, QNA, FAQ, COMMUNITY, GALLERY
    description TEXT,
    is_anonymous BOOLEAN DEFAULT FALSE,
    use_category BOOLEAN DEFAULT FALSE,
    use_comment BOOLEAN DEFAULT TRUE,
    use_file BOOLEAN DEFAULT TRUE,
    read_permission VARCHAR(40) DEFAULT 'ALL', -- ALL, MEMBER, ROLE
    write_permission VARCHAR(40) DEFAULT 'MEMBER', -- ALL, MEMBER, ROLE
    required_role_id VARCHAR(40),
    sort_order INTEGER DEFAULT 0,
    use_yn CHAR(1) DEFAULT 'Y',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (required_role_id) REFERENCES user_role(role_id)
);
COMMENT ON TABLE board IS '게시판 정보';
COMMENT ON COLUMN board.board_id IS '게시판 ID';
COMMENT ON COLUMN board.board_name IS '게시판명';
COMMENT ON COLUMN board.board_type IS '게시판 유형';
COMMENT ON COLUMN board.description IS '게시판 설명';
COMMENT ON COLUMN board.is_anonymous IS '익명 여부';
COMMENT ON COLUMN board.use_category IS '카테고리 사용 여부';
COMMENT ON COLUMN board.use_comment IS '댓글 사용 여부';
COMMENT ON COLUMN board.use_file IS '파일 사용 여부';
COMMENT ON COLUMN board.read_permission IS '읽기 권한';
COMMENT ON COLUMN board.write_permission IS '쓰기 권한';
COMMENT ON COLUMN board.required_role_id IS '필요 역할 ID';
COMMENT ON COLUMN board.sort_order IS '정렬순서';
COMMENT ON COLUMN board.use_yn IS '사용여부';
COMMENT ON COLUMN board.created_at IS '생성일시';
COMMENT ON COLUMN board.created_by IS '생성자';
COMMENT ON COLUMN board.updated_at IS '수정일시';
COMMENT ON COLUMN board.updated_by IS '수정자';

CREATE TABLE board_category (
    category_id SERIAL PRIMARY KEY,
    board_id VARCHAR(40) NOT NULL,
    category_name VARCHAR(200) NOT NULL,
    sort_order INTEGER DEFAULT 0,
    use_yn CHAR(1) DEFAULT 'Y',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70),
    FOREIGN KEY (board_id) REFERENCES board(board_id)
);
COMMENT ON TABLE board_category IS '게시판 카테고리';
COMMENT ON COLUMN board_category.category_id IS '카테고리 ID';
COMMENT ON COLUMN board_category.board_id IS '게시판 ID';
COMMENT ON COLUMN board_category.category_name IS '카테고리명';
COMMENT ON COLUMN board_category.sort_order IS '정렬순서';
COMMENT ON COLUMN board_category.use_yn IS '사용여부';
COMMENT ON COLUMN board_category.created_at IS '생성일시';
COMMENT ON COLUMN board_category.created_by IS '생성자';
COMMENT ON COLUMN board_category.updated_at IS '수정일시';
COMMENT ON COLUMN board_category.updated_by IS '수정자';

CREATE TABLE post (
    post_id SERIAL PRIMARY KEY,
    board_id VARCHAR(40) NOT NULL,
    category_id INTEGER,
    user_id VARCHAR(70) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    is_notice BOOLEAN DEFAULT FALSE,
    view_count INTEGER DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    comment_count INTEGER DEFAULT 0,
    is_anonymous BOOLEAN DEFAULT FALSE,
    password VARCHAR(200),
    is_private BOOLEAN DEFAULT FALSE,
    status VARCHAR(40) DEFAULT 'PUBLISHED', -- PUBLISHED, DELETED, HIDDEN
    ip_address VARCHAR(70),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (board_id) REFERENCES board(board_id),
    FOREIGN KEY (category_id) REFERENCES board_category(category_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE post IS '게시글';
COMMENT ON COLUMN post.post_id IS '게시글 ID';
COMMENT ON COLUMN post.board_id IS '게시판 ID';
COMMENT ON COLUMN post.category_id IS '카테고리 ID';
COMMENT ON COLUMN post.user_id IS '작성자 ID';
COMMENT ON COLUMN post.title IS '제목';
COMMENT ON COLUMN post.content IS '내용';
COMMENT ON COLUMN post.is_notice IS '공지 여부';
COMMENT ON COLUMN post.view_count IS '조회수';
COMMENT ON COLUMN post.like_count IS '좋아요 수';
COMMENT ON COLUMN post.comment_count IS '댓글 수';
COMMENT ON COLUMN post.is_anonymous IS '익명 여부';
COMMENT ON COLUMN post.password IS '비밀번호';
COMMENT ON COLUMN post.is_private IS '비공개 여부';
COMMENT ON COLUMN post.status IS '상태';
COMMENT ON COLUMN post.ip_address IS 'IP 주소';
COMMENT ON COLUMN post.created_at IS '생성일시';
COMMENT ON COLUMN post.updated_at IS '수정일시';
COMMENT ON COLUMN post.deleted_at IS '삭제일시';

CREATE TABLE comment (
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL,
    parent_comment_id INTEGER,
    user_id VARCHAR(70) NOT NULL,
    content TEXT NOT NULL,
    is_anonymous BOOLEAN DEFAULT FALSE,
    like_count INTEGER DEFAULT 0,
    status VARCHAR(40) DEFAULT 'PUBLISHED', -- PUBLISHED, DELETED, HIDDEN
    ip_address VARCHAR(70),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES post(post_id),
    FOREIGN KEY (parent_comment_id) REFERENCES comment(comment_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE comment IS '댓글';
COMMENT ON COLUMN comment.comment_id IS '댓글 ID';
COMMENT ON COLUMN comment.post_id IS '게시글 ID';
COMMENT ON COLUMN comment.parent_comment_id IS '부모 댓글 ID';
COMMENT ON COLUMN comment.user_id IS '작성자 ID';
COMMENT ON COLUMN comment.content IS '내용';
COMMENT ON COLUMN comment.is_anonymous IS '익명 여부';
COMMENT ON COLUMN comment.like_count IS '좋아요 수';
COMMENT ON COLUMN comment.status IS '상태';
COMMENT ON COLUMN comment.ip_address IS 'IP 주소';
COMMENT ON COLUMN comment.created_at IS '생성일시';
COMMENT ON COLUMN comment.updated_at IS '수정일시';
COMMENT ON COLUMN comment.deleted_at IS '삭제일시';

CREATE TABLE file_info (
    file_id SERIAL PRIMARY KEY,
    reference_type VARCHAR(40) NOT NULL, -- POST, COMMENT, COURSE, USER_PROFILE, etc
    reference_id INTEGER NOT NULL,
    original_filename VARCHAR(255) NOT NULL,
    stored_filename VARCHAR(255) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    file_size BIGINT NOT NULL,
    file_type VARCHAR(200),
    download_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    deleted_at TIMESTAMP
);
COMMENT ON TABLE file_info IS '파일 정보';
COMMENT ON COLUMN file_info.file_id IS '파일 ID';
COMMENT ON COLUMN file_info.reference_type IS '참조 유형';
COMMENT ON COLUMN file_info.reference_id IS '참조 ID';
COMMENT ON COLUMN file_info.original_filename IS '원본 파일명';
COMMENT ON COLUMN file_info.stored_filename IS '저장 파일명';
COMMENT ON COLUMN file_info.file_path IS '파일 경로';
COMMENT ON COLUMN file_info.file_size IS '파일 크기';
COMMENT ON COLUMN file_info.file_type IS '파일 유형';
COMMENT ON COLUMN file_info.download_count IS '다운로드 수';
COMMENT ON COLUMN file_info.created_at IS '생성일시';
COMMENT ON COLUMN file_info.created_by IS '생성자';
COMMENT ON COLUMN file_info.deleted_at IS '삭제일시';

-- 12. 기타 관리 테이블 -----------------------------------------
CREATE TABLE FAQ (
    faq_id SERIAL PRIMARY KEY,
    category_id INTEGER,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    view_count INTEGER DEFAULT 0,
    sort_order INTEGER DEFAULT 0,
    status VARCHAR(40) DEFAULT 'PUBLISHED', -- PUBLISHED, HIDDEN
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE FAQ IS 'FAQ 정보';
COMMENT ON COLUMN FAQ.faq_id IS 'FAQ ID';
COMMENT ON COLUMN FAQ.category_id IS '카테고리 ID';
COMMENT ON COLUMN FAQ.question IS '질문';
COMMENT ON COLUMN FAQ.answer IS '답변';
COMMENT ON COLUMN FAQ.view_count IS '조회수';
COMMENT ON COLUMN FAQ.sort_order IS '정렬순서';
COMMENT ON COLUMN FAQ.status IS '상태';
COMMENT ON COLUMN FAQ.created_at IS '생성일시';
COMMENT ON COLUMN FAQ.created_by IS '생성자';
COMMENT ON COLUMN FAQ.updated_at IS '수정일시';
COMMENT ON COLUMN FAQ.updated_by IS '수정자';

CREATE TABLE qna (
    qna_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    category_id INTEGER,
    title VARCHAR(255) NOT NULL,
    question TEXT NOT NULL,
    answer TEXT,
    answered_by VARCHAR(70),
    answered_at TIMESTAMP,
    status VARCHAR(40) DEFAULT 'PENDING', -- PENDING, ANSWERED, CLOSED
    is_private BOOLEAN DEFAULT FALSE,
    view_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE qna IS 'Q&A';
COMMENT ON COLUMN qna.qna_id IS 'Q&A ID';
COMMENT ON COLUMN qna.user_id IS '작성자 ID';
COMMENT ON COLUMN qna.category_id IS '카테고리 ID';
COMMENT ON COLUMN qna.title IS '제목';
COMMENT ON COLUMN qna.question IS '질문';
COMMENT ON COLUMN qna.answer IS '답변';
COMMENT ON COLUMN qna.answered_by IS '답변자';
COMMENT ON COLUMN qna.answered_at IS '답변일시';
COMMENT ON COLUMN qna.status IS '상태';
COMMENT ON COLUMN qna.is_private IS '비공개 여부';
COMMENT ON COLUMN qna.view_count IS '조회수';
COMMENT ON COLUMN qna.created_at IS '생성일시';
COMMENT ON COLUMN qna.updated_at IS '수정일시';

CREATE TABLE popup (
    popup_id SERIAL PRIMARY KEY,
    popup_title VARCHAR(200) NOT NULL,
    popup_content TEXT NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    popup_type VARCHAR(40) DEFAULT 'WINDOW', -- WINDOW, LAYER
    width INTEGER DEFAULT 400,
    height INTEGER DEFAULT 400,
    top_position INTEGER DEFAULT 0,
    left_position INTEGER DEFAULT 0,
    close_option VARCHAR(40) DEFAULT 'TODAY', -- TODAY, FOREVER, NONE
    target_page VARCHAR(40) DEFAULT 'ALL', -- ALL, MAIN, SPECIFIC
    target_url VARCHAR(255),
    display_order INTEGER DEFAULT 0,
    status VARCHAR(40) DEFAULT 'ACTIVE', -- ACTIVE, INACTIVE
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE popup IS '팝업 정보';
COMMENT ON COLUMN popup.popup_id IS '팝업 ID';
COMMENT ON COLUMN popup.popup_title IS '팝업 제목';
COMMENT ON COLUMN popup.popup_content IS '팝업 내용';
COMMENT ON COLUMN popup.start_date IS '시작일시';
COMMENT ON COLUMN popup.end_date IS '종료일시';
COMMENT ON COLUMN popup.popup_type IS '팝업 유형';
COMMENT ON COLUMN popup.width IS '너비';
COMMENT ON COLUMN popup.height IS '높이';
COMMENT ON COLUMN popup.top_position IS '상단 위치';
COMMENT ON COLUMN popup.left_position IS '좌측 위치';
COMMENT ON COLUMN popup.close_option IS '닫기 옵션';
COMMENT ON COLUMN popup.target_page IS '대상 페이지';
COMMENT ON COLUMN popup.target_url IS '대상 URL';
COMMENT ON COLUMN popup.display_order IS '표시 순서';
COMMENT ON COLUMN popup.status IS '상태';
COMMENT ON COLUMN popup.created_at IS '생성일시';
COMMENT ON COLUMN popup.created_by IS '생성자';
COMMENT ON COLUMN popup.updated_at IS '수정일시';
COMMENT ON COLUMN popup.updated_by IS '수정자';

CREATE TABLE banner (
    banner_id SERIAL PRIMARY KEY,
    banner_title VARCHAR(200) NOT NULL,
    banner_type VARCHAR(40) NOT NULL, -- MAIN, SUB, SIDE
    banner_image VARCHAR(255) NOT NULL,
    banner_url VARCHAR(255),
    open_type VARCHAR(40) DEFAULT '_self', -- _self, _blank
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    display_order INTEGER DEFAULT 0,
    status VARCHAR(40) DEFAULT 'ACTIVE', -- ACTIVE, INACTIVE
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE banner IS '배너 정보';
COMMENT ON COLUMN banner.banner_id IS '배너 ID';
COMMENT ON COLUMN banner.banner_title IS '배너 제목';
COMMENT ON COLUMN banner.banner_type IS '배너 유형';
COMMENT ON COLUMN banner.banner_image IS '배너 이미지';
COMMENT ON COLUMN banner.banner_url IS '배너 URL';
COMMENT ON COLUMN banner.open_type IS '링크 타입';
COMMENT ON COLUMN banner.start_date IS '시작일시';
COMMENT ON COLUMN banner.end_date IS '종료일시';
COMMENT ON COLUMN banner.display_order IS '표시 순서';
COMMENT ON COLUMN banner.status IS '상태';
COMMENT ON COLUMN banner.created_at IS '생성일시';
COMMENT ON COLUMN banner.created_by IS '생성자';
COMMENT ON COLUMN banner.updated_at IS '수정일시';
COMMENT ON COLUMN banner.updated_by IS '수정자';

CREATE TABLE terms (
    terms_id SERIAL PRIMARY KEY,
    terms_type VARCHAR(40) NOT NULL, -- SERVICE, PRIVACY, MARKETING
    terms_title VARCHAR(200) NOT NULL,
    terms_content TEXT NOT NULL,
    required BOOLEAN DEFAULT TRUE,
    version VARCHAR(40) NOT NULL,
    apply_date TIMESTAMP NOT NULL,
    status VARCHAR(40) DEFAULT 'ACTIVE', -- ACTIVE, INACTIVE
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE terms IS '약관 정보';
COMMENT ON COLUMN terms.terms_id IS '약관 ID';
COMMENT ON COLUMN terms.terms_type IS '약관 유형';
COMMENT ON COLUMN terms.terms_title IS '약관 제목';
COMMENT ON COLUMN terms.terms_content IS '약관 내용';
COMMENT ON COLUMN terms.required IS '필수 여부';
COMMENT ON COLUMN terms.version IS '버전';
COMMENT ON COLUMN terms.apply_date IS '적용일';
COMMENT ON COLUMN terms.status IS '상태';
COMMENT ON COLUMN terms.created_at IS '생성일시';
COMMENT ON COLUMN terms.created_by IS '생성자';
COMMENT ON COLUMN terms.updated_at IS '수정일시';
COMMENT ON COLUMN terms.updated_by IS '수정자';

CREATE TABLE user_terms_agreement (
    agreement_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    terms_id INTEGER NOT NULL,
    agree BOOLEAN DEFAULT FALSE,
    agree_date TIMESTAMP,
    ip_address VARCHAR(70),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (terms_id) REFERENCES terms(terms_id)
);
COMMENT ON TABLE user_terms_agreement IS '사용자 약관 동의';
COMMENT ON COLUMN user_terms_agreement.agreement_id IS '동의 ID';
COMMENT ON COLUMN user_terms_agreement.user_id IS '사용자 ID';
COMMENT ON COLUMN user_terms_agreement.terms_id IS '약관 ID';
COMMENT ON COLUMN user_terms_agreement.agree IS '동의 여부';
COMMENT ON COLUMN user_terms_agreement.agree_date IS '동의일';
COMMENT ON COLUMN user_terms_agreement.ip_address IS 'IP 주소';
COMMENT ON COLUMN user_terms_agreement.created_at IS '생성일시';

CREATE TABLE sms_history (
    sms_id SERIAL PRIMARY KEY,
    sender VARCHAR(40) NOT NULL,
    recipient VARCHAR(40) NOT NULL,
    message TEXT NOT NULL,
    send_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(40) DEFAULT 'SENT', -- SENT, FAILED
    message_type VARCHAR(40) DEFAULT 'SMS', -- SMS, LMS, MMS
    reference_type VARCHAR(40), -- COURSE, EVENT, NOTIFICATION
    reference_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70)
);
COMMENT ON TABLE sms_history IS 'SMS 발송 이력';
COMMENT ON COLUMN sms_history.sms_id IS 'SMS ID';
COMMENT ON COLUMN sms_history.sender IS '발신자';
COMMENT ON COLUMN sms_history.recipient IS '수신자';
COMMENT ON COLUMN sms_history.message IS '메시지';
COMMENT ON COLUMN sms_history.send_time IS '발송시간';
COMMENT ON COLUMN sms_history.status IS '발송상태';
COMMENT ON COLUMN sms_history.message_type IS '메시지 유형';
COMMENT ON COLUMN sms_history.reference_type IS '참조 유형';
COMMENT ON COLUMN sms_history.reference_id IS '참조 ID';
COMMENT ON COLUMN sms_history.created_at IS '생성일시';
COMMENT ON COLUMN sms_history.created_by IS '생성자';

CREATE TABLE email_template (
    template_id SERIAL PRIMARY KEY,
    template_name VARCHAR(200) NOT NULL,
    template_code VARCHAR(70) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    template_type VARCHAR(40) DEFAULT 'HTML', -- HTML, TEXT
    use_yn CHAR(1) DEFAULT 'Y',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE email_template IS '이메일 템플릿';
COMMENT ON COLUMN email_template.template_id IS '템플릿 ID';
COMMENT ON COLUMN email_template.template_name IS '템플릿명';
COMMENT ON COLUMN email_template.template_code IS '템플릿 코드';
COMMENT ON COLUMN email_template.subject IS '제목';
COMMENT ON COLUMN email_template.content IS '내용';
COMMENT ON COLUMN email_template.template_type IS '템플릿 유형';
COMMENT ON COLUMN email_template.use_yn IS '사용여부';
COMMENT ON COLUMN email_template.created_at IS '생성일시';
COMMENT ON COLUMN email_template.created_by IS '생성자';
COMMENT ON COLUMN email_template.updated_at IS '수정일시';
COMMENT ON COLUMN email_template.updated_by IS '수정자';

CREATE TABLE email_history (
    email_id SERIAL PRIMARY KEY,
    sender VARCHAR(200) NOT NULL,
    recipient VARCHAR(200) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    send_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(40) DEFAULT 'SENT', -- SENT, FAILED
    template_id INTEGER,
    reference_type VARCHAR(40), -- COURSE, EVENT, NOTIFICATION
    reference_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    FOREIGN KEY (template_id) REFERENCES email_template(template_id)
);
COMMENT ON TABLE email_history IS '이메일 발송 이력';
COMMENT ON COLUMN email_history.email_id IS '이메일 ID';
COMMENT ON COLUMN email_history.sender IS '발신자';
COMMENT ON COLUMN email_history.recipient IS '수신자';
COMMENT ON COLUMN email_history.subject IS '제목';
COMMENT ON COLUMN email_history.content IS '내용';
COMMENT ON COLUMN email_history.send_time IS '발송시간';
COMMENT ON COLUMN email_history.status IS '발송상태';
COMMENT ON COLUMN email_history.template_id IS '템플릿 ID';
COMMENT ON COLUMN email_history.reference_type IS '참조 유형';
COMMENT ON COLUMN email_history.reference_id IS '참조 ID';
COMMENT ON COLUMN email_history.created_at IS '생성일시';
COMMENT ON COLUMN email_history.created_by IS '생성자';

-- 13. 통계 테이블 -----------------------------------------
CREATE TABLE visit_log (
    log_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70),
    session_id VARCHAR(200) NOT NULL,
    ip_address VARCHAR(70),
    user_agent TEXT,
    visit_page VARCHAR(255) NOT NULL,
    referrer VARCHAR(255),
    visit_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    stay_time INTEGER, -- 초 단위
    device_type VARCHAR(40), -- PC, MOBILE, TABLET
    os_info VARCHAR(70),
    browser_info VARCHAR(70)
);
COMMENT ON TABLE visit_log IS '방문 로그';
COMMENT ON COLUMN visit_log.log_id IS '로그 ID';
COMMENT ON COLUMN visit_log.user_id IS '사용자 ID';
COMMENT ON COLUMN visit_log.session_id IS '세션 ID';
COMMENT ON COLUMN visit_log.ip_address IS 'IP 주소';
COMMENT ON COLUMN visit_log.user_agent IS '유저 에이전트';
COMMENT ON COLUMN visit_log.visit_page IS '방문 페이지';
COMMENT ON COLUMN visit_log.referrer IS '참조 페이지';
COMMENT ON COLUMN visit_log.visit_time IS '방문 시간';
COMMENT ON COLUMN visit_log.stay_time IS '체류 시간(초)';
COMMENT ON COLUMN visit_log.device_type IS '디바이스 유형';
COMMENT ON COLUMN visit_log.os_info IS 'OS 정보';
COMMENT ON COLUMN visit_log.browser_info IS '브라우저 정보';

CREATE TABLE statistics_daily (
    stats_id SERIAL PRIMARY KEY,
    stats_date DATE NOT NULL,
    stats_type VARCHAR(70) NOT NULL, -- VISIT, ENROLLMENT, COMPLETION, REVENUE
    stats_value INTEGER NOT NULL,
    reference_type VARCHAR(40), -- COURSE, CATEGORY, FACILITY
    reference_id VARCHAR(70),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);
COMMENT ON TABLE statistics_daily IS '일별 통계';
COMMENT ON COLUMN statistics_daily.stats_id IS '통계 ID';
COMMENT ON COLUMN statistics_daily.stats_date IS '통계 일자';
COMMENT ON COLUMN statistics_daily.stats_type IS '통계 유형';
COMMENT ON COLUMN statistics_daily.stats_value IS '통계 값';
COMMENT ON COLUMN statistics_daily.reference_type IS '참조 유형';
COMMENT ON COLUMN statistics_daily.reference_id IS '참조 ID';
COMMENT ON COLUMN statistics_daily.created_at IS '생성일시';
COMMENT ON COLUMN statistics_daily.updated_at IS '수정일시';

CREATE TABLE course_rating (
    rating_id SERIAL PRIMARY KEY,
    course_id VARCHAR(40) NOT NULL,
    run_id VARCHAR(40),
    user_id VARCHAR(70) NOT NULL,
    rating INTEGER NOT NULL, -- 1-5 척도
    review TEXT,
    rating_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (run_id) REFERENCES course_run(run_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE course_rating IS '교육과정 평가';
COMMENT ON COLUMN course_rating.rating_id IS '평가 ID';
COMMENT ON COLUMN course_rating.course_id IS '교육과정 ID';
COMMENT ON COLUMN course_rating.run_id IS '교육 차수 ID';
COMMENT ON COLUMN course_rating.user_id IS '사용자 ID';
COMMENT ON COLUMN course_rating.rating IS '평점';
COMMENT ON COLUMN course_rating.review IS '리뷰 내용';
COMMENT ON COLUMN course_rating.rating_date IS '평가일';
COMMENT ON COLUMN course_rating.created_at IS '생성일시';
COMMENT ON COLUMN course_rating.updated_at IS '수정일시';

CREATE TABLE user_course_recommendation (
    recommendation_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    course_id VARCHAR(40) NOT NULL,
    recommendation_type VARCHAR(40) NOT NULL, -- INTEREST, HISTORY, POPULAR
    score DECIMAL(5, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);
COMMENT ON TABLE user_course_recommendation IS '교육과정 추천';
COMMENT ON COLUMN user_course_recommendation.recommendation_id IS '추천 ID';
COMMENT ON COLUMN user_course_recommendation.user_id IS '사용자 ID';
COMMENT ON COLUMN user_course_recommendation.course_id IS '교육과정 ID';
COMMENT ON COLUMN user_course_recommendation.recommendation_type IS '추천 유형';
COMMENT ON COLUMN user_course_recommendation.score IS '추천 점수';
COMMENT ON COLUMN user_course_recommendation.created_at IS '생성일시';
COMMENT ON COLUMN user_course_recommendation.updated_at IS '수정일시';

-- 14. SNS 연동 테이블 -----------------------------------------
CREATE TABLE sns_connection (
    connection_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    sns_type VARCHAR(40) NOT NULL, -- FACEBOOK, TWITTER, INSTAGRAM, etc
    sns_id VARCHAR(200) NOT NULL,
    sns_name VARCHAR(200),
    access_token TEXT,
    refresh_token TEXT,
    token_expires_at TIMESTAMP,
    connected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(40) DEFAULT 'ACTIVE', -- ACTIVE, REVOKED
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE sns_connection IS 'SNS 연동 정보';
COMMENT ON COLUMN sns_connection.connection_id IS '연동 ID';
COMMENT ON COLUMN sns_connection.user_id IS '사용자 ID';
COMMENT ON COLUMN sns_connection.sns_type IS 'SNS 유형';
COMMENT ON COLUMN sns_connection.sns_id IS 'SNS ID';
COMMENT ON COLUMN sns_connection.sns_name IS 'SNS 이름';
COMMENT ON COLUMN sns_connection.access_token IS '액세스 토큰';
COMMENT ON COLUMN sns_connection.refresh_token IS '리프레시 토큰';
COMMENT ON COLUMN sns_connection.token_expires_at IS '토큰 만료일시';
COMMENT ON COLUMN sns_connection.connected_at IS '연동일시';
COMMENT ON COLUMN sns_connection.status IS '상태';
COMMENT ON COLUMN sns_connection.created_at IS '생성일시';
COMMENT ON COLUMN sns_connection.updated_at IS '수정일시';

CREATE TABLE sns_share_history (
    share_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    sns_type VARCHAR(40) NOT NULL, -- FACEBOOK, TWITTER, INSTAGRAM, etc
    content_type VARCHAR(40) NOT NULL, -- COURSE, POST, EVENT
    content_id VARCHAR(70) NOT NULL,
    share_message TEXT,
    share_url VARCHAR(255),
    share_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(40) DEFAULT 'SUCCESS', -- SUCCESS, FAILED
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE sns_share_history IS 'SNS 공유 이력';
COMMENT ON COLUMN sns_share_history.share_id IS '공유 ID';
COMMENT ON COLUMN sns_share_history.user_id IS '사용자 ID';
COMMENT ON COLUMN sns_share_history.sns_type IS 'SNS 유형';
COMMENT ON COLUMN sns_share_history.content_type IS '콘텐츠 유형';
COMMENT ON COLUMN sns_share_history.content_id IS '콘텐츠 ID';
COMMENT ON COLUMN sns_share_history.share_message IS '공유 메시지';
COMMENT ON COLUMN sns_share_history.share_url IS '공유 URL';
COMMENT ON COLUMN sns_share_history.share_time IS '공유 시간';
COMMENT ON COLUMN sns_share_history.status IS '상태';
COMMENT ON COLUMN sns_share_history.created_at IS '생성일시';

-- 15. 기타 확장 테이블 -----------------------------------------
CREATE TABLE user_interest (
    interest_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    category_id VARCHAR(40) NOT NULL,
    interest_level INTEGER DEFAULT 5, -- 1-10 척도
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
    FOREIGN KEY (category_id) REFERENCES course_category(category_id)
);
COMMENT ON TABLE user_interest IS '사용자 관심분야';
COMMENT ON COLUMN user_interest.interest_id IS '관심분야 ID';
COMMENT ON COLUMN user_interest.user_id IS '사용자 ID';
COMMENT ON COLUMN user_interest.category_id IS '카테고리 ID';
COMMENT ON COLUMN user_interest.interest_level IS '관심도';
COMMENT ON COLUMN user_interest.created_at IS '생성일시';
COMMENT ON COLUMN user_interest.updated_at IS '수정일시';

CREATE TABLE notification (
    notification_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    notification_type VARCHAR(40) NOT NULL, -- COURSE, COMMENT, SYSTEM, etc
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    reference_type VARCHAR(40), -- COURSE, POST, COMMENT, etc
    reference_id VARCHAR(70),
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE notification IS '알림';
COMMENT ON COLUMN notification.notification_id IS '알림 ID';
COMMENT ON COLUMN notification.user_id IS '사용자 ID';
COMMENT ON COLUMN notification.notification_type IS '알림 유형';
COMMENT ON COLUMN notification.title IS '제목';
COMMENT ON COLUMN notification.content IS '내용';
COMMENT ON COLUMN notification.reference_type IS '참조 유형';
COMMENT ON COLUMN notification.reference_id IS '참조 ID';
COMMENT ON COLUMN notification.is_read IS '읽음 여부';
COMMENT ON COLUMN notification.read_at IS '읽은 시간';
COMMENT ON COLUMN notification.created_at IS '생성일시';

CREATE TABLE user_favorite (
    favorite_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    favorite_type VARCHAR(40) NOT NULL, -- COURSE, INSTRUCTOR, FACILITY
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE user_favorite IS '즐겨찾기';
COMMENT ON COLUMN user_favorite.favorite_id IS '즐겨찾기 ID';
COMMENT ON COLUMN user_favorite.user_id IS '사용자 ID';
COMMENT ON COLUMN user_favorite.favorite_type IS '즐겨찾기 유형';
COMMENT ON COLUMN user_favorite.created_at IS '생성일시';

CREATE TABLE user_notification_setting (
    setting_id SERIAL PRIMARY KEY,
    user_id VARCHAR(70) NOT NULL,
    notification_type VARCHAR(40) NOT NULL, -- EMAIL, SMS, APP, WEB
    event_type VARCHAR(40) NOT NULL, -- COURSE, COMMENT, SYSTEM, etc
    is_enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
COMMENT ON TABLE user_notification_setting IS '알림 설정';
COMMENT ON COLUMN user_notification_setting.setting_id IS '설정 ID';
COMMENT ON COLUMN user_notification_setting.user_id IS '사용자 ID';
COMMENT ON COLUMN user_notification_setting.notification_type IS '알림 유형';
COMMENT ON COLUMN user_notification_setting.event_type IS '이벤트 유형';
COMMENT ON COLUMN user_notification_setting.is_enabled IS '활성화 여부';
COMMENT ON COLUMN user_notification_setting.created_at IS '생성일시';
COMMENT ON COLUMN user_notification_setting.updated_at IS '수정일시';

CREATE TABLE system_log (
    log_id SERIAL PRIMARY KEY,
    log_level VARCHAR(40) NOT NULL, -- INFO, WARNING, ERROR, DEBUG
    log_type VARCHAR(70) NOT NULL,
    user_id VARCHAR(70),
    ip_address VARCHAR(70),
    message TEXT NOT NULL,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    detail JSONB
);
COMMENT ON TABLE system_log IS '시스템 로그';
COMMENT ON COLUMN system_log.log_id IS '로그 ID';
COMMENT ON COLUMN system_log.log_level IS '로그 레벨';
COMMENT ON COLUMN system_log.log_type IS '로그 유형';
COMMENT ON COLUMN system_log.user_id IS '사용자 ID';
COMMENT ON COLUMN system_log.ip_address IS 'IP 주소';
COMMENT ON COLUMN system_log.message IS '메시지';
COMMENT ON COLUMN system_log.log_time IS '로그 시간';
COMMENT ON COLUMN system_log.detail IS '상세 정보';

CREATE TABLE system_config (
    config_id VARCHAR(70) PRIMARY KEY,
    config_name VARCHAR(200) NOT NULL,
    config_value TEXT,
    config_type VARCHAR(40) DEFAULT 'STRING', -- STRING, NUMBER, BOOLEAN, JSON
    description TEXT,
    use_yn CHAR(1) DEFAULT 'Y',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(70),
    updated_at TIMESTAMP,
    updated_by VARCHAR(70)
);
COMMENT ON TABLE system_config IS '시스템 설정';
COMMENT ON COLUMN system_config.config_id IS '설정 ID';
COMMENT ON COLUMN system_config.config_name IS '설정명';
COMMENT ON COLUMN system_config.config_value IS '설정값';
COMMENT ON COLUMN system_config.config_type IS '설정 유형';
COMMENT ON COLUMN system_config.description IS '설명';
COMMENT ON COLUMN system_config.use_yn IS '사용여부';
COMMENT ON COLUMN system_config.created_at IS '생성일시';
COMMENT ON COLUMN system_config.created_by IS '생성자';
COMMENT ON COLUMN system_config.updated_at IS '수정일시';
COMMENT ON COLUMN system_config.updated_by IS '수정자';

-- 16. 인덱스 생성 -----------------------------------------
-- 사용자 정보 검색용 인덱스
CREATE INDEX idx_user_info_email ON user_info(email);
CREATE INDEX idx_user_info_name ON user_info(user_name);
CREATE INDEX idx_user_info_status ON user_info(status);

-- 교육과정 검색용 인덱스
CREATE INDEX idx_course_name ON course(course_name);
CREATE INDEX idx_course_category ON course(category_id);
CREATE INDEX idx_course_status ON course(course_status);
CREATE INDEX idx_course_type ON course(course_type);

-- 교육과정 차수 검색용 인덱스
CREATE INDEX idx_course_run_dates ON course_run(start_date, end_date);
CREATE INDEX idx_course_run_registration ON course_run(registration_start_date, registration_end_date);
CREATE INDEX idx_course_run_status ON course_run(run_status);

-- 강사 검색용 인덱스
CREATE INDEX idx_instructor_user ON instructor(user_id);
CREATE INDEX idx_instructor_status ON instructor(contract_status);

-- 수강신청 검색용 인덱스
CREATE INDEX idx_enrollment_user ON enrollment(user_id);
CREATE INDEX idx_enrollment_course ON enrollment(course_id, run_id);
CREATE INDEX idx_enrollment_status ON enrollment(enrollment_status);
CREATE INDEX idx_enrollment_date ON enrollment(enrollment_date);

-- 출결 검색용 인덱스
CREATE INDEX idx_attendance_user ON attendance(user_id);
CREATE INDEX idx_attendance_course ON attendance(course_id, run_id);
CREATE INDEX idx_attendance_date ON attendance(attendance_date);

-- 게시판 검색용 인덱스
CREATE INDEX idx_post_board ON post(board_id);
CREATE INDEX idx_post_title ON post(title);
CREATE INDEX idx_post_user ON post(user_id);
CREATE INDEX idx_post_created ON post(created_at);

-- 결제 검색용 인덱스
CREATE INDEX idx_payment_user ON payment(user_id);
CREATE INDEX idx_payment_course ON payment(course_id, run_id);
CREATE INDEX idx_payment_status ON payment(payment_status);
CREATE INDEX idx_payment_date ON payment(payment_date);

-- 방문 로그 인덱스
CREATE INDEX idx_visit_log_user ON visit_log(user_id);
CREATE INDEX idx_visit_log_time ON visit_log(visit_time);
CREATE INDEX idx_visit_log_page ON visit_log(visit_page);

-- 통계 인덱스
CREATE INDEX idx_statistics_date ON statistics_daily(stats_date);
CREATE INDEX idx_statistics_type ON statistics_daily(stats_type);

-- 시설 예약 인덱스
CREATE INDEX idx_facility_reservation_date ON facility_reservation(reservation_date);
CREATE INDEX idx_facility_reservation_facility ON facility_reservation(facility_id);
CREATE INDEX idx_facility_reservation_status ON facility_reservation(status);

-- 기타 인덱스
CREATE INDEX idx_notification_user ON notification(user_id);
CREATE INDEX idx_notification_read ON notification(is_read);
CREATE INDEX idx_system_log_time ON system_log(log_time);
CREATE INDEX idx_system_log_level ON system_log(log_level);


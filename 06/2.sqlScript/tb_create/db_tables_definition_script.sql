-- 스포츠 e-러닝 포털 데이터베이스 스키마 생성 스크립트 (사용자 및 교육과정)
-- PostgreSQL 버전

-- TB_USER (사용자 정보) 테이블
CREATE TABLE TB_USER (
    user_id VARCHAR(50) PRIMARY KEY,
    user_type VARCHAR(20) NOT NULL DEFAULT 'STUDENT',
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    birth_date DATE,
    gender CHAR(1),
    address VARCHAR(255),
    profile_image VARCHAR(255),
    social_provider VARCHAR(20),
    social_id VARCHAR(100),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    last_login TIMESTAMP,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP,
    withdraw_date TIMESTAMP,
    withdraw_reason VARCHAR(500)
);

-- TB_USER_ROLE (사용자 역할) 테이블
CREATE TABLE TB_USER_ROLE (
    role_id SERIAL PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    role_name VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    -- ,
    -- FOREIGN KEY (user_id) REFERENCES TB_USER(user_id)
);

-- TB_USER_AUTH (사용자 인증 정보) 테이블
CREATE TABLE TB_USER_AUTH (
    auth_id SERIAL PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    auth_key VARCHAR(255) NOT NULL,
    auth_type VARCHAR(20) NOT NULL,
    expire_date TIMESTAMP NOT NULL,
    is_used BOOLEAN NOT NULL DEFAULT FALSE,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    -- ,
    -- FOREIGN KEY (user_id) REFERENCES TB_USER(user_id)
);

-- TB_INSTRUCTOR (강사 정보) 테이블
CREATE TABLE TB_INSTRUCTOR (
    instructor_id SERIAL PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    instructor_type VARCHAR(50) NOT NULL DEFAULT 'NORMAL',
    specialty VARCHAR(100),
    career TEXT,
    profile TEXT,
    bank_name VARCHAR(50),
    account_number VARCHAR(50),
    account_holder VARCHAR(50),
    rating DECIMAL(3,2),
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (user_id) REFERENCES TB_USER(user_id)
);

-- TB_INSTRUCTOR_EVALUATION (강사 평가) 테이블
CREATE TABLE TB_INSTRUCTOR_EVALUATION (
    eval_id SERIAL PRIMARY KEY,
    instructor_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    class_id INTEGER NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    score DECIMAL(3,2) NOT NULL DEFAULT 0,
    comment TEXT,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    -- ,
    -- FOREIGN KEY (instructor_id) REFERENCES TB_INSTRUCTOR(instructor_id),
    -- FOREIGN KEY (user_id) REFERENCES TB_USER(user_id)
);

-- TB_USER_LOG (사용자 활동 로그) 테이블
CREATE TABLE TB_USER_LOG (
    log_id BIGSERIAL PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    log_type VARCHAR(50) NOT NULL,
    ip_address VARCHAR(50),
    action VARCHAR(255),
    action_result VARCHAR(50),
    log_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    -- ,
    -- FOREIGN KEY (user_id) REFERENCES TB_USER(user_id)
);

-- TB_COURSE_CATEGORY (과정 카테고리) 테이블
CREATE TABLE TB_COURSE_CATEGORY (
    category_id SERIAL PRIMARY KEY,
    parent_id INTEGER,
    category_name VARCHAR(100) NOT NULL,
    category_desc VARCHAR(255),
    order_no INTEGER NOT NULL DEFAULT 0,
    depth INTEGER NOT NULL DEFAULT 1,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (parent_id) REFERENCES TB_COURSE_CATEGORY(category_id)
);

-- TB_COURSE (교육과정) 테이블
CREATE TABLE TB_COURSE (
    course_id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL,
    course_code VARCHAR(50) NOT NULL,
    course_name VARCHAR(200) NOT NULL,
    course_type VARCHAR(50) NOT NULL,
    course_level VARCHAR(20) NOT NULL DEFAULT 'BASIC',
    course_desc TEXT,
    course_image VARCHAR(255),
    learning_time INTEGER NOT NULL DEFAULT 0,
    learning_goal TEXT,
    is_charged BOOLEAN NOT NULL DEFAULT FALSE,
    price DECIMAL(10,2),
    max_students INTEGER,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    reg_user_id VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_user_id VARCHAR(50),
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (category_id) REFERENCES TB_COURSE_CATEGORY(category_id),
    -- FOREIGN KEY (reg_user_id) REFERENCES TB_USER(user_id),
    -- FOREIGN KEY (mod_user_id) REFERENCES TB_USER(user_id)
);

-- TB_COURSE_CLASS (교육과정 차수) 테이블
CREATE TABLE TB_COURSE_CLASS (
    class_id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL,
    class_name VARCHAR(100) NOT NULL,
    class_number INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    apply_start_date TIMESTAMP NOT NULL,
    apply_end_date TIMESTAMP NOT NULL,
    classroom_id INTEGER,
    max_students INTEGER,
    current_students INTEGER NOT NULL DEFAULT 0,
    waiting_students INTEGER NOT NULL DEFAULT 0,
    is_waiting_enabled BOOLEAN NOT NULL DEFAULT FALSE,
    status VARCHAR(20) NOT NULL DEFAULT 'READY',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    reg_user_id VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_user_id VARCHAR(50),
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (course_id) REFERENCES TB_COURSE(course_id),
    -- FOREIGN KEY (reg_user_id) REFERENCES TB_USER(user_id),
    -- FOREIGN KEY (mod_user_id) REFERENCES TB_USER(user_id)
);

-- TB_COURSE_SUBJECT (교육과정 과목) 테이블
CREATE TABLE TB_COURSE_SUBJECT (
    subject_id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL,
    subject_name VARCHAR(200) NOT NULL,
    subject_desc TEXT,
    learning_time INTEGER NOT NULL DEFAULT 0,
    order_no INTEGER NOT NULL DEFAULT 0,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (course_id) REFERENCES TB_COURSE(course_id)
);

-- TB_COURSE_CONTENT (교육과정 콘텐츠) 테이블
CREATE TABLE TB_COURSE_CONTENT (
    content_id SERIAL PRIMARY KEY,
    subject_id INTEGER NOT NULL,
    content_type VARCHAR(50) NOT NULL,
    content_title VARCHAR(200) NOT NULL,
    content_desc TEXT,
    file_path VARCHAR(255),
    file_name VARCHAR(200),
    file_size BIGINT,
    duration INTEGER,
    order_no INTEGER NOT NULL DEFAULT 0,
    is_required BOOLEAN NOT NULL DEFAULT TRUE,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (subject_id) REFERENCES TB_COURSE_SUBJECT(subject_id)
);

-- TB_COURSE_INSTRUCTOR (교육과정 강사) 테이블
CREATE TABLE TB_COURSE_INSTRUCTOR (
    course_instructor_id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL,
    class_id INTEGER,
    instructor_id INTEGER NOT NULL,
    subject_id INTEGER,
    role VARCHAR(50),
    fee DECIMAL(10,2),
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (course_id) REFERENCES TB_COURSE(course_id),
    -- FOREIGN KEY (class_id) REFERENCES TB_COURSE_CLASS(class_id),
    -- FOREIGN KEY (instructor_id) REFERENCES TB_INSTRUCTOR(instructor_id),
    -- FOREIGN KEY (subject_id) REFERENCES TB_COURSE_SUBJECT(subject_id)
);

-- 인덱스 생성
CREATE UNIQUE INDEX idx_user_email ON TB_USER(email);
CREATE INDEX idx_user_username ON TB_USER(username);
CREATE INDEX idx_user_role_user_id ON TB_USER_ROLE(user_id);
CREATE INDEX idx_user_auth_user_id ON TB_USER_AUTH(user_id, auth_type);
CREATE INDEX idx_instructor_user_id ON TB_INSTRUCTOR(user_id);
CREATE INDEX idx_instructor_eval_instructor ON TB_INSTRUCTOR_EVALUATION(instructor_id);
CREATE INDEX idx_instructor_eval_course ON TB_INSTRUCTOR_EVALUATION(course_id, class_id);
CREATE INDEX idx_user_log_user_id ON TB_USER_LOG(user_id);
CREATE INDEX idx_course_category_parent ON TB_COURSE_CATEGORY(parent_id);
CREATE INDEX idx_course_category ON TB_COURSE(category_id);
CREATE INDEX idx_course_class_course ON TB_COURSE_CLASS(course_id);
CREATE INDEX idx_course_subject_course ON TB_COURSE_SUBJECT(course_id);
CREATE INDEX idx_course_content_subject ON TB_COURSE_CONTENT(subject_id);
CREATE INDEX idx_course_instructor_course ON TB_COURSE_INSTRUCTOR(course_id, class_id);
CREATE INDEX idx_course_instructor_instructor ON TB_COURSE_INSTRUCTOR(instructor_id); 
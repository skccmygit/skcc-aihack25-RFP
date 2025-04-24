-- 스포츠 e-러닝 포털 데이터베이스 스키마 생성 스크립트 (수강 관련)
-- PostgreSQL 버전

-- TB_ENROLLMENT (수강신청) 테이블
CREATE TABLE TB_ENROLLMENT (
    enrollment_id SERIAL PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    course_id INTEGER NOT NULL,
    class_id INTEGER NOT NULL,
    enrollment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    approval_date TIMESTAMP,
    approval_user_id VARCHAR(50),
    cancel_date TIMESTAMP,
    cancel_reason VARCHAR(255),
    is_waiting BOOLEAN NOT NULL DEFAULT FALSE,
    waiting_number INTEGER,
    payment_status VARCHAR(20) NOT NULL DEFAULT 'NONE',
    payment_amount DECIMAL(10,2),
    payment_date TIMESTAMP,
    refund_status VARCHAR(20) NOT NULL DEFAULT 'NONE',
    refund_amount DECIMAL(10,2),
    refund_date TIMESTAMP,
    memo TEXT
);

-- TB_LEARNING_PROGRESS (학습 진도) 테이블
CREATE TABLE TB_LEARNING_PROGRESS (
    progress_id SERIAL PRIMARY KEY,
    enrollment_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL,
    progress_rate DECIMAL(5,2) NOT NULL DEFAULT 0,
    status VARCHAR(20) NOT NULL DEFAULT 'NOT_STARTED',
    start_time TIMESTAMP,
    complete_time TIMESTAMP,
    last_access_time TIMESTAMP,
    learning_time INTEGER NOT NULL DEFAULT 0,
    last_position INTEGER NOT NULL DEFAULT 0
    -- ,
    -- FOREIGN KEY (enrollment_id) REFERENCES TB_ENROLLMENT(enrollment_id)
);

-- TB_ATTENDANCE (출결 관리) 테이블
CREATE TABLE TB_ATTENDANCE (
    attendance_id SERIAL PRIMARY KEY,
    enrollment_id INTEGER NOT NULL,
    class_date DATE NOT NULL,
    attendance_type VARCHAR(20) NOT NULL DEFAULT 'ABSENT',
    check_in_time TIMESTAMP,
    check_out_time TIMESTAMP,
    absence_reason VARCHAR(255),
    reg_user_id VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_user_id VARCHAR(50),
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (enrollment_id) REFERENCES TB_ENROLLMENT(enrollment_id)
);

-- TB_ASSESSMENT (평가) 테이블
CREATE TABLE TB_ASSESSMENT (
    assessment_id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL,
    class_id INTEGER NOT NULL,
    assessment_name VARCHAR(200) NOT NULL,
    assessment_type VARCHAR(50) NOT NULL DEFAULT 'QUIZ',
    assessment_desc TEXT,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    total_score DECIMAL(5,2) NOT NULL DEFAULT 100,
    pass_score DECIMAL(5,2) NOT NULL DEFAULT 60,
    time_limit INTEGER,
    attempt_limit INTEGER,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    reg_user_id VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_user_id VARCHAR(50),
    mod_date TIMESTAMP
);

-- TB_ASSESSMENT_RESULT (평가 결과) 테이블
CREATE TABLE TB_ASSESSMENT_RESULT (
    result_id SERIAL PRIMARY KEY,
    assessment_id INTEGER NOT NULL,
    enrollment_id INTEGER NOT NULL,
    attempt INTEGER NOT NULL DEFAULT 1,
    score DECIMAL(5,2) NOT NULL DEFAULT 0,
    pass_yn CHAR(1) NOT NULL DEFAULT 'N',
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    feedback TEXT,
    grade_user_id VARCHAR(50),
    grade_date TIMESTAMP,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    -- ,
    -- FOREIGN KEY (assessment_id) REFERENCES TB_ASSESSMENT(assessment_id),
    -- FOREIGN KEY (enrollment_id) REFERENCES TB_ENROLLMENT(enrollment_id)
);

-- TB_COMPLETION (수료) 테이블
CREATE TABLE TB_COMPLETION (
    completion_id SERIAL PRIMARY KEY,
    enrollment_id INTEGER NOT NULL,
    completion_date DATE NOT NULL,
    completion_status VARCHAR(20) NOT NULL DEFAULT 'COMPLETED',
    total_score DECIMAL(5,2) NOT NULL DEFAULT 0,
    attendance_score DECIMAL(5,2) NOT NULL DEFAULT 0,
    assessment_score DECIMAL(5,2) NOT NULL DEFAULT 0,
    progress_score DECIMAL(5,2) NOT NULL DEFAULT 0,
    certificate_no VARCHAR(50),
    certificate_issue_date TIMESTAMP,
    certificate_status VARCHAR(20) NOT NULL DEFAULT 'NOT_ISSUED',
    approval_user_id VARCHAR(50),
    approval_date TIMESTAMP,
    memo TEXT,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (enrollment_id) REFERENCES TB_ENROLLMENT(enrollment_id)
);

-- 인덱스 생성
CREATE INDEX idx_enrollment_user_id ON TB_ENROLLMENT(user_id);
CREATE INDEX idx_enrollment_course_class ON TB_ENROLLMENT(course_id, class_id);
CREATE INDEX idx_learning_progress_enrollment ON TB_LEARNING_PROGRESS(enrollment_id);
CREATE INDEX idx_learning_progress_content ON TB_LEARNING_PROGRESS(content_id);
CREATE INDEX idx_attendance_enrollment ON TB_ATTENDANCE(enrollment_id);
CREATE INDEX idx_attendance_class_date ON TB_ATTENDANCE(class_date);
CREATE INDEX idx_assessment_course_class ON TB_ASSESSMENT(course_id, class_id);
CREATE INDEX idx_assessment_result_assessment ON TB_ASSESSMENT_RESULT(assessment_id);
CREATE INDEX idx_assessment_result_enrollment ON TB_ASSESSMENT_RESULT(enrollment_id);
CREATE INDEX idx_completion_enrollment ON TB_COMPLETION(enrollment_id); 
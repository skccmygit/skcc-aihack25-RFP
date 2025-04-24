-- 스포츠 e-러닝 포털 데이터베이스 스키마 생성 스크립트 (설문 및 공통 코드)
-- PostgreSQL 버전

-- TB_SURVEY (설문) 테이블
CREATE TABLE TB_SURVEY (
    survey_id SERIAL PRIMARY KEY,
    survey_name VARCHAR(200) NOT NULL,
    survey_desc TEXT,
    survey_type VARCHAR(50) NOT NULL DEFAULT 'COURSE',
    course_id INTEGER,
    class_id INTEGER,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    is_anonymous BOOLEAN NOT NULL DEFAULT TRUE,
    is_required BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    reg_user_id VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_user_id VARCHAR(50),
    mod_date TIMESTAMP
);

-- TB_SURVEY_QUESTION (설문 문항) 테이블
CREATE TABLE TB_SURVEY_QUESTION (
    question_id SERIAL PRIMARY KEY,
    survey_id INTEGER NOT NULL,
    question_text TEXT NOT NULL,
    question_type VARCHAR(50) NOT NULL DEFAULT 'SINGLE',
    is_required BOOLEAN NOT NULL DEFAULT TRUE,
    order_no INTEGER NOT NULL DEFAULT 0,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (survey_id) REFERENCES TB_SURVEY(survey_id)
);

-- TB_SURVEY_OPTION (설문 선택지) 테이블
CREATE TABLE TB_SURVEY_OPTION (
    option_id SERIAL PRIMARY KEY,
    question_id INTEGER NOT NULL,
    option_text VARCHAR(500) NOT NULL,
    score INTEGER,
    order_no INTEGER NOT NULL DEFAULT 0,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (question_id) REFERENCES TB_SURVEY_QUESTION(question_id)
);

-- TB_SURVEY_RESPONSE (설문 응답) 테이블
CREATE TABLE TB_SURVEY_RESPONSE (
    response_id SERIAL PRIMARY KEY,
    survey_id INTEGER NOT NULL,
    user_id VARCHAR(50),
    enrollment_id INTEGER,
    response_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_complete BOOLEAN NOT NULL DEFAULT FALSE,
    complete_date TIMESTAMP,
    ip_address VARCHAR(50)
    -- ,
    -- FOREIGN KEY (survey_id) REFERENCES TB_SURVEY(survey_id)
);

-- TB_SURVEY_ANSWER (설문 답변) 테이블
CREATE TABLE TB_SURVEY_ANSWER (
    answer_id SERIAL PRIMARY KEY,
    response_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    option_id INTEGER,
    text_answer TEXT,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    -- ,
    -- FOREIGN KEY (response_id) REFERENCES TB_SURVEY_RESPONSE(response_id),
    -- FOREIGN KEY (question_id) REFERENCES TB_SURVEY_QUESTION(question_id),
    -- FOREIGN KEY (option_id) REFERENCES TB_SURVEY_OPTION(option_id)
);

-- TB_CODE_GROUP (코드 그룹) 테이블
CREATE TABLE TB_CODE_GROUP (
    group_id VARCHAR(50) PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL,
    group_desc VARCHAR(255),
    use_yn CHAR(1) NOT NULL DEFAULT 'Y',
    reg_user_id VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_user_id VARCHAR(50),
    mod_date TIMESTAMP
);

-- TB_CODE (코드) 테이블
CREATE TABLE TB_CODE (
    code_id VARCHAR(50) NOT NULL,
    group_id VARCHAR(50) NOT NULL,
    code_name VARCHAR(100) NOT NULL,
    code_desc VARCHAR(255),
    order_no INTEGER NOT NULL DEFAULT 0,
    use_yn CHAR(1) NOT NULL DEFAULT 'Y',
    attribute1 VARCHAR(100),
    attribute2 VARCHAR(100),
    attribute3 VARCHAR(100),
    attribute4 VARCHAR(100),
    attribute5 VARCHAR(100),
    reg_user_id VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_user_id VARCHAR(50),
    mod_date TIMESTAMP,
    PRIMARY KEY (code_id, group_id)
    -- ,
    -- FOREIGN KEY (group_id) REFERENCES TB_CODE_GROUP(group_id)
);

-- TB_FACILITY (시설) 테이블
CREATE TABLE TB_FACILITY (
    facility_id SERIAL PRIMARY KEY,
    facility_name VARCHAR(100) NOT NULL,
    facility_type VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    contact VARCHAR(50),
    capacity INTEGER,
    facility_desc TEXT,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    reg_user_id VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_user_id VARCHAR(50),
    mod_date TIMESTAMP
);

-- TB_CLASSROOM (강의실) 테이블
CREATE TABLE TB_CLASSROOM (
    classroom_id SERIAL PRIMARY KEY,
    facility_id INTEGER NOT NULL,
    classroom_name VARCHAR(100) NOT NULL,
    classroom_type VARCHAR(50) NOT NULL DEFAULT 'LECTURE',
    capacity INTEGER NOT NULL DEFAULT 0,
    equipment TEXT,
    classroom_desc TEXT,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    reg_user_id VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_user_id VARCHAR(50),
    mod_date TIMESTAMP
    -- ,
    -- FOREIGN KEY (facility_id) REFERENCES TB_FACILITY(facility_id)
);

-- 인덱스 생성
CREATE INDEX idx_survey_course_class ON TB_SURVEY(course_id, class_id);
CREATE INDEX idx_survey_question_survey ON TB_SURVEY_QUESTION(survey_id);
CREATE INDEX idx_survey_option_question ON TB_SURVEY_OPTION(question_id);
CREATE INDEX idx_survey_response_survey ON TB_SURVEY_RESPONSE(survey_id);
CREATE INDEX idx_survey_response_user ON TB_SURVEY_RESPONSE(user_id);
CREATE INDEX idx_survey_answer_response ON TB_SURVEY_ANSWER(response_id);
CREATE INDEX idx_survey_answer_question ON TB_SURVEY_ANSWER(question_id);
CREATE INDEX idx_code_group_id ON TB_CODE(group_id);
CREATE INDEX idx_classroom_facility ON TB_CLASSROOM(facility_id); 
-- 전체 테이블 생성 스크립트 (참조 관계 순서 정렬)

-- courses 테이블 생성

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    crs_title VARCHAR(200),
    crs_category VARCHAR(100),
    crs_status VARCHAR(20),
    crs_target_audience VARCHAR(200),
    crs_created_at TIMESTAMP
);

COMMENT ON COLUMN courses.course_id IS '교육과정 ID';
COMMENT ON COLUMN courses.crs_title IS '과정명';
COMMENT ON COLUMN courses.crs_category IS '과정 분류';
COMMENT ON COLUMN courses.crs_status IS '개설 상태';
COMMENT ON COLUMN courses.crs_target_audience IS '교육 대상자';
COMMENT ON COLUMN courses.crs_created_at IS '등록일시';


-- completion_conditions 테이블 생성

CREATE TABLE completion_conditions (
    condition_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    cnd_required_progress DECIMAL(5,2),
    cnd_required_attendance DECIMAL(5,2),
    cnd_use_custom BOOLEAN,
    cnd_created_at TIMESTAMP
);

COMMENT ON COLUMN completion_conditions.condition_id IS '이수조건 ID';
COMMENT ON COLUMN completion_conditions.course_id IS '과정 ID';
COMMENT ON COLUMN completion_conditions.cnd_required_progress IS '필요 진행률';
COMMENT ON COLUMN completion_conditions.cnd_required_attendance IS '필요 출석률';
COMMENT ON COLUMN completion_conditions.cnd_use_custom IS '개별 설정 여부';
COMMENT ON COLUMN completion_conditions.cnd_created_at IS '등록일시';


-- members 테이블 생성

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    login_id VARCHAR(50),
    m_password_hash VARCHAR(255),
    m_name VARCHAR(50),
    m_gender VARCHAR(10),
    m_birthdate DATE,
    m_phone VARCHAR(20),
    m_email VARCHAR(100),
    m_status VARCHAR(20),
    m_join_date TIMESTAMP,
    m_last_login TIMESTAMP
);

COMMENT ON COLUMN members.member_id IS '회원 고유 ID';
COMMENT ON COLUMN members.login_id IS '로그인 ID';
COMMENT ON COLUMN members.m_password_hash IS '비밀번호 해시값';
COMMENT ON COLUMN members.m_name IS '회원 이름';
COMMENT ON COLUMN members.m_gender IS '성별';
COMMENT ON COLUMN members.m_birthdate IS '생년월일';
COMMENT ON COLUMN members.m_phone IS '전화번호';
COMMENT ON COLUMN members.m_email IS '이메일 주소';
COMMENT ON COLUMN members.m_status IS '회원 상태 (정상, 정지, 탈퇴 등)';
COMMENT ON COLUMN members.m_join_date IS '가입일시';
COMMENT ON COLUMN members.m_last_login IS '최종 로그인 일시';


-- enrollments 테이블 생성

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    course_id INT REFERENCES courses(course_id),
    session_id INT,
    enr_status VARCHAR(20),
    enr_payment_amount INT,
    enr_payment_status VARCHAR(20),
    enr_progress DECIMAL(5,2),
    enr_applied_at TIMESTAMP
);

COMMENT ON COLUMN enrollments.enrollment_id IS '수강신청 ID';
COMMENT ON COLUMN enrollments.member_id IS '회원 ID';
COMMENT ON COLUMN enrollments.course_id IS '과정 ID';
COMMENT ON COLUMN enrollments.session_id IS '기수 ID';
COMMENT ON COLUMN enrollments.enr_status IS '신청 상태';
COMMENT ON COLUMN enrollments.enr_payment_amount IS '결제 금액';
COMMENT ON COLUMN enrollments.enr_payment_status IS '결제 상태';
COMMENT ON COLUMN enrollments.enr_progress IS '진행률';
COMMENT ON COLUMN enrollments.enr_applied_at IS '신청일시';


-- completion_records 테이블 생성

CREATE TABLE completion_records (
    completion_id SERIAL PRIMARY KEY,
    enrollment_id INT REFERENCES enrollments(enrollment_id),
    cmp_progress_rate DECIMAL(5,2),
    cmp_attendance_rate DECIMAL(5,2),
    cmp_score DECIMAL(5,2),
    cmp_certificate_url TEXT,
    cmp_completed_at TIMESTAMP
);

COMMENT ON COLUMN completion_records.completion_id IS '수료 ID';
COMMENT ON COLUMN completion_records.enrollment_id IS '수강신청 ID';
COMMENT ON COLUMN completion_records.cmp_progress_rate IS '진행률';
COMMENT ON COLUMN completion_records.cmp_attendance_rate IS '출석률';
COMMENT ON COLUMN completion_records.cmp_score IS '평가점수';
COMMENT ON COLUMN completion_records.cmp_certificate_url IS '수료증 URL';
COMMENT ON COLUMN completion_records.cmp_completed_at IS '수료일';


-- manual_completions 테이블 생성

CREATE TABLE manual_completions (
    manual_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    course_id INT REFERENCES courses(course_id),
    mnl_reason TEXT,
    mnl_approved_by VARCHAR(50),
    mnl_recorded_at TIMESTAMP
);

COMMENT ON COLUMN manual_completions.manual_id IS '수기이수 ID';
COMMENT ON COLUMN manual_completions.member_id IS '회원 ID';
COMMENT ON COLUMN manual_completions.course_id IS '과정 ID';
COMMENT ON COLUMN manual_completions.mnl_reason IS '수기 등록 사유';
COMMENT ON COLUMN manual_completions.mnl_approved_by IS '승인자 ID';
COMMENT ON COLUMN manual_completions.mnl_recorded_at IS '등록일시';


-- certificates 테이블 생성

CREATE TABLE certificates (
    certificate_id SERIAL PRIMARY KEY,
    crt_title VARCHAR(100),
    crt_template_path VARCHAR(255),
    crt_created_by VARCHAR(50),
    crt_created_at TIMESTAMP
);

COMMENT ON COLUMN certificates.certificate_id IS '수료증 ID';
COMMENT ON COLUMN certificates.crt_title IS '수료증 제목';
COMMENT ON COLUMN certificates.crt_template_path IS 'PDF 템플릿 경로';
COMMENT ON COLUMN certificates.crt_created_by IS '등록자';
COMMENT ON COLUMN certificates.crt_created_at IS '등록일시';


-- certificate_issues 테이블 생성

CREATE TABLE certificate_issues (
    issue_id SERIAL PRIMARY KEY,
    certificate_id INT REFERENCES certificates(certificate_id),
    member_id INT REFERENCES members(member_id),
    iss_issued_by VARCHAR(50),
    iss_issued_at TIMESTAMP,
    iss_manual_issue BOOLEAN
);

COMMENT ON COLUMN certificate_issues.issue_id IS '발급이력 ID';
COMMENT ON COLUMN certificate_issues.certificate_id IS '수료증 ID';
COMMENT ON COLUMN certificate_issues.member_id IS '회원 ID';
COMMENT ON COLUMN certificate_issues.iss_issued_by IS '발급자';
COMMENT ON COLUMN certificate_issues.iss_issued_at IS '발급일시';
COMMENT ON COLUMN certificate_issues.iss_manual_issue IS '수동 발급 여부';


-- training_centers 테이블 생성

CREATE TABLE training_centers (
    center_id SERIAL PRIMARY KEY,
    trc_name VARCHAR(100),
    trc_address VARCHAR(255),
    trc_phone VARCHAR(20),
    trc_created_at TIMESTAMP
);

COMMENT ON COLUMN training_centers.center_id IS '교육장 ID';
COMMENT ON COLUMN training_centers.trc_name IS '교육장명';
COMMENT ON COLUMN training_centers.trc_address IS '주소';
COMMENT ON COLUMN training_centers.trc_phone IS '전화번호';
COMMENT ON COLUMN training_centers.trc_created_at IS '등록일시';


-- training_facilities 테이블 생성

CREATE TABLE training_facilities (
    facility_id SERIAL PRIMARY KEY,
    center_id INT,
    fac_type VARCHAR(50),
    fac_detail TEXT,
    fac_active BOOLEAN
);

COMMENT ON COLUMN training_facilities.facility_id IS '시설 ID';
COMMENT ON COLUMN training_facilities.center_id IS '교육장 ID';
COMMENT ON COLUMN training_facilities.fac_type IS '시설유형';
COMMENT ON COLUMN training_facilities.fac_detail IS '상세정보';
COMMENT ON COLUMN training_facilities.fac_active IS '사용 여부';


-- statistics_attendance 테이블 생성

CREATE TABLE statistics_attendance (
    stat_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    session_id INT,
    member_id INT REFERENCES members(member_id),
    sta_attended_days INT,
    sta_total_days INT,
    sta_attendance_rate DECIMAL(5,2)
);

COMMENT ON COLUMN statistics_attendance.stat_id IS '통계 ID';
COMMENT ON COLUMN statistics_attendance.course_id IS '과정 ID';
COMMENT ON COLUMN statistics_attendance.session_id IS '기수 ID';
COMMENT ON COLUMN statistics_attendance.member_id IS '회원 ID';
COMMENT ON COLUMN statistics_attendance.sta_attended_days IS '출석일수';
COMMENT ON COLUMN statistics_attendance.sta_total_days IS '전체 교육일수';
COMMENT ON COLUMN statistics_attendance.sta_attendance_rate IS '출석률';


-- statistics_completion 테이블 생성

CREATE TABLE statistics_completion (
    completion_stat_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    session_id INT,
    member_id INT REFERENCES members(member_id),
    stc_completed BOOLEAN,
    stc_score DECIMAL(5,2),
    stc_completion_date TIMESTAMP
);

COMMENT ON COLUMN statistics_completion.completion_stat_id IS '이수통계 ID';
COMMENT ON COLUMN statistics_completion.course_id IS '과정 ID';
COMMENT ON COLUMN statistics_completion.session_id IS '기수 ID';
COMMENT ON COLUMN statistics_completion.member_id IS '회원 ID';
COMMENT ON COLUMN statistics_completion.stc_completed IS '이수 여부';
COMMENT ON COLUMN statistics_completion.stc_score IS '점수';
COMMENT ON COLUMN statistics_completion.stc_completion_date IS '이수일시';


-- statistics_reports 테이블 생성

CREATE TABLE statistics_reports (
    report_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    session_id INT,
    str_title VARCHAR(200),
    str_generated_by VARCHAR(50),
    str_generated_at TIMESTAMP,
    str_pdf_url TEXT
);

COMMENT ON COLUMN statistics_reports.report_id IS '보고서 ID';
COMMENT ON COLUMN statistics_reports.course_id IS '과정 ID';
COMMENT ON COLUMN statistics_reports.session_id IS '기수 ID';
COMMENT ON COLUMN statistics_reports.str_title IS '제목';
COMMENT ON COLUMN statistics_reports.str_generated_by IS '생성자';
COMMENT ON COLUMN statistics_reports.str_generated_at IS '생성일시';
COMMENT ON COLUMN statistics_reports.str_pdf_url IS 'PDF 경로';


-- statistics_report_items 테이블 생성

CREATE TABLE statistics_report_items (
    item_id SERIAL PRIMARY KEY,
    report_id INT,
    sti_section VARCHAR(100),
    sti_content TEXT
);

COMMENT ON COLUMN statistics_report_items.item_id IS '항목 ID';
COMMENT ON COLUMN statistics_report_items.report_id IS '보고서 ID';
COMMENT ON COLUMN statistics_report_items.sti_section IS '항목 구분 (강사/출결/이수 등)';
COMMENT ON COLUMN statistics_report_items.sti_content IS '내용';


-- statistics_alerts 테이블 생성

CREATE TABLE statistics_alerts (
    alert_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    course_id INT REFERENCES courses(course_id),
    sta_alert_type VARCHAR(20),
    sta_sent_at TIMESTAMP,
    sta_alert_message TEXT
);

COMMENT ON COLUMN statistics_alerts.alert_id IS '알림 ID';
COMMENT ON COLUMN statistics_alerts.member_id IS '회원 ID';
COMMENT ON COLUMN statistics_alerts.course_id IS '과정 ID';
COMMENT ON COLUMN statistics_alerts.sta_alert_type IS '알림 채널 (메일/SMS/페이지)';
COMMENT ON COLUMN statistics_alerts.sta_sent_at IS '발송일시';
COMMENT ON COLUMN statistics_alerts.sta_alert_message IS '알림 내용';


-- statistics_summary_metrics 테이블 생성

CREATE TABLE statistics_summary_metrics (
    summary_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    session_id INT,
    ssm_completion_rate DECIMAL(5,2),
    ssm_dropout_rate DECIMAL(5,2),
    ssm_report_created_at TIMESTAMP
);

COMMENT ON COLUMN statistics_summary_metrics.summary_id IS '요약 ID';
COMMENT ON COLUMN statistics_summary_metrics.course_id IS '과정 ID';
COMMENT ON COLUMN statistics_summary_metrics.session_id IS '기수 ID';
COMMENT ON COLUMN statistics_summary_metrics.ssm_completion_rate IS '이수율';
COMMENT ON COLUMN statistics_summary_metrics.ssm_dropout_rate IS '중도탈락률';
COMMENT ON COLUMN statistics_summary_metrics.ssm_report_created_at IS '보고서 생성일시';


-- member_education_histories 테이블 생성

CREATE TABLE member_education_histories (
    history_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    course_id INT REFERENCES courses(course_id),
    meh_institution VARCHAR(100),
    meh_year VARCHAR(4),
    meh_completed BOOLEAN
);

COMMENT ON COLUMN member_education_histories.history_id IS '이력 ID';
COMMENT ON COLUMN member_education_histories.member_id IS '회원 ID';
COMMENT ON COLUMN member_education_histories.course_id IS '과정 ID';
COMMENT ON COLUMN member_education_histories.meh_institution IS '수행 기관명';
COMMENT ON COLUMN member_education_histories.meh_year IS '연도';
COMMENT ON COLUMN member_education_histories.meh_completed IS '이수 여부';


-- payments 테이블 생성

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    enrollment_id INT REFERENCES enrollments(enrollment_id),
    pay_method VARCHAR(30),
    pay_amount INT,
    pay_status VARCHAR(20),
    pay_paid_at TIMESTAMP
);

COMMENT ON COLUMN payments.payment_id IS '결제 ID';
COMMENT ON COLUMN payments.enrollment_id IS '수강신청 ID';
COMMENT ON COLUMN payments.pay_method IS '결제수단 (카드, 무통장 등)';
COMMENT ON COLUMN payments.pay_amount IS '결제 금액';
COMMENT ON COLUMN payments.pay_status IS '결제 상태';
COMMENT ON COLUMN payments.pay_paid_at IS '결제일시';


-- refunds 테이블 생성

CREATE TABLE refunds (
    refund_id SERIAL PRIMARY KEY,
    payment_id INT REFERENCES payments(payment_id),
    rfd_refund_rate DECIMAL(5,2),
    rfd_refund_amount INT,
    rfd_refund_status VARCHAR(20),
    rfd_refunded_at TIMESTAMP
);

COMMENT ON COLUMN refunds.refund_id IS '환불 ID';
COMMENT ON COLUMN refunds.payment_id IS '결제 ID';
COMMENT ON COLUMN refunds.rfd_refund_rate IS '환불율 (%)';
COMMENT ON COLUMN refunds.rfd_refund_amount IS '환불 금액';
COMMENT ON COLUMN refunds.rfd_refund_status IS '환불 상태';
COMMENT ON COLUMN refunds.rfd_refunded_at IS '환불 처리일';


-- settlement_summaries 테이블 생성

CREATE TABLE settlement_summaries (
    summary_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    stl_month VARCHAR(7),
    stl_total_payment INT,
    stl_total_refund INT,
    stl_unpaid_amount INT,
    stl_summary_created_at TIMESTAMP
);

COMMENT ON COLUMN settlement_summaries.summary_id IS '정산 ID';
COMMENT ON COLUMN settlement_summaries.course_id IS '과정 ID';
COMMENT ON COLUMN settlement_summaries.stl_month IS '정산월 (예: 2024-06)';
COMMENT ON COLUMN settlement_summaries.stl_total_payment IS '총 결제 금액';
COMMENT ON COLUMN settlement_summaries.stl_total_refund IS '총 환불 금액';
COMMENT ON COLUMN settlement_summaries.stl_unpaid_amount IS '미결제 금액';
COMMENT ON COLUMN settlement_summaries.stl_summary_created_at IS '정산 생성일시';


-- payment_receipts 테이블 생성

CREATE TABLE payment_receipts (
    receipt_id SERIAL PRIMARY KEY,
    payment_id INT REFERENCES payments(payment_id),
    rcp_course_title VARCHAR(200),
    rcp_member_name VARCHAR(100),
    rcp_amount INT,
    rcp_paid_at TIMESTAMP,
    rcp_method VARCHAR(30),
    rcp_pdf_url TEXT
);

COMMENT ON COLUMN payment_receipts.receipt_id IS '영수증 ID';
COMMENT ON COLUMN payment_receipts.payment_id IS '결제 ID';
COMMENT ON COLUMN payment_receipts.rcp_course_title IS '과정명';
COMMENT ON COLUMN payment_receipts.rcp_member_name IS '수강자명';
COMMENT ON COLUMN payment_receipts.rcp_amount IS '금액';
COMMENT ON COLUMN payment_receipts.rcp_paid_at IS '결제일자';
COMMENT ON COLUMN payment_receipts.rcp_method IS '결제수단';
COMMENT ON COLUMN payment_receipts.rcp_pdf_url IS 'PDF 출력경로';


-- board_posts 테이블 생성

CREATE TABLE board_posts (
    post_id SERIAL PRIMARY KEY,
    brd_board_type VARCHAR(20),
    brd_title VARCHAR(200),
    brd_content TEXT,
    author_id INT,
    brd_view_count INT,
    brd_created_at TIMESTAMP
);

COMMENT ON COLUMN board_posts.post_id IS '게시물 ID';
COMMENT ON COLUMN board_posts.brd_board_type IS '게시판 유형 (공지, 자료실, Q&A)';
COMMENT ON COLUMN board_posts.brd_title IS '제목';
COMMENT ON COLUMN board_posts.brd_content IS '내용';
COMMENT ON COLUMN board_posts.author_id IS '작성자 ID';
COMMENT ON COLUMN board_posts.brd_view_count IS '조회수';
COMMENT ON COLUMN board_posts.brd_created_at IS '작성일';


-- board_files 테이블 생성

CREATE TABLE board_files (
    file_id SERIAL PRIMARY KEY,
    post_id INT,
    fil_file_name VARCHAR(255),
    fil_file_url TEXT
);

COMMENT ON COLUMN board_files.file_id IS '파일 ID';
COMMENT ON COLUMN board_files.post_id IS '게시물 ID';
COMMENT ON COLUMN board_files.fil_file_name IS '파일명';
COMMENT ON COLUMN board_files.fil_file_url IS '파일경로';


-- common_codes 테이블 생성

CREATE TABLE common_codes (
    code_id SERIAL PRIMARY KEY,
    cod_group_code VARCHAR(50),
    cod_code_value VARCHAR(50),
    cod_code_name VARCHAR(100),
    cod_order_no INT,
    cod_active BOOLEAN
);

COMMENT ON COLUMN common_codes.code_id IS '코드 ID';
COMMENT ON COLUMN common_codes.cod_group_code IS '분류 코드';
COMMENT ON COLUMN common_codes.cod_code_value IS '코드값';
COMMENT ON COLUMN common_codes.cod_code_name IS '코드명';
COMMENT ON COLUMN common_codes.cod_order_no IS '정렬순서';
COMMENT ON COLUMN common_codes.cod_active IS '사용 여부';


-- popup_banners 테이블 생성

CREATE TABLE popup_banners (
    popup_id SERIAL PRIMARY KEY,
    pop_title VARCHAR(100),
    pop_content_type VARCHAR(20),
    pop_content TEXT,
    pop_start_date DATE,
    pop_end_date DATE,
    pop_active BOOLEAN
);

COMMENT ON COLUMN popup_banners.popup_id IS '팝업 ID';
COMMENT ON COLUMN popup_banners.pop_title IS '제목';
COMMENT ON COLUMN popup_banners.pop_content_type IS '형태 (이미지, HTML)';
COMMENT ON COLUMN popup_banners.pop_content IS '내용';
COMMENT ON COLUMN popup_banners.pop_start_date IS '시작일';
COMMENT ON COLUMN popup_banners.pop_end_date IS '종료일';
COMMENT ON COLUMN popup_banners.pop_active IS '활성 여부';


-- user_roles 테이블 생성

CREATE TABLE user_roles (
    role_id SERIAL PRIMARY KEY,
    rol_role_name VARCHAR(50),
    rol_role_type VARCHAR(20)
);

COMMENT ON COLUMN user_roles.role_id IS '권한 ID';
COMMENT ON COLUMN user_roles.rol_role_name IS '권한명';
COMMENT ON COLUMN user_roles.rol_role_type IS '유형 (관리자, 강사 등)';


-- role_permissions 테이블 생성

CREATE TABLE role_permissions (
    permission_id SERIAL PRIMARY KEY,
    role_id INT,
    per_menu_code VARCHAR(50),
    per_access_type VARCHAR(20)
);

COMMENT ON COLUMN role_permissions.permission_id IS '권한기능 ID';
COMMENT ON COLUMN role_permissions.role_id IS '권한 ID';
COMMENT ON COLUMN role_permissions.per_menu_code IS '메뉴 코드';
COMMENT ON COLUMN role_permissions.per_access_type IS '접근권한 (읽기, 쓰기 등)';


-- notification_rules 테이블 생성

CREATE TABLE notification_rules (
    rule_id SERIAL PRIMARY KEY,
    ntf_event_type VARCHAR(50),
    ntf_target_group VARCHAR(50),
    ntf_channel VARCHAR(20),
    ntf_schedule_offset INT
);

COMMENT ON COLUMN notification_rules.rule_id IS '알림 ID';
COMMENT ON COLUMN notification_rules.ntf_event_type IS '이벤트 유형 (이수, 미이수 등)';
COMMENT ON COLUMN notification_rules.ntf_target_group IS '대상 그룹';
COMMENT ON COLUMN notification_rules.ntf_channel IS '채널 (SMS, Email)';
COMMENT ON COLUMN notification_rules.ntf_schedule_offset IS '발송 시점 오프셋(일)';


-- terms_versions 테이블 생성

CREATE TABLE terms_versions (
    term_id SERIAL PRIMARY KEY,
    trm_term_type VARCHAR(50),
    trm_version VARCHAR(10),
    trm_content TEXT,
    trm_applied_at DATE,
    trm_created_at TIMESTAMP
);

COMMENT ON COLUMN terms_versions.term_id IS '약관 ID';
COMMENT ON COLUMN terms_versions.trm_term_type IS '약관유형';
COMMENT ON COLUMN terms_versions.trm_version IS '버전';
COMMENT ON COLUMN terms_versions.trm_content IS '약관 내용';
COMMENT ON COLUMN terms_versions.trm_applied_at IS '적용일';
COMMENT ON COLUMN terms_versions.trm_created_at IS '등록일';


-- dashboard_metrics 테이블 생성

CREATE TABLE dashboard_metrics (
    metric_id SERIAL PRIMARY KEY,
    dsm_metric_name VARCHAR(100),
    dsm_value DECIMAL(10,2),
    dsm_collected_at TIMESTAMP
);

COMMENT ON COLUMN dashboard_metrics.metric_id IS '지표 ID';
COMMENT ON COLUMN dashboard_metrics.dsm_metric_name IS '지표명';
COMMENT ON COLUMN dashboard_metrics.dsm_value IS '값';
COMMENT ON COLUMN dashboard_metrics.dsm_collected_at IS '수집 시점';


-- instructor_survey_statistics 테이블 생성

CREATE TABLE instructor_survey_statistics (
    stat_id SERIAL PRIMARY KEY,
    instructor_id INT,
    course_id INT REFERENCES courses(course_id),
    iss_survey_score DECIMAL(5,2),
    iss_submitted_count INT
);

COMMENT ON COLUMN instructor_survey_statistics.stat_id IS '설문통계 ID';
COMMENT ON COLUMN instructor_survey_statistics.instructor_id IS '강사 ID';
COMMENT ON COLUMN instructor_survey_statistics.course_id IS '과정 ID';
COMMENT ON COLUMN instructor_survey_statistics.iss_survey_score IS '평균 점수';
COMMENT ON COLUMN instructor_survey_statistics.iss_submitted_count IS '응답수';


-- member_histories 테이블 생성

CREATE TABLE member_histories (
    history_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    mh_change_type VARCHAR(50),
    mh_old_value TEXT,
    mh_new_value TEXT,
    mh_changed_at TIMESTAMP,
    mh_changed_by VARCHAR(50)
);

COMMENT ON COLUMN member_histories.history_id IS '이력 고유 ID';
COMMENT ON COLUMN member_histories.member_id IS '회원 ID';
COMMENT ON COLUMN member_histories.mh_change_type IS '변경 항목';
COMMENT ON COLUMN member_histories.mh_old_value IS '기존 값';
COMMENT ON COLUMN member_histories.mh_new_value IS '변경된 값';
COMMENT ON COLUMN member_histories.mh_changed_at IS '변경일시';
COMMENT ON COLUMN member_histories.mh_changed_by IS '변경자';


-- member_login_logs 테이블 생성

CREATE TABLE member_login_logs (
    log_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    mll_login_ip VARCHAR(50),
    mll_login_device VARCHAR(100),
    mll_login_success BOOLEAN,
    mll_login_time TIMESTAMP
);

COMMENT ON COLUMN member_login_logs.log_id IS '로그 고유 ID';
COMMENT ON COLUMN member_login_logs.member_id IS '회원 ID';
COMMENT ON COLUMN member_login_logs.mll_login_ip IS '로그인 IP';
COMMENT ON COLUMN member_login_logs.mll_login_device IS '디바이스 정보';
COMMENT ON COLUMN member_login_logs.mll_login_success IS '성공 여부';
COMMENT ON COLUMN member_login_logs.mll_login_time IS '로그인 시각';


-- member_login_policy 테이블 생성

CREATE TABLE member_login_policy (
    member_id INT,
    mlp_failed_count INT,
    mlp_locked BOOLEAN,
    mlp_last_failed_time TIMESTAMP,
    mlp_password_updated_at TIMESTAMP
);

COMMENT ON COLUMN member_login_policy.member_id IS '회원 ID';
COMMENT ON COLUMN member_login_policy.mlp_failed_count IS '비밀번호 실패 횟수';
COMMENT ON COLUMN member_login_policy.mlp_locked IS '계정 잠금 여부';
COMMENT ON COLUMN member_login_policy.mlp_last_failed_time IS '최종 실패 시각';
COMMENT ON COLUMN member_login_policy.mlp_password_updated_at IS '비밀번호 변경 일시';


-- member_sns_links 테이블 생성

CREATE TABLE member_sns_links (
    sns_link_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    msl_sns_provider VARCHAR(30),
    sns_user_id VARCHAR(100),
    msl_linked_at TIMESTAMP
);

COMMENT ON COLUMN member_sns_links.sns_link_id IS '연동 고유 ID';
COMMENT ON COLUMN member_sns_links.member_id IS '회원 ID';
COMMENT ON COLUMN member_sns_links.msl_sns_provider IS 'SNS 제공자 (Kakao, Naver 등)';
COMMENT ON COLUMN member_sns_links.sns_user_id IS 'SNS 사용자 고유 ID';
COMMENT ON COLUMN member_sns_links.msl_linked_at IS '연동일시';


-- course_schedules 테이블 생성

CREATE TABLE course_schedules (
    schedule_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    sch_name VARCHAR(50),
    sch_start_date DATE,
    sch_end_date DATE,
    sch_location VARCHAR(200),
    sch_capacity INT,
    sch_status VARCHAR(20)
);

COMMENT ON COLUMN course_schedules.schedule_id IS '기수 ID';
COMMENT ON COLUMN course_schedules.course_id IS '과정 ID';
COMMENT ON COLUMN course_schedules.sch_name IS '기수명';
COMMENT ON COLUMN course_schedules.sch_start_date IS '시작일';
COMMENT ON COLUMN course_schedules.sch_end_date IS '종료일';
COMMENT ON COLUMN course_schedules.sch_location IS '장소';
COMMENT ON COLUMN course_schedules.sch_capacity IS '정원';
COMMENT ON COLUMN course_schedules.sch_status IS '운영 상태';


-- course_exams 테이블 생성

CREATE TABLE course_exams (
    exam_id SERIAL PRIMARY KEY,
    schedule_id INT,
    exm_exam_title VARCHAR(200),
    exm_exam_date DATE
);

COMMENT ON COLUMN course_exams.exam_id IS '시험 ID';
COMMENT ON COLUMN course_exams.schedule_id IS '기수 ID';
COMMENT ON COLUMN course_exams.exm_exam_title IS '시험명';
COMMENT ON COLUMN course_exams.exm_exam_date IS '시험일';


-- course_surveys 테이블 생성

CREATE TABLE course_surveys (
    survey_id SERIAL PRIMARY KEY,
    schedule_id INT,
    srv_survey_title VARCHAR(200),
    srv_survey_url TEXT,
    srv_due_date DATE
);

COMMENT ON COLUMN course_surveys.survey_id IS '설문 ID';
COMMENT ON COLUMN course_surveys.schedule_id IS '기수 ID';
COMMENT ON COLUMN course_surveys.srv_survey_title IS '설문 제목';
COMMENT ON COLUMN course_surveys.srv_survey_url IS '설문 URL';
COMMENT ON COLUMN course_surveys.srv_due_date IS '설문 마감일';


-- course_syllabus 테이블 생성

CREATE TABLE course_syllabus (
    syllabus_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    syb_objective TEXT,
    syb_content TEXT,
    syb_schedule TEXT,
    syb_evaluation TEXT
);

COMMENT ON COLUMN course_syllabus.syllabus_id IS '강의계획서 ID';
COMMENT ON COLUMN course_syllabus.course_id IS '과정 ID';
COMMENT ON COLUMN course_syllabus.syb_objective IS '교육목표';
COMMENT ON COLUMN course_syllabus.syb_content IS '교육내용';
COMMENT ON COLUMN course_syllabus.syb_schedule IS '교육일정';
COMMENT ON COLUMN course_syllabus.syb_evaluation IS '평가방법';


-- course_approvals 테이블 생성

CREATE TABLE course_approvals (
    approval_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    apr_status VARCHAR(20),
    apr_requested_at TIMESTAMP,
    apr_processed_at TIMESTAMP,
    apr_processed_by VARCHAR(50),
    apr_reason TEXT
);

COMMENT ON COLUMN course_approvals.approval_id IS '승인 ID';
COMMENT ON COLUMN course_approvals.course_id IS '과정 ID';
COMMENT ON COLUMN course_approvals.apr_status IS '승인 상태';
COMMENT ON COLUMN course_approvals.apr_requested_at IS '승인요청일';
COMMENT ON COLUMN course_approvals.apr_processed_at IS '처리일';
COMMENT ON COLUMN course_approvals.apr_processed_by IS '처리자';
COMMENT ON COLUMN course_approvals.apr_reason IS '반려 사유';


-- course_import_logs 테이블 생성

CREATE TABLE course_import_logs (
    upload_id SERIAL PRIMARY KEY,
    upl_filename VARCHAR(255),
    upl_status VARCHAR(20),
    upl_error_count INT,
    upl_uploaded_by VARCHAR(50),
    upl_uploaded_at TIMESTAMP
);

COMMENT ON COLUMN course_import_logs.upload_id IS '업로드 ID';
COMMENT ON COLUMN course_import_logs.upl_filename IS '업로드 파일명';
COMMENT ON COLUMN course_import_logs.upl_status IS '상태';
COMMENT ON COLUMN course_import_logs.upl_error_count IS '오류 건수';
COMMENT ON COLUMN course_import_logs.upl_uploaded_by IS '업로드한 사용자';
COMMENT ON COLUMN course_import_logs.upl_uploaded_at IS '업로드 일시';


-- course_sessions 테이블 생성

CREATE TABLE course_sessions (
    session_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    ses_session_name VARCHAR(50),
    ses_start_date DATE,
    ses_end_date DATE,
    ses_mode VARCHAR(20)
);

COMMENT ON COLUMN course_sessions.session_id IS '기수 ID';
COMMENT ON COLUMN course_sessions.course_id IS '과정 ID';
COMMENT ON COLUMN course_sessions.ses_session_name IS '차수명';
COMMENT ON COLUMN course_sessions.ses_start_date IS '교육 시작일';
COMMENT ON COLUMN course_sessions.ses_end_date IS '교육 종료일';
COMMENT ON COLUMN course_sessions.ses_mode IS '운영방식';


-- session_communities 테이블 생성

CREATE TABLE session_communities (
    community_id SERIAL PRIMARY KEY,
    session_id INT,
    manager_id INT,
    com_board_notice BOOLEAN,
    com_board_files BOOLEAN,
    com_board_qna BOOLEAN
);

COMMENT ON COLUMN session_communities.community_id IS '커뮤니티 ID';
COMMENT ON COLUMN session_communities.session_id IS '기수 ID';
COMMENT ON COLUMN session_communities.manager_id IS '운영자 ID';
COMMENT ON COLUMN session_communities.com_board_notice IS '공지사항 사용 여부';
COMMENT ON COLUMN session_communities.com_board_files IS '자료실 사용 여부';
COMMENT ON COLUMN session_communities.com_board_qna IS 'Q&A 사용 여부';


-- session_enrollments 테이블 생성

CREATE TABLE session_enrollments (
    enrollment_id INT PRIMARY KEY,
    session_id INT,
    enr_status VARCHAR(20),
    enr_processed_at TIMESTAMP
);

COMMENT ON COLUMN session_enrollments.enrollment_id IS '수강신청 ID';
COMMENT ON COLUMN session_enrollments.session_id IS '기수 ID';
COMMENT ON COLUMN session_enrollments.enr_status IS '입과 상태';
COMMENT ON COLUMN session_enrollments.enr_processed_at IS '처리일시';


-- attendance_records 테이블 생성

CREATE TABLE attendance_records (
    attendance_id SERIAL PRIMARY KEY,
    enrollment_id INT REFERENCES enrollments(enrollment_id),
    att_attendance_date DATE,
    att_attended BOOLEAN,
    att_input_by VARCHAR(50),
    att_auto BOOLEAN
);

COMMENT ON COLUMN attendance_records.attendance_id IS '출결 ID';
COMMENT ON COLUMN attendance_records.enrollment_id IS '수강신청 ID';
COMMENT ON COLUMN attendance_records.att_attendance_date IS '출석일';
COMMENT ON COLUMN attendance_records.att_attended IS '출석 여부';
COMMENT ON COLUMN attendance_records.att_input_by IS '입력자';
COMMENT ON COLUMN attendance_records.att_auto IS '자동 출석 여부';


-- survey_results 테이블 생성

CREATE TABLE survey_results (
    survey_result_id SERIAL PRIMARY KEY,
    survey_id INT,
    enrollment_id INT REFERENCES enrollments(enrollment_id),
    srv_score DECIMAL(5,2),
    srv_statistical_use BOOLEAN
);

COMMENT ON COLUMN survey_results.survey_result_id IS '설문결과 ID';
COMMENT ON COLUMN survey_results.survey_id IS '설문 ID';
COMMENT ON COLUMN survey_results.enrollment_id IS '수강신청 ID';
COMMENT ON COLUMN survey_results.srv_score IS '평가점수';
COMMENT ON COLUMN survey_results.srv_statistical_use IS '통계 활용 여부';


-- course_reviews 테이블 생성

CREATE TABLE course_reviews (
    review_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(course_id),
    member_id INT REFERENCES members(member_id),
    rev_content TEXT,
    rev_visible BOOLEAN,
    rev_approved BOOLEAN
);

COMMENT ON COLUMN course_reviews.review_id IS '후기 ID';
COMMENT ON COLUMN course_reviews.course_id IS '과정 ID';
COMMENT ON COLUMN course_reviews.member_id IS '작성자 ID';
COMMENT ON COLUMN course_reviews.rev_content IS '후기 내용';
COMMENT ON COLUMN course_reviews.rev_visible IS '공개 여부';
COMMENT ON COLUMN course_reviews.rev_approved IS '관리자 승인 여부';


-- completion_notifications 테이블 생성

CREATE TABLE completion_notifications (
    notification_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    course_id INT REFERENCES courses(course_id),
    session_id INT,
    ntf_channel VARCHAR(20),
    ntf_sent_at TIMESTAMP
);

COMMENT ON COLUMN completion_notifications.notification_id IS '알림 ID';
COMMENT ON COLUMN completion_notifications.member_id IS '수료자 ID';
COMMENT ON COLUMN completion_notifications.course_id IS '과정 ID';
COMMENT ON COLUMN completion_notifications.session_id IS '기수 ID';
COMMENT ON COLUMN completion_notifications.ntf_channel IS '발송 채널';
COMMENT ON COLUMN completion_notifications.ntf_sent_at IS '발송일시';


-- permission_layouts 테이블 생성

CREATE TABLE permission_layouts (
    layout_id SERIAL PRIMARY KEY,
    lay_role VARCHAR(20),
    lay_menu_config TEXT,
    lay_layout_template VARCHAR(100)
);

COMMENT ON COLUMN permission_layouts.layout_id IS '레이아웃 ID';
COMMENT ON COLUMN permission_layouts.lay_role IS '사용자 역할';
COMMENT ON COLUMN permission_layouts.lay_menu_config IS '메뉴 구성';
COMMENT ON COLUMN permission_layouts.lay_layout_template IS '기본 레이아웃 템플릿';


-- enrollment_cancellations 테이블 생성

CREATE TABLE enrollment_cancellations (
    cancel_id SERIAL PRIMARY KEY,
    enrollment_id INT REFERENCES enrollments(enrollment_id),
    can_cancel_reason TEXT,
    can_cancelable BOOLEAN,
    can_cancelled_at TIMESTAMP
);

COMMENT ON COLUMN enrollment_cancellations.cancel_id IS '취소 ID';
COMMENT ON COLUMN enrollment_cancellations.enrollment_id IS '수강신청 ID';
COMMENT ON COLUMN enrollment_cancellations.can_cancel_reason IS '취소 사유';
COMMENT ON COLUMN enrollment_cancellations.can_cancelable IS '취소 가능 여부';
COMMENT ON COLUMN enrollment_cancellations.can_cancelled_at IS '취소일시';


-- group_enrollments 테이블 생성

CREATE TABLE group_enrollments (
    group_enroll_id SERIAL PRIMARY KEY,
    representative_id INT,
    course_id INT REFERENCES courses(course_id),
    grp_member_count INT,
    grp_total_payment INT,
    grp_paid_at TIMESTAMP
);

COMMENT ON COLUMN group_enrollments.group_enroll_id IS '단체신청 ID';
COMMENT ON COLUMN group_enrollments.representative_id IS '대표자 회원 ID';
COMMENT ON COLUMN group_enrollments.course_id IS '과정 ID';
COMMENT ON COLUMN group_enrollments.grp_member_count IS '구성원 수';
COMMENT ON COLUMN group_enrollments.grp_total_payment IS '총 결제 금액';
COMMENT ON COLUMN group_enrollments.grp_paid_at IS '결제일시';


-- manual_enrollments 테이블 생성

CREATE TABLE manual_enrollments (
    manual_id SERIAL PRIMARY KEY,
    mnl_member_name VARCHAR(100),
    course_id INT REFERENCES courses(course_id),
    session_id INT,
    mnl_phone VARCHAR(20),
    mnl_registered_by VARCHAR(50),
    mnl_registered_at TIMESTAMP
);

COMMENT ON COLUMN manual_enrollments.manual_id IS '수기신청 ID';
COMMENT ON COLUMN manual_enrollments.mnl_member_name IS '신청자명';
COMMENT ON COLUMN manual_enrollments.course_id IS '과정 ID';
COMMENT ON COLUMN manual_enrollments.session_id IS '기수 ID';
COMMENT ON COLUMN manual_enrollments.mnl_phone IS '연락처';
COMMENT ON COLUMN manual_enrollments.mnl_registered_by IS '등록 관리자 ID';
COMMENT ON COLUMN manual_enrollments.mnl_registered_at IS '등록일시';


-- course_recommendations 테이블 생성

CREATE TABLE course_recommendations (
    recommend_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    course_id INT REFERENCES courses(course_id),
    rcm_recommend_type VARCHAR(50),
    rcm_recommended_at TIMESTAMP
);

COMMENT ON COLUMN course_recommendations.recommend_id IS '추천 ID';
COMMENT ON COLUMN course_recommendations.member_id IS '회원 ID';
COMMENT ON COLUMN course_recommendations.course_id IS '추천 과정 ID';
COMMENT ON COLUMN course_recommendations.rcm_recommend_type IS '추천유형';
COMMENT ON COLUMN course_recommendations.rcm_recommended_at IS '추천일시';


-- enrollment_duplicates 테이블 생성

CREATE TABLE enrollment_duplicates (
    duplication_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    course_id INT REFERENCES courses(course_id),
    session_id INT,
    dup_detected_at TIMESTAMP
);

COMMENT ON COLUMN enrollment_duplicates.duplication_id IS '중복감지 ID';
COMMENT ON COLUMN enrollment_duplicates.member_id IS '회원 ID';
COMMENT ON COLUMN enrollment_duplicates.course_id IS '과정 ID';
COMMENT ON COLUMN enrollment_duplicates.session_id IS '기수 ID';
COMMENT ON COLUMN enrollment_duplicates.dup_detected_at IS '감지 일시';


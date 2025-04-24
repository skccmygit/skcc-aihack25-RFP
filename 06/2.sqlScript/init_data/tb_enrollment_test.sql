-- 1. 승인된 수강신청, 결제 완료
--INSERT INTO TB_ENROLLMENT (enrollment_id, user_id, course_id, class_id, enrollment_date, status, approval_date, approval_user_id, cancel_date, cancel_reason, is_waiting, waiting_number, payment_status, payment_amount, payment_date, refund_status, refund_amount, refund_date, memo) 
--VALUES (1, 'user001', 1, 1, '2025-03-15 14:30:00', 'APPROVED', '2025-03-16 09:15:00', 'admin001', NULL, NULL, FALSE, NULL, 'COMPLETED', 150000.00, '2025-03-16 10:30:00', 'NONE', NULL, NULL, '정상 처리된 수강신청');
--
-- 2. 대기중 상태의 수강신청
--INSERT INTO TB_ENROLLMENT (enrollment_id, user_id, course_id, class_id, enrollment_date, status, approval_date, approval_user_id, cancel_date, cancel_reason, is_waiting, waiting_number, payment_status, payment_amount, payment_date, refund_status, refund_amount, refund_date, memo) 
--VALUES (2, 'user002', 2, 2, '2025-04-01 16:45:00', 'PENDING', NULL, NULL, NULL, NULL, TRUE, 3, 'NONE', NULL, NULL, 'NONE', NULL, NULL, '수강 인원 초과로 대기자 등록');
--
-- 3. 거부된 수강신청
--INSERT INTO TB_ENROLLMENT (enrollment_id, user_id, course_id, class_id, enrollment_date, status, approval_date, approval_user_id, cancel_date, cancel_reason, is_waiting, waiting_number, payment_status, payment_amount, payment_date, refund_status, refund_amount, refund_date, memo) 
--VALUES (3, 'user003', 3, 3, '2025-03-22 11:20:00', 'REJECTED', '2025-03-23 14:10:00', 'admin001', NULL, '선수 과목 미이수', FALSE, NULL, 'NONE', NULL, NULL, 'NONE', NULL, NULL, '선수 과목을 먼저 이수해야 함');
--
-- 4. 취소된 수강신청, 환불 완료
--INSERT INTO TB_ENROLLMENT (enrollment_id, user_id, course_id, class_id, enrollment_date, status, approval_date, approval_user_id, cancel_date, cancel_reason, is_waiting, waiting_number, payment_status, payment_amount, payment_date, refund_status, refund_amount, refund_date, memo) 
--VALUES (4, 'user001', 4, 4, '2025-02-10 09:30:00', 'CANCELLED', '2025-02-11 10:15:00', 'admin001', '2025-02-15 13:40:00', '개인 사정으로 인한 취소', FALSE, NULL, 'CANCELLED', 200000.00, '2025-02-11 11:20:00', 'COMPLETED', 180000.00, '2025-02-16 14:30:00', '수수료 공제 후 환불 완료');
--
-- 5. 승인 대기중 상태의 일반 수강신청
--INSERT INTO TB_ENROLLMENT (enrollment_id, user_id, course_id, class_id, enrollment_date, status, approval_date, approval_user_id, cancel_date, cancel_reason, is_waiting, waiting_number, payment_status, payment_amount, payment_date, refund_status, refund_amount, refund_date, memo) 
--VALUES (5, 'user004', 5, 5, '2025-04-10 15:20:00', 'PENDING', NULL, NULL, NULL, NULL, FALSE, NULL, 'WAITING', 120000.00, NULL, 'NONE', NULL, NULL, '결제 대기중');

-- 1. 완료된 학습 진도
INSERT INTO TB_LEARNING_PROGRESS (progress_id, enrollment_id, content_id, progress_rate, status, start_time, complete_time, last_access_time, learning_time, last_position) 
VALUES (1, 1, 1, 100.00, 'COMPLETED', '2025-03-20 10:15:00', '2025-03-20 11:45:00', '2025-03-20 11:45:00', 5400, 1845);

-- 2. 진행 중인 학습 진도
INSERT INTO TB_LEARNING_PROGRESS (progress_id, enrollment_id, content_id, progress_rate, status, start_time, complete_time, last_access_time, learning_time, last_position) 
VALUES (2, 1, 2, 45.50, 'IN_PROGRESS', '2025-03-22 14:30:00', NULL, '2025-03-23 15:40:00', 2370, 975);

-- 3. 아직 시작하지 않은 학습 진도
INSERT INTO TB_LEARNING_PROGRESS (progress_id, enrollment_id, content_id, progress_rate, status, start_time, complete_time, last_access_time, learning_time, last_position) 
VALUES (3, 2, 3, 0.00, 'NOT_STARTED', NULL, NULL, NULL, 0, 0);

-- 4. 일시 중단된 학습 진도
INSERT INTO TB_LEARNING_PROGRESS (progress_id, enrollment_id, content_id, progress_rate, status, start_time, complete_time, last_access_time, learning_time, last_position) 
VALUES (4, 4, 4, 75.20, 'PAUSED', '2025-02-12 09:20:00', NULL, '2025-02-14 16:10:00', 3600, 1350);

-- 5. 완료된 짧은 콘텐츠 학습 진도
INSERT INTO TB_LEARNING_PROGRESS (progress_id, enrollment_id, content_id, progress_rate, status, start_time, complete_time, last_access_time, learning_time, last_position) 
VALUES (5, 5, 5, 100.00, 'COMPLETED', '2025-04-11 11:30:00', '2025-04-11 12:15:00', '2025-04-11 12:15:00', 2700, 2700);

-- 1. 정상 출석
INSERT INTO TB_ATTENDANCE (attendance_id, enrollment_id, class_date, attendance_type, check_in_time, check_out_time, absence_reason, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (1, 1, '2025-03-18', 'PRESENT', '2025-03-18 09:00:00', '2025-03-18 18:00:00', NULL, 'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 2. 지각
INSERT INTO TB_ATTENDANCE (attendance_id, enrollment_id, class_date, attendance_type, check_in_time, check_out_time, absence_reason, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (2, 1, '2025-03-19', 'LATE', '2025-03-19 09:30:00', '2025-03-19 18:00:00', '교통 혼잡', 'admin001', CURRENT_TIMESTAMP, 'admin002', '2025-03-19 10:00:00');

-- 3. 결석 (사유 있음)
INSERT INTO TB_ATTENDANCE (attendance_id, enrollment_id, class_date, attendance_type, check_in_time, check_out_time, absence_reason, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (3, 2, '2025-04-02', 'ABSENT', NULL, NULL, '병가 (진단서 제출)', 'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 4. 조퇴
INSERT INTO TB_ATTENDANCE (attendance_id, enrollment_id, class_date, attendance_type, check_in_time, check_out_time, absence_reason, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (4, 4, '2025-02-12', 'EARLY_LEAVE', '2025-02-12 09:00:00', '2025-02-12 15:30:00', '개인 사정', 'admin002', CURRENT_TIMESTAMP, NULL, NULL);

-- 5. 결석 (무단)
INSERT INTO TB_ATTENDANCE (attendance_id, enrollment_id, class_date, attendance_type, check_in_time, check_out_time, absence_reason, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (5, 5, '2025-04-11', 'ABSENT', NULL, NULL, '무단 결석', 'admin001', CURRENT_TIMESTAMP, 'admin001', '2025-04-12 09:15:00');

-- 1. 기본 퀴즈 평가
INSERT INTO TB_ASSESSMENT (assessment_id, course_id, class_id, assessment_name, assessment_type, assessment_desc, start_date, end_date, total_score, pass_score, time_limit, attempt_limit, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (1, 1, 1, '파이썬 기초 개념 퀴즈', 'QUIZ', '파이썬의 기본 문법과 개념을 평가하는 퀴즈입니다.', '2025-03-20 09:00:00', '2025-03-20 23:59:59', 100.00, 60.00, 30, 3, TRUE, 'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 2. 중간 시험
INSERT INTO TB_ASSESSMENT (assessment_id, course_id, class_id, assessment_name, assessment_type, assessment_desc, start_date, end_date, total_score, pass_score, time_limit, attempt_limit, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (2, 2, 2, 'Java 중급 중간고사', 'EXAM', 'Java 객체지향 개념에 대한 중간고사입니다.', '2025-04-15 14:00:00', '2025-04-15 17:00:00', 100.00, 70.00, 180, 1, TRUE, 'admin001', CURRENT_TIMESTAMP, 'admin002', '2025-04-10 11:20:00');

-- 3. 과제 제출
INSERT INTO TB_ASSESSMENT (assessment_id, course_id, class_id, assessment_name, assessment_type, assessment_desc, start_date, end_date, total_score, pass_score, time_limit, attempt_limit, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (3, 3, 3, 'React 컴포넌트 개발 과제', 'ASSIGNMENT', 'React 컴포넌트 설계 및 구현 과제입니다.', '2025-03-25 00:00:00', '2025-04-01 23:59:59', 100.00, 60.00, NULL, 2, TRUE, 'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 4. 비활성화된 평가
INSERT INTO TB_ASSESSMENT (assessment_id, course_id, class_id, assessment_name, assessment_type, assessment_desc, start_date, end_date, total_score, pass_score, time_limit, attempt_limit, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (4, 4, 4, '데이터 분석 최종 프로젝트', 'PROJECT', '실제 데이터셋을 분석하는 최종 프로젝트입니다.', '2025-02-20 00:00:00', '2025-03-10 23:59:59', 100.00, 70.00, NULL, 1, FALSE, 'admin002', CURRENT_TIMESTAMP, 'admin001', '2025-03-01 09:30:00');

-- 5. 제한 없는 자가 평가 퀴즈
INSERT INTO TB_ASSESSMENT (assessment_id, course_id, class_id, assessment_name, assessment_type, assessment_desc, start_date, end_date, total_score, pass_score, time_limit, attempt_limit, is_active, reg_user_id, reg_date, mod_user_id, mod_date) 
VALUES (5, 5, 5, '머신러닝 자가진단 퀴즈', 'SELF_CHECK', '개인 학습 상태를 점검하기 위한 자가진단 퀴즈입니다.', '2025-04-01 00:00:00', '2025-05-31 23:59:59', 100.00, 0.00, NULL, NULL, TRUE, 'admin001', CURRENT_TIMESTAMP, NULL, NULL);

-- 1. 합격한 퀴즈 결과
INSERT INTO TB_ASSESSMENT_RESULT (result_id, assessment_id, enrollment_id, attempt, score, pass_yn, start_time, end_time, feedback, grade_user_id, grade_date, reg_date) 
VALUES (1, 1, 1, 1, 85.00, 'Y', '2025-03-20 10:30:00', '2025-03-20 10:55:00', '기본 개념을 잘 이해하고 있습니다.', 'admin001', '2025-03-20 11:10:00', CURRENT_TIMESTAMP);

-- 2. 여러 번 시도 후 합격한 결과
INSERT INTO TB_ASSESSMENT_RESULT (result_id, assessment_id, enrollment_id, attempt, score, pass_yn, start_time, end_time, feedback, grade_user_id, grade_date, reg_date) 
VALUES (2, 1, 2, 2, 75.00, 'Y', '2025-03-20 14:00:00', '2025-03-20 14:25:00', '이전 시도보다 향상되었습니다.', 'admin001', '2025-03-20 15:00:00', CURRENT_TIMESTAMP);

-- 3. 불합격한 시험 결과
INSERT INTO TB_ASSESSMENT_RESULT (result_id, assessment_id, enrollment_id, attempt, score, pass_yn, start_time, end_time, feedback, grade_user_id, grade_date, reg_date) 
VALUES (3, 2, 3, 1, 55.00, 'N', '2025-04-15 14:00:00', '2025-04-15 16:30:00', '객체지향 개념 부분에 대한 추가 학습이 필요합니다.', 'admin002', '2025-04-16 10:15:00', CURRENT_TIMESTAMP);

-- 4. 과제 제출 결과
INSERT INTO TB_ASSESSMENT_RESULT (result_id, assessment_id, enrollment_id, attempt, score, pass_yn, start_time, end_time, feedback, grade_user_id, grade_date, reg_date) 
VALUES (4, 3, 4, 1, 92.00, 'Y', '2025-03-26 09:15:00', '2025-03-30 23:45:00', '창의적인 접근과 깔끔한 코드 구현이 돋보입니다.', 'admin001', '2025-04-02 14:20:00', CURRENT_TIMESTAMP);

-- 5. 자가진단 퀴즈 결과
INSERT INTO TB_ASSESSMENT_RESULT (result_id, assessment_id, enrollment_id, attempt, score, pass_yn, start_time, end_time, feedback, grade_user_id, grade_date, reg_date) 
VALUES (5, 5, 5, 1, 60.00, 'Y', '2025-04-05 20:00:00', '2025-04-05 20:15:00', NULL, NULL, NULL, CURRENT_TIMESTAMP);

-- 1. 정상 수료, 수료증 발급
INSERT INTO TB_COMPLETION (completion_id, enrollment_id, completion_date, completion_status, total_score, attendance_score, assessment_score, progress_score, certificate_no, certificate_issue_date, certificate_status, approval_user_id, approval_date, memo, reg_date, mod_date) 
VALUES (1, 1, '2025-06-30', 'COMPLETED', 92.50, 95.00, 90.00, 95.00, 'CERT-2025-001', '2025-07-01 10:30:00', 'ISSUED', 'admin001', '2025-06-30 16:45:00', '우수한 성적으로 수료함', CURRENT_TIMESTAMP, NULL);

-- 2. 조건부 수료 (진도율 부족)
INSERT INTO TB_COMPLETION (completion_id, enrollment_id, completion_date, completion_status, total_score, attendance_score, assessment_score, progress_score, certificate_no, certificate_issue_date, certificate_status, approval_user_id, approval_date, memo, reg_date, mod_date) 
VALUES (2, 2, '2025-08-15', 'CONDITIONAL', 75.20, 90.00, 85.00, 60.00, NULL, NULL, 'NOT_ISSUED', 'admin002', '2025-08-15 15:30:00', '진도율 부족으로 조건부 수료, 추가 과제 제출 필요', CURRENT_TIMESTAMP, '2025-08-16 09:20:00');

-- 3. 미수료 (출석 부족)
INSERT INTO TB_COMPLETION (completion_id, enrollment_id, completion_date, completion_status, total_score, attendance_score, assessment_score, progress_score, certificate_no, certificate_issue_date, certificate_status, approval_user_id, approval_date, memo, reg_date, mod_date) 
VALUES (3, 3, '2025-05-10', 'FAILED', 60.75, 50.00, 75.00, 80.00, NULL, NULL, 'NOT_ISSUED', 'admin001', '2025-05-10 14:20:00', '출석률 80% 미만으로 수료 기준 미달', CURRENT_TIMESTAMP, NULL);

-- 4. 우수 수료
INSERT INTO TB_COMPLETION (completion_id, enrollment_id, completion_date, completion_status, total_score, attendance_score, assessment_score, progress_score, certificate_no, certificate_issue_date, certificate_status, approval_user_id, approval_date, memo, reg_date, mod_date) 
VALUES (4, 4, '2025-03-05', 'COMPLETED_HONOR', 96.80, 100.00, 95.00, 98.00, 'CERT-2025-002', '2025-03-06 11:15:00', 'ISSUED', 'admin001', '2025-03-05 17:30:00', '최우수 성적으로 수료, 우수 수강생 선정', CURRENT_TIMESTAMP, NULL);

-- 5. 승인 대기 중인 수료
INSERT INTO TB_COMPLETION (completion_id, enrollment_id, completion_date, completion_status, total_score, attendance_score, assessment_score, progress_score, certificate_no, certificate_issue_date, certificate_status, approval_user_id, approval_date, memo, reg_date, mod_date) 
VALUES (5, 5, '2025-07-20', 'PENDING', 88.40, 90.00, 85.00, 90.00, NULL, NULL, 'NOT_ISSUED', NULL, NULL, '수료 승인 대기 중', CURRENT_TIMESTAMP, NULL);

-- TB_ROLE 테이블 데이터 삽입
INSERT INTO TB_ROLE (role_id, role_name, role_desc, is_system, reg_date) 
VALUES (1, '관리자', '시스템 관리자 권한', TRUE, CURRENT_TIMESTAMP);

INSERT INTO TB_ROLE (role_id, role_name, role_desc, is_system, reg_date) 
VALUES (2, '일반사용자', '일반 사용자 권한', FALSE, CURRENT_TIMESTAMP);

INSERT INTO TB_ROLE (role_id, role_name, role_desc, is_system, reg_date) 
VALUES (3, '강사', '강사 권한', FALSE, CURRENT_TIMESTAMP);

-- 관리자 권한(role_id: 1) - 모든 메뉴에 대한 모든 권한 부여
INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (1, 1, TRUE, TRUE, TRUE, TRUE, CURRENT_TIMESTAMP, 'admin');

INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (1, 2, TRUE, TRUE, TRUE, TRUE, CURRENT_TIMESTAMP, 'admin');

INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (1, 3, TRUE, TRUE, TRUE, TRUE, CURRENT_TIMESTAMP, 'admin');

INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (1, 4, TRUE, TRUE, TRUE, TRUE, CURRENT_TIMESTAMP, 'admin');

INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (1, 5, TRUE, TRUE, TRUE, TRUE, CURRENT_TIMESTAMP, 'admin');

-- 일반사용자 권한(role_id: 2) - 일부 메뉴에 대한 읽기 권한만 부여
INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (2, 1, TRUE, FALSE, FALSE, FALSE, CURRENT_TIMESTAMP, 'admin');

INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (2, 2, TRUE, FALSE, FALSE, FALSE, CURRENT_TIMESTAMP, 'admin');

INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (2, 5, TRUE, FALSE, FALSE, FALSE, CURRENT_TIMESTAMP, 'admin');

-- 강사 권한(role_id: 3) - 일부 메뉴에 대한 읽기, 쓰기, 수정 권한 부여(삭제 권한 제외)
INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (3, 2, TRUE, TRUE, TRUE, FALSE, CURRENT_TIMESTAMP, 'admin');

INSERT INTO TB_ROLE_MENU (role_id, menu_id, read_auth, write_auth, update_auth, delete_auth, reg_date, reg_user_id) 
VALUES (3, 3, TRUE, TRUE, TRUE, FALSE, CURRENT_TIMESTAMP, 'admin');

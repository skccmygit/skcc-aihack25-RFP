-- TB_ROLE (권한 정보) 테이블 생성
CREATE TABLE TB_ROLE (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL,
    role_desc VARCHAR(255),
    is_system BOOLEAN NOT NULL DEFAULT FALSE,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
);

-- TB_MENU (메뉴 정보) 테이블 생성
CREATE TABLE TB_MENU (
    menu_id SERIAL PRIMARY KEY,
    parent_menu_id INTEGER,
    menu_name VARCHAR(100) NOT NULL,
    menu_desc VARCHAR(255),
    menu_url VARCHAR(255),
    menu_type VARCHAR(20) NOT NULL,
    icon VARCHAR(50),
    order_no INTEGER NOT NULL DEFAULT 0,
    depth INTEGER NOT NULL DEFAULT 1,
    use_yn CHAR(1) NOT NULL DEFAULT 'Y',
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP
--    ,
--    CONSTRAINT fk_parent_menu FOREIGN KEY (parent_menu_id) REFERENCES TB_MENU(menu_id) ON DELETE SET NULL
);

-- TB_ROLE_MENU (권한별 메뉴 매핑 정보) 테이블 생성
CREATE TABLE TB_ROLE_MENU (
    role_id INTEGER NOT NULL,
    menu_id INTEGER NOT NULL,
    read_auth BOOLEAN NOT NULL DEFAULT FALSE,
    write_auth BOOLEAN NOT NULL DEFAULT FALSE,
    update_auth BOOLEAN NOT NULL DEFAULT FALSE,
    delete_auth BOOLEAN NOT NULL DEFAULT FALSE,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reg_user_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (role_id, menu_id)
--    ,
--    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES TB_ROLE(role_id) ON DELETE CASCADE,
--    CONSTRAINT fk_menu FOREIGN KEY (menu_id) REFERENCES TB_MENU(menu_id) ON DELETE CASCADE
);


INSERT INTO users (email, username, password, user_role, registered_at, last_login_at) VALUES
    ('admin@example.com', 'admin', 'password', 'ADMIN', '2025-04-01 09:00:00', '2025-04-20 11:00:00'),
    ('user1@example.com', 'user1', 'password', 'USER', '2025-04-02 10:00:00', '2025-04-19 14:30:00'),
    ('user2@example.com', 'user2', 'password', 'USER', '2025-04-03 11:30:00', '2025-04-18 12:00:00'),
    ('instructor1@example.com', 'instructor1', 'password', 'ADMIN', '2025-04-04 08:00:00', '2025-04-17 10:20:00'),
    ('instructor2@example.com', 'instructor2', 'password', 'ADMIN', '2025-04-05 13:20:00', '2025-04-16 09:45:00'),
    ('member1@example.com', 'member1', 'password', 'USER', '2025-04-06 07:50:00', '2025-04-15 13:15:00'),
    ('member2@example.com', 'member2', 'password', 'USER', '2025-04-07 16:00:00', '2025-04-14 15:10:00'),
    ('coach@example.com', 'coach', 'password', 'ADMIN', '2025-04-08 09:30:00', '2025-04-13 16:00:00'),
    ('staff1@example.com', 'staff1', 'password', 'ADMIN', '2025-04-09 12:00:00', '2025-04-12 11:00:00'),
    ('guest1@example.com', 'guest1', 'password', 'USER', '2025-04-10 14:10:00', '2025-04-11 12:20:00');

INSERT INTO courses (title, course_edu_category, course_edu_type, description, price, instructor_id, created_at, course_edu_status, location)
VALUES
    ('축구 심판 교육 1차', 'REFEREE', 'OFFLINE', '초급 축구 심판 과정', 50000, 1, '2025-04-22 17:00:00', 'OPEN', '서울 올림픽공원'),
    ('스포츠 행정 입문반', 'ADMIN', 'ONLINE', '스포츠 행정 기초 강의', 0, 2, '2025-04-22 17:00:00', 'OPEN', '온라인'),
    ('엘리트 선수 심화훈련', 'ATHLETE', 'HYBRID', '엘리트 대상 심화 과정', 150000, 3, '2025-04-22 17:00:00', 'OPEN', '대전 체육관'),
    ('스포츠 일반 교양 강좌', 'GENERAL', 'OFFLINE', '누구나 수강 가능한 교양 강좌', 30000, 4, '2025-04-22 17:00:00', 'OPEN', '부산 체육센터'),
    ('심판 고급 과정', 'REFEREE', 'HYBRID', '프로 심판 대상 고급 과정', 80000, 1, '2025-04-22 17:00:00', 'OPEN', '인천 경기장'),
    ('생활체육 지도자 과정', 'GENERAL', 'OFFLINE', '생활체육 지도자를 위한 교육', 20000, 5, '2025-04-22 17:00:00', 'OPEN', '서울 종합운동장'),
    ('스포츠 마케팅 기본', 'ADMIN', 'ONLINE', '스포츠 마케팅 개론 과정', 0, 6, '2025-04-22 17:00:00', 'OPEN', '온라인'),
    ('축구 기본기 훈련법', 'ATHLETE', 'OFFLINE', '축구 초급자를 위한 기본기 훈련', 45000, 3, '2025-04-22 17:00:00', 'OPEN', '대구 스타디움'),
    ('e스포츠 심판 과정', 'REFEREE', 'ONLINE', 'e스포츠 전문 심판 양성 과정', 60000, 7, '2025-04-22 17:00:00', 'OPEN', '온라인'),
    ('글로벌 스포츠 리더십 과정', 'ADMIN', 'HYBRID', '글로벌 스포츠 리더십 함양 과정', 120000, 8, '2025-04-22 17:00:00', 'OPEN', '서울 월드컵경기장'),
    ('비대면 스포츠 트레이닝', 'ATHLETE', 'ONLINE', '온라인 스포츠 트레이닝 과정', 25000, 5, '2025-04-22 17:00:00', 'OPEN', '온라인'),
    ('스포츠 영양학 기본', 'GENERAL', 'ONLINE', '스포츠 영양학 기초 과정', 0, 6, '2025-04-22 17:00:00', 'OPEN', '온라인');

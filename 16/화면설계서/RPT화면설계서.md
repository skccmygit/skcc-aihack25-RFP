# 통계 대시보드 화면 (RPT-SCR-001)
## 사용 역할자 : 시스템 관리자
## 관련 메뉴 : 관리자 시스템 > 통계 관리 > 대시보드 (메인)
---
## 기능 1: 주요 학습 통계 지표 시각화 조회

- 관련 요구사항: RPT-REQ-013 (학습 통계 대시보드 제공), RPT-REQ-014 (전체 교육 현황 조회 - 요약), RPT-REQ-015 (수강생 현황 조회 - 요약), RPT-REQ-016 (매출 현황 조회 - 요약), RPT-REQ-017 (데이터 시각화 기능)
- 입력 정보:
    - **기간 선택 필터:** 드롭다운 또는 버튼 그룹 (오늘, 최근 7일, 최근 1개월, 최근 1년, 사용자 지정). 기본값은 '최근 1개월'.
- 출력 정보:
    - **주요 지표 카드(KPI 위젯):** (선택된 기간 기준)
        - 총 방문자 수 / 신규 가입자 수.
        - 총 개설 과정(기수) 수 / 진행 중 과정 수.
        - 총 수강 신청 건수 / 총 수강생 수 (중복 제거).
        - 총 수료 건수 / 평균 수료율(%).
        - 총 매출액 / 평균 객단가.
        - 활성 강사 수.
    - **시각화 차트:** (선택된 기간 기준)
        - **일별/주별 방문자 수 추이:** 라인 차트.
        - **과정 유형별 수강 신청 비율:** 파이 차트 또는 도넛 차트.
        - **월별 매출액 추이:** 막대 차트 또는 라인 차트.
        - **상위 인기 과정 Top 5:** 가로 막대 차트 (신청 수 기준).
        - **수강생 지역 분포 (있는 경우):** 지도 차트 또는 막대 차트.
    - **최근 활동 요약:**
        - 최근 등록된 과정/기수 목록 (간략히).
        - 최근 가입한 학습자 목록 (간략히).
        - 최근 완료된 설문/평가 현황 (간략히).
- 프로세스 설명:
    1. 관리자가 통계 대시보드 화면에 접속하면, 기본 기간(예: 최근 1개월)에 대한 통계 데이터가 조회되어 표시된다.
    2. 프론트엔드는 선택된 기간 정보를 포함하여 대시보드 데이터 조회 API (`GET /api/v1/admin/statistics/dashboard?period=...`)를 호출한다.
    3. 백엔드(RPT 모듈)는 필요한 통계 데이터를 각 모듈(USR, COU, LRN, SYS 등)의 운영 DB 또는 별도 통계 DB에서 집계/분석하여 요약 지표 및 차트용 데이터를 반환한다. (데이터 집계는 실시간 또는 배치성 작업으로 수행될 수 있음)
    4. 프론트엔드는 응답받은 데이터를 사용하여 KPI 카드 및 차트 라이브러리(Chart.js, ECharts 등)를 이용해 시각화하여 표시한다.
    5. 관리자가 기간 필터를 변경하면, 해당 기간으로 API를 재호출하여 대시보드를 갱신한다.
- 호출 API 정보:
    - **대시보드 데이터 조회 API:**
        - HTTP 메서드: `GET`
        - API 엔드포인트: `/api/v1/admin/statistics/dashboard`
        - 파라미터: `period` (예: `TODAY`, `LAST_7_DAYS`, `LAST_MONTH`, `LAST_YEAR`) 또는 `startDate`, `endDate`
        - 응답 데이터 (예시):
            ```json
            {
              "summary": {
                "totalVisitors": 1500, "newUsers": 120,
                "totalBatches": 50, "activeBatches": 15,
                "totalEnrollments": 800, "uniqueLearners": 650,
                "totalCompletions": 450, "avgCompletionRate": 75.5,
                "totalRevenue": 12500000, "avgRevenuePerUser": 19230,
                "activeInstructors": 25
              },
              "charts": {
                "visitorTrend": { "labels": ["...", "..."], "data": [..., ...] },
                "enrollmentByType": { "labels": ["온라인", "집합", "혼합"], "data": [500, 200, 100] },
                "revenueTrend": { "labels": ["...", "..."], "data": [..., ...] },
                "topCourses": [ { "title": "...", "count": 80 }, ... ],
                "learnerRegion": { "labels": ["서울", "경기", "..."], "data": [300, 150, ...] }
              },
              "recentActivities": { ... } // 최근 활동 요약 데이터
            }
            ```
- Mockup 데이터: 없음 (API 응답 기반 동적 생성).

---
## 기능 2: 주요 통계 화면 바로가기

- 관련 요구사항: RPT-REQ-009 (리포팅 페이지 제공 - 대시보드에서 상세 페이지로 연결)
- 입력 정보: 각 KPI 카드 또는 차트 제목 영역의 '상세보기' 링크 클릭.
- 출력 정보: 해당 통계의 상세 조회 화면(RPT-SCR-002 ~ RPT-SCR-006)으로 이동.
- 프로세스 설명: 사용자가 특정 지표나 차트의 상세 정보를 보기 위해 링크를 클릭하면, 해당 상세 통계 화면으로 이동시킨다. 이동 시 현재 대시보드에서 선택된 기간 필터 값을 전달하여 상세 화면에서도 동일 기간이 기본 설정되도록 할 수 있다.
- 호출 API: 없음 (화면 이동).

---
## 기능 3: 접근 경로/메뉴/콘텐츠 이용량 분석 (개념)

- 관련 요구사항: RPT-REQ-018 (접근 경로/메뉴/콘텐츠 이용량 분석 기능)
- 화면 구성 아이디어:
    - 대시보드 내 별도 위젯 또는 탭으로 구성.
    - **인기 메뉴 Top 10:** 메뉴명, 조회수/클릭수 표시.
    - **인기 콘텐츠 Top 10:** (학습 콘텐츠) 콘텐츠명, 조회수, 평균 학습 시간 등 표시.
    - **주요 유입 경로:** Referral 사이트 또는 검색어별 방문자 수 표시.
- 참고: 이 기능은 웹 로그 분석(예: Google Analytics 연동) 또는 시스템 내 상세 활동 로그 분석을 통해 구현 가능. 데이터 수집 및 분석 로직 구현 필요.

---
### 예외 처리 및 유의 사항

- **데이터 집계 시점:** 통계 데이터가 실시간인지, 일별/주별 배치 집계인지 명확히 하고 사용자에게 안내 필요.
- **성능:** 대량의 데이터를 집계하고 분석해야 하므로, 통계 DB 최적화 및 효율적인 쿼리, 캐싱 전략이 중요. 대시보드 로딩 시간이 길어지지 않도록 주의.
- **시각화 라이브러리:** 선택한 차트 라이브러리의 기능 및 라이선스 확인.

---

# 교육 통계 화면 (RPT-SCR-002)
## 사용 역할자 : 시스템 관리자
## 관련 메뉴 : 관리자 시스템 > 통계 관리 > 교육 통계
---
## 기능 1: 전체 교육 현황 통계 조회

- 관련 요구사항: RPT-REQ-014 (대시보드-전체 교육 현황), RPT-REQ-019 (전체 교육 현황 조회 - 상세), RPT-REQ-002 (연도별), RPT-REQ-004 (기간별)
- 입력 정보:
    - **기간 선택:** 연도별, 월별, 기간 지정 (필수).
    - **(선택적) 필터:** 교육 유형(온라인/집합/혼합), 교육 분류.
    - **'조회' 버튼**.
- 출력 정보:
    - **요약 정보:** 선택 기간 내 총 개설 과정(기수) 수, 총 신청자 수, 총 이수(수료)자 수, 총 학습 시간, 총 교육 비용(매출).
    - **상세 현황 테이블:** (기간 단위별 - 일/월/분기 등 선택 가능)
        - 컬럼: 기간, 개설 과정 수, 신청자 수, 이수자 수, 평균 이수율(%), 총 학습 시간, 총 교육 비용.
    - **시각화 차트:**
        - 기간별 신청자/이수자 추이 (라인 또는 막대 차트).
        - 교육 유형별 신청자 비율 (파이 차트).
    - **'엑셀 다운로드' 버튼** (RPT-REQ-020).
- 프로세스 설명:
    1. 관리자가 조회 기간 및 필터를 설정하고 '조회' 버튼을 클릭한다.
    2. 프론트엔드는 조건을 백엔드 API (`GET /api/v1/admin/statistics/education/overall`)로 전송한다.
    3. 백엔드는 조건에 맞는 교육 현황 데이터를 집계/분석하여 반환한다.
    4. 프론트엔드는 응답 데이터를 요약 정보, 테이블, 차트 형태로 표시한다. '엑셀 다운로드' 클릭 시 파일 다운로드 API 호출.
- 호출 API 정보:
    - 조회: `GET /api/v1/admin/statistics/education/overall` (파라미터: startDate, endDate, type, category 등)
    - 엑셀 다운로드: `GET /api/v1/admin/statistics/education/overall/export` (동일 파라미터)

---
## 기능 2: 교육 과정별 통계 현황 조회

- 관련 요구사항: RPT-REQ-001 (교육 과정별 통계 조회), RPT-REQ-021 (교육 과정별 통계 현황 - 상세)
- 입력 정보:
    - **과정 선택:** Select 박스 또는 검색 기능 (필수 또는 선택적). 미선택 시 전체 과정 대상.
    - **기간 선택:** (선택적) 특정 기간 내 실적 조회.
    - **'조회' 버튼**, **페이지네이션**, **정렬**.
- 출력 정보:
    - **과정별 통계 테이블:**
        - 컬럼: 과정명, 개설 기수 수, 총 신청 인원, 총 수료 인원, 평균 수료율(%), 총 매출액, 평균 만족도(설문 연동), 주 강사(들).
    - 각 과정명 클릭 시 해당 과정의 더 상세한 통계(기수별 현황 등) 팝업 또는 드릴다운 기능.
- 프로세스 설명: 개별 교육 과정 또는 전체 과정의 운영 실적(신청, 수료, 매출, 만족도 등)을 비교 분석.
- 호출 API 정보: `GET /api/v1/admin/statistics/education/by-course` (파라미터: courseId, startDate, endDate, page, size, sort 등)

---
### 예외 처리 및 유의 사항

- **데이터 연동:** 과정 정보(COU), 수강 정보(LRN), 결제 정보(SYS), 설문 정보(LRN) 등 다양한 모듈의 데이터 연동 필요.
- **만족도 계산:** 과정 만족도는 해당 과정에 연결된 만족도 설문 결과(LRN-SCR-012)를 집계하여 계산.

---

# 수강생 통계 화면 (RPT-SCR-003)
## 사용 역할자 : 시스템 관리자
## 관련 메뉴 : 관리자 시스템 > 통계 관리 > 수강생 통계
---
## 기능 1: 수강생 현황 통계 조회

- 관련 요구사항: RPT-REQ-010 (수강생 통계 및 차트 조회), RPT-REQ-015 (대시보드-수강생 현황)
- 입력 정보:
    - **기간 선택:** (선택적) 특정 기간 내 활동한 수강생 기준.
    - **(선택적) 필터:** 지역(사용자 정보에 있는 경우 - RPT-REQ-003), 연령대, 성별, 사용자 구분(선수/지도자 등).
    - **'조회' 버튼**.
- 출력 정보:
    - **요약 정보:** 총 수강생 수, 활성 수강생 수(기간 내 학습 활동 기준), 신규 수강생 수(기간 내 가입 및 수강 시작 기준).
    - **시각화 차트:**
        - 지역별 분포 (지도 또는 막대 차트).
        - 연령대별 분포 (파이 또는 막대 차트).
        - 성별 비율 (파이 차트).
        - 사용자 구분별 비율 (파이 차트).
    - **(선택적) 상위 학습 참여자 목록:** 이름, 학습 시간, 수료 과정 수 등 기준 Top N.
- 프로세스 설명: 전체 또는 특정 조건의 수강생 그룹에 대한 인구통계학적 및 활동 기반 통계 조회.
- 호출 API 정보: `GET /api/v1/admin/statistics/learners/demographics` (파라미터: startDate, endDate, region, ageGroup, gender, userType 등)

---
## 기능 2: 기타 조건별 통계 조회

- 관련 요구사항: RPT-REQ-005 (기타 조건별 통계 조회 - 신청/수료/합격 인원 등)
- 입력 정보:
    - 통계 기준 선택: 드롭다운 (예: 과정별 수료율 분포, 월별 신규 가입자 수, 평가 합격률 추이 등 사전 정의된 통계 항목).
    - 필요시 추가 필터 조건 입력.
    - **'조회' 버튼**.
- 출력 정보: 선택된 통계 기준에 따른 테이블 및 차트 표시.
- 프로세스 설명: 특정 목적에 따라 사전 정의된 다양한 통계 지표를 조회하는 기능.
- 호출 API 정보: 각 통계 항목별 별도 API 엔드포인트 또는 통합 API (`GET /api/v1/admin/statistics/custom`) 필요.

---

# 매출 통계 화면 (RPT-SCR-004)
## 사용 역할자 : 시스템 관리자, 재무 담당자
## 관련 메뉴 : 관리자 시스템 > 통계 관리 > 매출 통계
---
## 기능 1: 매출 현황 통계 조회

- 관련 요구사항: RPT-REQ-016 (대시보드-매출 현황), RPT-REQ-024 (수강 신청 현황 통계 - 매출)
- 입력 정보:
    - 기간 선택: 연도별, 월별, 기간 지정 (필수).
    - (선택적) 필터: 과정 유형, 교육 분류, 결제 수단.
    - **'조회' 버튼**.
- 출력 정보:
    - **요약 정보:** 선택 기간 내 총 매출액, 총 결제 건수, 총 환불액, 순 매출액.
    - **상세 현황 테이블:** (기간 단위별 - 일/월/분기)
        - 컬럼: 기간, 총 매출액, 결제 건수, 환불액, 순 매출액, 평균 결제 금액.
    - **시각화 차트:**
        - 기간별 매출 추이 (막대 또는 라인 차트).
        - 과정 유형별 매출 비율 (파이 차트).
        - 결제 수단별 매출 비율 (파이 차트).
    - **(선택적) 매출 상위 과정 목록:** 과정명, 해당 기간 매출액 기준 Top N.
    - **'엑셀 다운로드' 버튼**.
- 프로세스 설명: 시스템의 전체 또는 특정 조건의 매출 및 결제 관련 통계를 조회.
- 호출 API 정보: `GET /api/v1/admin/statistics/revenue/summary` (파라미터: startDate, endDate, courseType, category, paymentMethod 등)

---
## 기능 2: 수강 신청 현황 통계 조회

- 관련 요구사항: RPT-REQ-024 (과정별 신청 현황)
- 입력 정보:
    - 기간 선택 (필수).
    - (선택적) 필터: 과정 유형, 교육 분류.
    - **'조회' 버튼**, **페이지네이션**, **정렬**.
- 출력 정보:
    - **과정(기수)별 신청 현황 테이블:**
        - 컬럼: 과정명, 기수명, 신청 기간, 총 신청 건수, 신청 인원, 총 신청 금액(결제 완료 기준 매출액).
- 프로세스 설명: 과정 또는 기수별로 수강 신청 건수 및 관련 매출 현황을 상세히 조회.
- 호출 API 정보: `GET /api/v1/admin/statistics/revenue/by-application` (파라미터: startDate, endDate, courseType, category, page, size, sort 등)

---

# 강사 통계 화면 (RPT-SCR-005)
## 사용 역할자 : 시스템 관리자
## 관련 메뉴 : 관리자 시스템 > 통계 관리 > 강사 통계
---
## 기능 1: 전체 강사 통계 현황 조회

- 관련 요구사항: RPT-REQ-022 (강사 통계 현황 - 전문분야, 경력 등)
- 입력 정보:
    - (선택적) 필터: 전문 분야, 경력 연차 구간, 상태(활동중/중지).
    - **'조회' 버튼**.
- 출력 정보:
    - **요약 정보:** 총 등록 강사 수, 활성 강사 수, 평균 경력 연차.
    - **시각화 차트:**
        - 전문 분야별 강사 분포 (파이 또는 막대 차트).
        - 경력 연차별 분포 (막대 차트).
    - **전체 강사 목록 테이블 (요약):** (LRN-SCR-011과 유사하나 통계 정보 추가)
        - 컬럼: 이름, 전문 분야, 경력 요약, 총 담당 강의 수, 평균 만족도.
- 프로세스 설명: 시스템에 등록된 전체 강사들의 통계적 분포 현황을 조회.
- 호출 API 정보: `GET /api/v1/admin/statistics/instructors/overview`

---
## 기능 2: 강사별 상세 통계 현황 조회

- 관련 요구사항: RPT-REQ-023 (강사별 통계 현황 - 강의 내역, 만족도, 참여 현황, 비용)
- 입력 정보:
    - **강사 선택:** Select 박스 또는 검색 (필수).
    - **기간 선택:** (선택적) 특정 기간 내 활동 기준.
    - **'조회' 버튼**.
- 출력 정보:
    - **선택된 강사 정보 요약.**
    - **강의 내역 테이블:** (선택 기간 기준)
        - 컬럼: 과정명, 기수명, 강의 기간, 담당 역할, 강의 시간.
    - **평가/만족도 정보:**
        - 참여 강의 평균 만족도 점수 (설문 연동).
        - 관리자 평가 점수/의견 (있는 경우).
    - **참여 현황:** 총 담당 강의 수, 총 학습자 수.
    - **비용 정보:** (선택적 - 권한 필요) 해당 기간 관련 계약 건수, 총 지급 비용 등.
- 프로세스 설명: 특정 강사의 상세 활동 내역 및 성과 지표를 조회.
- 호출 API 정보: `GET /api/v1/admin/statistics/instructors/{instructorId}/details` (파라미터: startDate, endDate)

---

# 웹사이트 방문 통계 화면 (RPT-SCR-006)
## 사용 역할자 : 시스템 관리자, 마케터
## 관련 메뉴 : 관리자 시스템 > 통계 관리 > 방문 통계
---
## 기능 1: 방문자 통계 조회 (일자별/단말기별/경로별)

- 관련 요구사항: RPT-REQ-006 (일자별), RPT-REQ-007 (단말기별), RPT-REQ-008 (접속 경로별)
- 입력 정보:
    - 기간 선택 (필수).
    - **'조회' 버튼**.
- 출력 정보:
    - **요약 정보:** 총 방문 수, 순 방문자 수, 평균 페이지뷰, 평균 세션 시간, 이탈률.
    - **시각화 차트:**
        - **일자별 방문 수 추이:** 라인 차트.
        - **단말기별(PC/모바일/태블릿) 방문 비율:** 파이 차트.
        - **주요 접속 경로(Referral) Top N:** 테이블 또는 막대 차트.
        - **주요 유입 검색어 Top N:** 테이블 또는 워드 클라우드.
    - **(선택적) 상세 데이터 테이블:** 날짜, 방문 수, 순 방문자 수 등 상세 로그 기반 데이터.
- 프로세스 설명: 웹사이트 트래픽 및 사용자 행동에 대한 통계 조회. Google Analytics 등 외부 로그 분석 도구 연동 또는 내부 로그 수집/분석 필요.
- 호출 API 정보: (내부 로그 기반 예시) `GET /api/v1/admin/statistics/traffic/summary` (파라미터: startDate, endDate) 또는 외부 도구 연동 API.

---
### 예외 처리 및 유의 사항

- **데이터 출처:** 방문 통계 데이터의 출처(내부 로그 vs 외부 도구)를 명확히 하고, 데이터 수집 및 연동 방안 마련 필요.
- **정확성:** 외부 도구 사용 시 해당 도구의 데이터 집계 방식 및 지연 시간 고려. 내부 로그 사용 시 정확한 로그 수집 및 분석 로직 구현 필요.

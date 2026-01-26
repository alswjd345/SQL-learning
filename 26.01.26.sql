UNION : 각 쿼리의 결과 합을 반환하는 합집합 (중복제거)
UNION ALL : 각 쿼리의 모든 결과를 포함한 합집합 (중복제거 안함)
각 쿼리의 SELECT 절 컬럼의 개수와 데이터 타입이 일치해야 한다.

문제)ONLINE_SALE 테이블과 OFFLINE_SALE 테이블에서 2022년 3월의 오프라인/온라인 상품 판매 데이터의 판매 날짜, 상품ID, 유저ID, 판매량을 출력하는 SQL문을 작성해주세요.
 OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL 로 표시해주세요. 결과는 판매일을 기준으로 오름차순 정렬해주시고 판매일이 같다면 상품 ID를 기준으로 오름차순, 상품ID까지 같다면 유저 ID를 기준으로 오름차순 정렬해주세요.
SELECT  TO_CHAR(SALES_DATE,'YYYY-MM-DD')AS SALES_DATE ,PRODUCT_ID,USER_ID,SALES_AMOUNT
FROM (
--     온라인 판매내역 
    SELECT SALES_DATE,PRODUCT_ID,USER_ID,SALES_AMOUNT
        FROM ONLINE_SALE WHERE TO_CHAR(SALES_DATE,'YYYY-MM')='2022-03'
            UNION ALL
--       오프라인 판매내역 USER_ID는 NULL 로 설정
        SELECT SALES_DATE,PRODUCT_ID,NULL AS USER_ID,SALES_AMOUNT
        FROM OFFLINE_SALE
     WHERE TO_CHAR(SALES_DATE,'YYYY-MM')='2022-03')
     ORDER BY SALES_DATE ASC, PRODUCT_ID ASC, USER_ID ASC;

-- 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회
SELECT A.APNT_NO, P.PT_NAME, A.PT_NO, A.MCDP_CD, D.DR_NAME, A.APNT_YMD
FROM APPOINTMENT A
JOIN PATIENT P ON A.PT_NO = P.PT_NO
JOIN DOCTOR D ON A.MDDR_ID = D.DR_ID
WHERE TO_CHAR(A.APNT_YMD,'YYYY-MM-DD') ='2022-04-13'
AND A.MCDP_CD = 'CS'
AND A.APNT_CNCL_YN = 'N'
ORDER BY A.APNT_YMD ASC;
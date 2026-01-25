*FROM절에 서브쿼리
FROM절에 사용되는 서브쿼리는 하나의 테이블처럼 사용된다

문제1)CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여 시작일을 기준으로 
2022년 8월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 자동차들에 대해서 해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 출력하는 SQL문을 작성해주세요. 
결과는 월을 기준으로 오름차순 정렬하고, 월이 같다면 자동차 ID를 기준으로 내림차순 정렬해주세요. 특정 월의 총 대여 횟수가 0인 경우에는 결과에서 제외해주세요.

SELECT TO_CHAR(START_DATE, 'FMMM') AS MONTH, CAR_ID, COUNT(*) AS RECORDS
-- FM을 붙이면 0을제외한 달의 숫자가 추출된다
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
-- 8월에서 10월까지 대여횟수가 5회이상인 ID추출
WHERE START_DATE BETWEEN TO_DATE('2022-08-01', 'YYYY-MM-DD') 
                     AND TO_DATE('2022-10-31', 'YYYY-MM-DD') 
  AND CAR_ID IN (
      SELECT CAR_ID 
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
      WHERE START_DATE BETWEEN TO_DATE('2022-08-01', 'YYYY-MM-DD') 
                           AND TO_DATE('2022-10-31', 'YYYY-MM-DD')
      GROUP BY CAR_ID 
      HAVING COUNT(*) >= 5 
  )
GROUP BY TO_CHAR(START_DATE, 'FMMM'), CAR_ID 
HAVING COUNT(*) > 0 --  대여 횟수가 0인 월 제외
ORDER BY TO_NUMBER(MONTH) ASC, CAR_ID DESC;

문제2)아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요.
 이때 결과는 보호 시작일 순으로 조회해야 합니다.
 SELECT NAME, DATETIME
FROM (
    -- 먼저 입양 못 간 동물을 날짜순
    SELECT I.NAME, I.DATETIME
    FROM ANIMAL_INS I 
    LEFT JOIN ANIMAL_OUTS O ON I.ANIMAL_ID = O.ANIMAL_ID
    WHERE O.ANIMAL_ID IS NULL -- 입양 못 간 동물 필터링
    ORDER BY I.DATETIME ASC   -- 오래된 순 정렬
)
WHERE ROWNUM <= 3;
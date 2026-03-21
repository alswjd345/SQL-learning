CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과 CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서 
자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고 
30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력하는 SQL문을 작성해주세요. 
결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 
자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬해주세요.


SELECT *
FROM (
    SELECT C.CAR_ID,
           C.CAR_TYPE,
           -- 30일 대여 금액 계산: (일일 대여료 * 30일) * (1 - 할인율/100)
           TRUNC(C.DAILY_FEE * 30 * (1 - P.DISCOUNT_RATE / 100)) AS FEE
    FROM CAR_RENTAL_COMPANY_CAR C
    JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P 
      ON C.CAR_TYPE = P.CAR_TYPE AND P.DURATION_TYPE = '30일 이상'
    WHERE C.CAR_TYPE IN ('세단', 'SUV')
      -- 2022년 11월 한 달 동안 대여 기록이 겹치지 않는 차만 선택
      AND NOT EXISTS (
          SELECT 1 
          FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
          WHERE H.CAR_ID = C.CAR_ID
            AND H.START_DATE <= TO_DATE('2022-11-30', 'YYYY-MM-DD')
            AND H.END_DATE >= TO_DATE('2022-11-01', 'YYYY-MM-DD')
      )
)
WHERE FEE >= 500000 AND FEE < 2000000
ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC;
FOOD_PRODUCT와 FOOD_ORDER 테이블에서 생산일자가 2022년 5월인 식품들의 식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성해주세요. 
이때 결과는 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요

SELECT P.PRODUCT_ID, 
       P.PRODUCT_NAME, 
       SUM(O.AMOUNT * P.PRICE) AS TOTAL_SALES
FROM FOOD_PRODUCT P 
JOIN FOOD_ORDER O ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE TO_CHAR(O.PRODUCE_DATE, 'YYYY-MM') = '2022-05'
GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME
ORDER BY TOTAL_SALES DESC, P.PRODUCT_ID ASC

FOOD_PRODUCT 테이블에서 식품분류별로 가격이 제일 비싼 식품의 분류, 가격, 이름을 조회하는 SQL문을 작성해주세요. 
이때 식품분류가 '과자', '국', '김치', '식용유'인 경우만 출력시켜 주시고 결과는 식품 가격을 기준으로 내림차순 정렬해주세요.
SELECT CATEGORY,
       MAX_PRICE, 
       PRODUCT_NAME
FROM (SELECT CATEGORY,
            PRICE, 
            PRODUCT_NAME,
            MAX(PRICE) OVER (PARTITION BY CATEGORY ORDER BY PRICE DESC) MAX_PRICE
      FROM FOOD_PRODUCT) A
WHERE PRICE=MAX_PRICE
        AND CATEGORY IN('과자','국','김치','식용유')
ORDER BY PRICE DESC
;
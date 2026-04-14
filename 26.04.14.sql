FOOD_ORDER 테이블에서 2022년 5월 1일을 기준으로 주문 ID, 제품 ID, 출고일자, 출고여부를 조회하는 SQL문을 작성해주세요.
 출고여부는 2022년 5월 1일까지 출고완료로 이 후 날짜는 출고 대기로 미정이면 출고미정으로 출력해주시고, 결과는 주문 ID를 기준으로 오름차순 정렬해주세요.

 SELECT  ORDER_ID,
        PRODUCT_ID,
        TO_CHAR(OUT_DATE,'YYYY-MM-DD') OUT_DATE,
        (CASE WHEN TO_CHAR(OUT_DATE,'YYYY-MM-DD') <= '2022-05-01' THEN '출고완료'
          WHEN TO_CHAR(OUT_DATE,'YYYY-MM-DD') > '2022-05-01' THEN '출고대기'
          WHEN OUT_DATE IS NULL THEN '출고미정' END) 
        AS 출고여부
FROM FOOD_ORDER 
ORDER BY ORDER_ID;

REST_INFO와 REST_REVIEW 테이블에서 서울에 위치한 식당들의 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수를 조회하는 SQL문을 작성해주세요.
 이때 리뷰 평균점수는 소수점 세 번째 자리에서 반올림 해주시고 결과는 평균점수를 기준으로 내림차순 정렬해주시고, 평균점수가 같다면 즐겨찾기수를 기준으로 내림차순 정렬해주세요.

 SELECT REST_ID,REST_NAME,FOOD_TYPE,FAVORITES,ADDRESS,SCORE
FROM (SELECT A.REST_ID,
             A.REST_NAME,
             A.FOOD_TYPE,
             A.FAVORITES,
             A.ADDRESS,
             ROUND(AVG(B.REVIEW_SCORE),2) AS SCORE
      FROM REST_INFO A JOIN REST_REVIEW B ON A.REST_ID= B.REST_ID
      WHERE A.ADDRESS LIKE '서울%'
      GROUP BY A.REST_ID,A.REST_NAME,A.FOOD_TYPE,A.FAVORITES,A.ADDRESS
     )
ORDER BY SCORE DESC, FAVORITES DESC ; 

보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 
보호소에 들어올 당시에는 중성화1되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요.

SELECT o.ANIMAL_ID,o.ANIMAL_TYPE,o.NAME
FROM ANIMAL_INS I JOIN ANIMAL_OUTS O
ON I.ANIMAL_ID=O.ANIMAL_ID
WHERE I.SEX_UPON_INTAKE LIKE 'Intact%'
AND (O.SEX_UPON_OUTCOME LIKE 'Spayed%' OR O.SEX_UPON_OUTCOME LIKE 'Neutered%') 
ORDER BY O.ANIMAL_ID;
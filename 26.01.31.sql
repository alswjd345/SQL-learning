MEMBER_PROFILE와 REST_REVIEW 테이블에서 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요. 
회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고, 
결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.

SELECT M.MEMBER_NAME,R.REVIEW_TEXT,TO_CHAR(R.REVIEW_DATE,'YYYY-MM-DD') AS REVIEW_DATE
FROM MEMBER_PROFILE M JOIN  REST_REVIEW R ON M.MEMBER_ID=R.MEMBER_ID
WHERE R.MEMBER_ID=(SELECT MEMBER_ID FROM REST_REVIEW
                GROUP BY MEMBER_ID
                ORDER BY COUNT(*) DESC
                FETCH FIRST 1 ROWS  ONLY)
ORDER BY REVIEW_DATE,REVIEW_TEXT;

CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 2022년 10월 16일에 대여 중인 자동차인 경우 '대여중' 이라고 표시하고,
 대여 중이지 않은 자동차인 경우 '대여 가능'을 표시하는 컬럼(컬럼명: AVAILABILITY)을 추가하여 자동차 ID와 AVAILABILITY 리스트를 출력하는 SQL문을 작성해주세요.
 이때 반납 날짜가 2022년 10월 16일인 경우에도 '대여중'으로 표시해주시고 결과는 자동차 ID를 기준으로 내림차순 정렬해주세요.
 SELECT CAR_ID,
        MAX(
           CASE 
               WHEN TO_DATE('2022-10-16', 'YYYY-MM-DD') 
                BETWEEN START_DATE AND END_DATE
                   THEN '대여중'
               ELSE '대여 가능'
           END
        ) AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;
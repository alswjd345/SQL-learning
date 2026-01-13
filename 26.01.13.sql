
TO_CHAR 
숫자,날짜 타입의 데이터니 컬럼을 원본 데이터를 바꾸지 않고 문자 타입 형변환해 출력해주는 함수 

CASE WHEN 
SELECT 절에 쓰이며 대표적으로 2가지의 쓰임새
1. 새로운 열을 생성하는 경우 
	SELECT CASE WHEN 기존 열 =조건 THEN '값1'
	SELECT CASE WHEN 기존 열 =조건 THEN '값2'  .....
	(ELSE '값 N') END AS 새로운 열
	->ELSE 생략 가능 , ELSE를 뺴고 쓰면 전부 NULL처리

2.열을 집계하는 경우(집계함수와 함꼐 사용) 
	SELECT 집계함수((DISTINCT) CASE WHEN 기존 열 =조건  THEN 집계 열 (ESLE 값) AND) AS 새로운 열       

   CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여 시작일이 2022년 9월에 속하는 대여 기록에 대해서 
   대여 기간이 30일 이상이면 '장기 대여' 그렇지 않으면 '단기 대여' 로 표시하는 컬럼(컬럼명: RENT_TYPE)을 추가하여 대여기록을 출력하는 SQL문을 작성해주세요. 
   결과는 대여 기록 ID를 기준으로 내림차순 정렬해주세요.     

SELECT HISTORY_ID
       ,CAR_ID
       ,TO_CHAR(START_DATE,'YYYY-MM-DD') AS "START_DATE"
       ,TO_CHAR(END_DATE,'YYYY-MM-DD') AS "END_DATE"
       ,CASE
            WHEN(END_DATE-START_DATE)+1>=30 THEN '장기 대여'
            ELSE '단기 대여'
            END AS RENT_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
        WHERE TO_CHAR(START_DATE,'YYYY-MM')='2022-09'
            ORDER BY HISTORY_ID DESC;  
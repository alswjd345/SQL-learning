NVL(값, NULL일 경우 대체하고 싶은 값)
NVL2(값,NULL이 아닌 경우 대체하고싶은값, NULL일 경우 대체하고 싶은 값)
NULLIF(인수1,인수2)-인수1,인수2가 같으면 NULL을 반환하고 다르면 인수1을 반환하는 함수
COALESCE(인수1,인수2,인수3)-NULL이 아닌 최초의 인수를 반환해주는 함수

예제)PATIENT 테이블에서 12세 이하인 여자환자의 환자이름, 환자번호, 성별코드, 나이, 전화번호를 조회하는 SQL문을 작성해주세요. 
이때 전화번호가 없는 경우, 'NONE'으로 출력시켜 주시고 결과는 나이를 기준으로 내림차순 정렬하고, 
나이 같다면 환자이름을 기준으로 오름차순 정렬해주세요.
SELECT PT_NAME,PT_NO,GEND_CD,AGE,NVL(TLNO,'NONE')AS TLNO  
    FROM PATIENT 
    WHERE AGE<=12 AND GEND_CD='W' 
    ORDER BY AGE DESC,PT_NAME;

GROUP BY는 반드시 집계함수,그룹함수와 같이 사용해야한다 
HAVING 그룹에 조건을 줄 때 사용한다
SELECT 절에 단일컬,단일행 함수는 사용할 수 없다

예제)APPOINTMENT 테이블에서 2022년 5월에 예약한 환자 수를 진료과코드 별로 조회하는 SQL문을 작성해주세요.
 이때, 컬럼명은 '진료과 코드', '5월예약건수'로 지정해주시고 결과는 진료과별 예약한 환자 수를 기준으로 오름차순 정렬하고,
예약한 환자 수가 같다면 진료과 코드를 기준으로 오름차순 정렬해주세요.

SELECT MCDP_CD AS 진료과코드,COUNT(*) AS "5월예약건수"
    FROM APPOINTMENT 
    WHERE TO_CHAR(APNT_YMD,'YYYY-MM')='2022-05'
    GROUP BY MCDP_CD
    ORDER BY "5월예약건수", MCDP_CD;

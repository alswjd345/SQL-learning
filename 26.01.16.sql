ROUND(수,자릿수)-수를 지정된 자릿수까지 반올림,자릿수를 명시하지 않았을 경우 기본값은 0이며 반올림된 정수를 반환하고 음수일 경우 지정된 정수부를 반올림하여 반환
CEIL(수)-소수점 이하의 수를 올림한 정수를 반환해 주는 함수
FLOOR(수)-소수점 이하의 수를 버림한 정수를 반환해 주는 함수
MOD(수1,수2)-수1을 수2로 나눈 나머지를 반환해주는 함수, 수2가 0일경우 수1을 반환
TRUNC(숫자,자릿수)-소수점 아래N까지 버림하여 표시
TRUNC(12.3456,3)-->12.345
TRUNC(12.3456,0)-->12
TRUNC(12.3456,-3)--->1000
예제)PRODUCT 테이블에서 만원 단위의 가격대 별로 상품 개수를 출력하는 SQL 문을 작성해주세요.
 이때 컬럼명은 각각 컬럼명은 PRICE_GROUP, PRODUCTS로 지정해주시고 가격대 정보는 각 구간의 최소금액(10,000원 이상 ~ 20,000 미만인 구간인 경우 10,000)으로 표시해주세요.
결과는 가격대를 기준으로 오름차순 정렬해주세요
SELECT TRUNC(PRICE,-4)AS PRICE_GROUP,
       COUNT(*) AS PRODUCTS
    FROM PRODUCT
    GROUP BY TRUNC(PRICE,-4)
    ORDER BY 1;

BETWEEN A AND B
예제)SELECT* FROM TEST WHERE AMY BETWEEN 1000 AND 3000 
->1000원~3000원 사이에 있는 값 조회 

IS NULL
예제)USER_INFO 테이블에서 나이 정보가 없는 회원이 몇 명인지 출력하는 SQL문을 작성해주세요. 
이때 컬럼명은 USERS로 지정해주세요.
SELECT SUM(CASE WHEN AGE IS NULL THEN 1 END) AS USERS
    FROM USER_INFO 

SELECT USER_ID,PRODUCT_ID
    FROM ONLINE_SALE 
    GROUP BY USER_ID
    HAVING COUNT(*)>=2
    ORDER BY USER_ID,PRODUCT_ID DESC;-->not a GROUP BY expression 오류 발생

--> SELECT 절의 컬럼과 GROUP BY 절의 컬럼이 같지 않아서입니다

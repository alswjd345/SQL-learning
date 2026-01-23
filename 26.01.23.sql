*null의 의미
sql에서 null와 어떤 비교연산을 하면 그결과는 unknown이다 unknown은 true일수도 있고 false 일수도 있다는 의미이다 
where 절에 있는 컨디션의 결과가 true인 tuple만 선택하게 된다 즉결과가 false거나 unknown이면 tuple은 선택되지 않는다
문제)2000년 대생이 없는 부서의 ID와 이름을 알고 싶다
    SELECT D.id ,
    D.name 
    WHERE D.id NOT IN(select e.dept_id 
    FROM emploee E
    WHERE E.birth_date >='2000-01-01')
만약 부서의 아이디가 null이면 이경우는 아무것도 출력하지 않는다. 이럴경우 e.dept_id를 not null로 설정해 줘야 데이터가 조회가 된다 

*MIN,MAX,AVG
MIN()-값의 최솟값을 반환
MAX()-값의 최대값을 반환
AVG()-값의 평균을 반환

문제)FOOD_PRODUCT 테이블에서 가격이 제일 비싼 식품의 식품 ID, 식품 이름, 식품 코드, 식품분류, 식품 가격을 조회하는 SQL문을 작성해주세요.
SELECT * FROM FOOD_PRODUCT WHERE PRICE=MAX(PRICE); ->group function is not allowed here오류
WHERE절에는 각 행단위 조건 비교해야한다 PRICE(개별형)과 MAX(PRICE) (테이블 전체 값)을 비교할 수 없음
그리고 WHERE 절에는 서브쿼리없이 집계함수 사용이 불가하다

SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM FOOD_PRODUCT
WHERE PRICE = (SELECT MAX(PRICE) FROM FOOD_PRODUCT);

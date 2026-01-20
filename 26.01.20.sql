IN()-OR 연산자를 여러개 사용하여 퀴리문을 작성하는것과 동일한결과를 얻을 수 있다
SELECT * EMP WHERE JOB IN('ANALYSY','MANAGER', 'SALEAM')
-->JOB 칼럼에 IN연산자에 입력된 직업 ('ANALYSY','MANAGER', 'SALEAM')중 하나라도 일치하면 조회된다
예제)REST_INFO 테이블에서 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성해주세요. 
이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요
SELECT FOOD_TYPE,REST_ID,REST_NAME,FAVORITES
FROM REST_INFO 
WHERE (FOOD_TYPE,FAVORITES) IN(SELECT FOOD_TYPE,MAX(FAVORITES)
      FROM REST_INFO
      GROUP BY FOOD_TYPE) 
ORDER BY FOOD_TYPE DESC;

NOT IN()-이연산자를 사용하면 입력된 값을 제외한 나머지 데이터가 조회된다
SELECT * EMP WHERE JOB NOT IN('ANALYSY','MANAGE, 'SALEAM')
--> JOB 칼럼이 ANALYSY,MANAGE, SALEAM 제외된 것을 확인할 수 있다

EXISTS(서브쿼리)-서브쿼리의 결과가 한건이라도 존재하면 TRUE 없으면 FALSE를 리턴한다
서브쿼리에 일치하는 결과가 한건이라도 있으면 쿼리를 더 이상 수행하지 않는다
서브쿼리 FROM ,WHERE,SELECT 절에 쓸수 있다
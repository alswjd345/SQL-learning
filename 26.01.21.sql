
상위 N개의 데이터 추출하기
*ROWNUM-N번쨰 행을 구할 떄 사용하는 WHERE의 조건이다 ,특정 개수만큼 데이터를 추출할 수 있다
예제)동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.
    SELECT NAME     //3
    FROM ANIMAL_INS //1
    WHERE ROWNUM =1 //2
    ORDER BY DATETIME DESC //4
쿼리 순서염두하지 않고 위와 같이 쿼리를 짰을 경우, ORDER BY로 순서를 정한 것 중에 하나가 아니라 
FROM에서 검색된 결과 중 하나를 고르고(ROWNUM=1) ORDER BY를 하기 때문에 원하는 결과를 구할 수 없다.

따라서 정렬된 서브쿼리를 FROM으로 불러오게 되면 원하는 순서대로 실행할 수 있다
    SELECT NAME     
    FROM (SELECT * FROM ANIMAL_INS ORDER BY  DATETIME)
    WHERE ROWNUM =1 ;

*RANK(): 동일한 값이면 중복 순위를 부여하고, 다음 순위는 해당개수만큼 건너뛰고 반환한다(예시1,2,2,4순위)
    SELECT 컬럼1,컬럼2,컬럼3 RANK() OVER (ORDER BY 기준컬럼) AS 별명 FROM 테이블;

*DENSE_RANK():동일한 값이면 중복 순위를 부여하고  다음 순위는 중복 순위와 상관없이 순차적으로 반환한다 (예시 1,2,2,3순위)
    SELECT 컬럼1,컬럼2,컬럼3 DENSE_RANK() OVER (ORDER BY 기준컬럼) AS 별명 FROM 테이블;

*ROW_NUMBER :중복 관계 없이 순차적으로 순위를 반환한다,동일한 순위어도 중복이 없다(예시1,2,3,4순위)
    SELECT 컬럼1,컬럼2,컬럼3 ROW_NUMBER() OVER (ORDER BY 기준컬럼) AS 별명 FROM 테이블;
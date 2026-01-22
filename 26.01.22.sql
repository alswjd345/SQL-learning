group by-흩어져 있는 데이터들을 끼리끼리 묶어주는 기능,단순히 목록 조회를 넘어 통계(합계,평균,개수)를 나타낼떄 사용
SELECT절 그룹화된컬럼과 통계함수를 함께사용합니다
WHERE절에는 그룹화하기 전의 개별 행에 대한 조건이고
HAVING은  그룹화 후의 조건입니다 

예제)동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 
이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.
    SELECT NAME,COUNT(*) AS COUNT
    FROM ANIMAL_INS 
    WHERE NAME IS NOT NULL
    GROUP BY NAME 
    HAVING COUNT(*)>=2
    ORDER BY NAME;

예제2)보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다.
 09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
이때 결과는 시간대 순으로 정렬해야 합니다.
    SELECT TO_NUMBER(TO_CHAR(DATETIME, 'HH24')) AS HOUR, COUNT(*) AS COUNT
    FROM ANIMAL_OUTS
    WHERE TO_CHAR(DATETIME, 'HH24') BETWEEN '09' AND '19'
    GROUP BY TO_CHAR(DATETIME, 'HH24')
    ORDER BY HOUR
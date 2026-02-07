CONNECT BY: 데이터가 연결되는 규칙을 정의합니다. (어떤 데이터가 다음 단계로 이어질지 결정)
LEVEL: 계층의 깊이를 나타내는 가상 컬럼 1부터 시작하며, CONNECT BY에 의해 행이 생성될 때마다 1씩 증가
SYS_CONNECT_BY_PATH(컬럼,구분자): 루트 노드부터 현재 노드까지 경로를 출력해주는 함수
START WITH: 경로가 시작되는 루트 노드를 생성해주는 절
PRIOR: 바로 앞에 있는 부모 노드의 값을 반환
CONNECT_BY_ROOT 컬럼: 루트 노드의 주어진 컬럼 값을 반환한다
CONNECT_BY_ISLEAF: 가장 하위 노드인 경우 1을 반환하고 그외에는 0을 반환


SELECT FROM DUAL CONNECT BY LEVEL <=5 --->1,2,3,4,5
->CONNECT BY을 사용하여 지정된 수치만큼 행을만들 수 있다

문제)0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.
SELECT HR.HOUR, COUNT(ao.ANIMAL_ID) 
FROM (
    -- 0~23 숫자를 추출하는 테이블
    -- DUAL: 실질적인 데이터가 필요 없을 때 숫자를 생성하기 위해 사용하는 가상 테이블
    SELECT LEVEL - 1 AS HOUR 
    FROM DUAL 
    CONNECT BY LEVEL <= 24
) HR
LEFT JOIN ANIMAL_OUTS ao 
  ON HR.HOUR = TO_NUMBER(TO_CHAR(ao.DATETIME, 'HH24'))
GROUP BY HR.HOUR
ORDER BY HR.HOUR;
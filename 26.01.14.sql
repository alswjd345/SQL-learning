
EXTRAT()-날짜 유형의 데이터로부터 날짜 정보를 분리하여 새로운 컬럼의 형태로 추출해주는 함수
SELECT EXTRACT('날짜요소' FROM 컬럼) AS 별칭 FROM 테이블;

시스템 현재시각(SYSTIMESTAMP)에서 연도, 달, 날짜, 시간, 분, 초 추출하기
select systimestamp,
       extract (year from systimestamp) as year,
       extract (month from systimestamp) as month,
       extract (day from systimestamp) as day,
       extract (hour from systimestamp) as hour,
       extract (minute from systimestamp) as minute,
       extract (second from systimestamp) as second
from dual;

조인의 종류 
INNER JOIN -기준테이블과 조인 테이블 모두에 조인 컬럼 데이터가 존재해야 조회됨
SELECT 컬럼 FROM 테이블1 (INNER) JOIN 테이블2 ON 테이블1.컬럼=테이블2.컬럼 WHERE 추가 조건;

LEFT JOIN -첫번쨰 테이블을 기준으로 두번째 테이블을 합치는 JOIN ,합치는 테이블의 순서 유의
SELECT 컬럼 FROM 테이블1 LEFT JOIN 테이블2 ON 테이블1.컬럼=테이블2.컬럼 WHERE 추가 조건;

RIGHT JOIN- LEFT JOIN랑 동일하지만 두번째 테이블로 기준이 바뀐다는 차이가 있습니다 마찬가지로 합치는 테이블의 순서 유의 
FETCH
SELECT *FROM 테이블명 ORDER BY 컬럼 FETCH FIRST N ROW ONLY;
지정된 열을 기준으로 정렬된 결과 집합에서 첫 번째 행만을 반환

OFFSET-원하는 행의 수만큼을 건너뛰고 그후의 행부터 검색이 가능하다
SELECT *FROM 테이블명 OFFSET N ROWS

문제)7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성해주세요
SELECT J.FLAVOR
FROM JULY  J LEFT JOIN FIRST_HALF F
ON J.FLAVOR=F.FLAVOR
GROUP BY J.FLAVOR
ORDER BY SUM(J.TOTAL_ORDER)+SUM(F.TOTAL_ORDER) DESC
FETCH FIRST 3 ROW ONLY;

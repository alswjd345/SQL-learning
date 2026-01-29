FETCH FIRST N ROW ONLY
정렬 후 제한된 수의 행을 가져올때 사용

문제)7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성해주세요
SELECT J.FLAVOR
FROM JULY  J LEFT JOIN FIRST_HALF F
ON J.FLAVOR=F.FLAVOR
GROUP BY J.FLAVOR
ORDER BY SUM(J.TOTAL_ORDER)+SUM(F.TOTAL_ORDER) DESC
FETCH FIRST 3 ROW ONLY
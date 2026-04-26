USING
두 개의 테이블이 내부 조인으로 조인 될 때 조인하고자 하는 두 테이블의 컬럼명이 같을 경우 조인 조건을 길게 적지 않고 간단하게 적을 수 있도록 하는 역할
SELECT * FROM A JOIN B ON A.ID=B.ID;
SELECT * FROM A JOIN B USING(ID);
-->두줄의 의미가 같음

주의사항
-USING에 사용된 컬럼 앞에는 테이블 별칭(Alias)을 붙이면 안됨
-USING뒤에 AND 조건 붙일 수 없음
-(SELECT * FROM emp e JOIN dept d USING (deptno AND e.status = 'A');)--에러 발생
-컬럼의 이름이 같아야 함
-조건에 따라 조회결과가 달라진다 따라서 USING 은 INNER JOIN 경우에 권장된다.

SELECT * FROM A WHERE NOT EXSITS(SELECT 1 FRO B WHERE A.ID=B.ID);
-->조건 만족한 행이 하나도 없으면 트루, B테이블에 없는 A데이터를 가져와라

EXSITS 와 IN
SELECT * FROM A WHERE EXSITS (SELECT 1 FROM B WHERE WHERE A.ID=B.ID);
-->A 한줄씩 검사하면서 B에 같은 ID가 있으면 조회
-->큰 데이터에 유리
-->NULL영향 없음
-->한행씩 검사

SELECT * FROM A WHERE ID IN(SELECT ID FROM B)
-->A에 B.ID 목록 안에 있는거 조회
-->목록 비교
-->NULL 영향 있음(만약 NULL을 비교하게 되면 UNKNOWN 이됨)
-->작은 데이터에 유리

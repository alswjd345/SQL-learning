오라클 실행계획
 Id : 작업의 고유 번호실행 순서와는 별개인 고유 식별자
 Operation	: 수행된 작업의 종류,TABLE ACCESS, INDEX RANGE SCAN 등 구체적 행위
 E-Rows (Estimated): 옵티마이저가 예측한 건수
 A-Rows (Actual): 실제 실행 시 추출된 건수
 Cost : 쿼리 수행 비용	CPU, I/O 등을 종합한 수치입니다
 Predicate Information : 필터 및 조인 조건	Access: 인덱스를 타는 조건 / Filter: 추출 후 걸러내는 조건.
    Access: 이 조건으로 인덱스 범위를 줄였다는 뜻
    Filter: 데이터를 일단 다 읽어온 뒤 메모리에서 걸러냈다는 뜻

 TABLE ACCESS FULL: 테이블 전체를 읽는 방식
 TABLE ACCESS BY INDEX ROWID: 인덱스에서 찾은 주소(Rowid)를 가지고 테이블의 실제 데이터를 찾아가는 과정
 INDEX UNIQUE SCAN: PK나 Unique 인덱스로 딱 1건만 찾을 때 발생,가장빠름
 INDEX RANGE SCAN: 특정 범위의 데이터를 찾을 때 발생, 인덱스 설계가 잘 되어 있다면 효율적
 INDEX FULL SCAN: 인덱스 전체를 읽는 방식 (정렬이나 특정 칼럼 추출 시 사용)
Nested Loops (NL) Join: 한 로우씩 순차적으로 비교하는 방식,인덱스가 잘 잡혀있고 소량의 데이터를 처리할 때 유리
Hash Join: 대용량 데이터를 조인할 때 주로 발생
Sort Merge Join: 양쪽 데이터를 정렬한 뒤 합치는 방식

Buffers : 데이터가 메모리(Buffer Cache)에서 읽힌 횟수
인덱스 : 데이터베이스 테이블의 검색 속도를 향상,책의 색인과도 같다
/*+ GATHER_PLAN_STATISTICS */ : 실제로 쿼리를 끝까지 수행하면서 각 단계마다 시간이 얼마나 걸렸고, 데이터를 몇 건이나 읽었는지를 오라클이 메모리에 꼼꼼하게 기록

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));
--> 이 힌트(GATHER_PLAN_STATISTICS)를 써서 기록한  실제 통계치를 보여줌
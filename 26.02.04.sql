*인덱스-조건을 만족하는 튜플을 빠르게 조회,정렬,그룹핑하기 위해 사용
primary key 또는 unique제약조건을 갖도록 정의하는 경우는 오라클 서버가 자동으로 고유 인덱스 생성한다
    CREATE INDEX 인덱스이름A ON 테이블이름(컬럼이름A); --->인덱스 생성
    SHOW INDEX FROM 테이블; --->인덱스들을 보여줌
    EXPLAIN 쿼리문--->쿼리를 실행할때 사용되는 어떤 인덱스를 사용하는지 알려줌
    USE INDEX(인덱스명)--->직접 옵티마이저한테 가급적 내가 지정한 인덱스를 사용하게끔 해줌
    FORCE INDEX(인덱스명)--->옵티마이저한테 강제로 사용할 인덱스를 지정

*인덱스를 많이 만들면 일어날 수 있는 문제
TABLE WRITE(INSERT,UPDATE,DELETE)할때 INDEX 변경발생,추가 저장 공간 발생한다
그렇기때문에 불필요한 INDEX를 만들지 않는게 좋다

*HASH INDEX
인덱스 크기가 작고 검색이 빠르다
HASH TABLE을 사용해 INDEX 구현
REHASHING에 대한 부담
EQUALITY(=,!=) 비교만 가능하고 RANGE(<=,>) 불가능
muticolum의 경우 전체 attribute에 대한 조회만 가능

*full scan이 더 좋은 경우
table에 데이터가 많이 없을경우
조회하려는 데이터가 상당부분을 차지 할떄

*인덱스 스캔방식
index range scan 
인덱스 루트 블록에서 리프 블록까지 수직적으로 탐색후 리프 블록을 필요한 범위만 스캔하는 방식
indesx full scan
수직적 탐색없이 리프블록을 처음부터 끝까지 수평적으로 탐색하는 방식으로 데이커 검색을 위한 최적의 인덱스가 없을 때 차선으로 선택하는 방식
index unique scan
수직적 탐색만으로 데이터를 찾는 스캔방식으로 = 조건일 때만 동작
index skip scan
인덱스 선두 컬럼이 조건절에 빠졌어도 인덱스를 활용하는 스캔방식
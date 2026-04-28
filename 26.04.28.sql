INDEX BY BINARY_INTEGER - 숫자를 키로 쓰는 배열 같은 자료구조 만듬,숫자를 키로쓰는sql 전용 배열
* 특징
- 인덱스 숫자가 연속일 필요없음
- 크기 제한 없음
- 디비테이블이 아니고 메모리에서 존재
- 빠른 조회 필요할 때

* 쓰는이유
- 반복문에서 데이터 임시 저장
(   FOR i IN 1..10 LOOP  
    v_names(i) := 'data' || i;
    END LOOP; )
- DB에서 여러 행 가져와서 처리
(   SELECT name BULK COLLECT INTO v_names FROM users; )

TYPE my_type IS TABLE OF VARCHAR2(100)
INDEX BY BINARY_INTEGER;

DECLARE
  TYPE name_table IS TABLE OF VARCHAR2(100)
  INDEX BY BINARY_INTEGER;

  v_names name_table;
BEGIN
  v_names(1) := 'Kim';
  v_names(2) := 'Lee';
  v_names(100) := 'Park';

  DBMS_OUTPUT.PUT_LINE(v_names(100));
END;-->결과 Park

BULK COLLECT - 여러 행을 한 번에 배열(컬렉션)에 담는 방법

  CURSOR c1 IS SELECT name FROM users;

  TYPE t_name IS TABLE OF VARCHAR2(100); --TYPE : 새로운 자료형을 만듬 , TABLE OF : 여러개를 담는다(배열/리스트)
  v_names t_name;
BEGIN
  OPEN c1;

  LOOP
    FETCH c1 BULK COLLECT INTO v_names LIMIT 100; --메모리를 많이 쓰기 때문에 LIMIT로 제한

    EXIT WHEN v_names.COUNT = 0;

    FOR i IN 1 .. v_names.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(v_names(i));
    END LOOP;
  END LOOP;

  CLOSE c1;
END;
CURSOR
SQL 문 실행 결과를 메모리에서 저장하는 일종의 컨테이너
커서를 사용하면  ROW에 순차적으로 접근이 가능

CURSOR 커서명(매개변수1, 매개변수2...)
IS
SELECT문;
OPEN 커서명 (매개변수1, 매개변수2...); --선언한 커서를 사용하려면 선언한 커서를 열어주는 작업이 필요
LOOP --커서는 SQL 결과 집합이 여러개 이상에서 순차적으로 접근하기 위해 사용하는 방식이므로 거의 필수적으로 LOOP를 비롯한 반복문과 같이 사용
FETCH 커서명  INTO 변수1, 변수2... --정의한 커서를 열었으면 패치단계에서 커서를 사용,데이터를 변수안에 넣음
EXIT WHEN 커서명%NOTFOUND; --더이상 읽을 데이터가 없으면 탈출
END LOOP; 
CLOSE 커서명

*커서의 속성
커서이름%ROWCOUNT : 현재까지 반환된 모든 행의 수를 출력

커서이름%FOUND : FETCH한 데이터가 행을 반환하면 TRUE

커서이름%NOTFOUND : FETCH한 데이터가 행을 반환하지 않으면 TRUE (LOOP 종료 시점을 찾는다)

커서이름%ISOPEN : 커서가 OPEN 되어 있으면 TRUE

*명시적 커서 예시
-- 1. 커서 선언 (부서 번호가 10인 직원의 이름과 급여를 조회하는 쿼리)
    CURSOR emp_cursor IS
        SELECT emp_name, salary 
        FROM employees 
        WHERE dept_id = 10;
        
    -- FETCH한 데이터를 담을 변수 선언
    v_name employees.emp_name%TYPE; --%TYPE: 앞에 적힌 컬럼(emp_name)의 데이터 타입(예: VARCHAR2(50))을 그대로 복사해서 가져오라는 오라클의 명령어
    v_salary employees.salary%TYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        --  커서 패치 (한 행씩 읽어 변수에 할당)
        FETCH emp_cursor INTO v_name, v_salary;
        -- 더 이상 읽을 데이터가 없으면 루프 탈출
        EXIT WHEN emp_cursor%NOTFOUND; 
        -- 읽어온 데이터 처리 (여기서는 단순 출력)
        DBMS_OUTPUT.PUT_LINE('이름: ' || v_name || ', 급여: ' || v_salary);
    END LOOP;
    CLOSE emp_cursor;
END;

*FOR 커서 예시
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_name, salary 
        FROM employees 
        WHERE dept_id = 10;
BEGIN
    -- emp_rec라는 레코드 변수가 자동 선언되며 루프를 돕니다.
    FOR emp_rec IN emp_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('이름: ' || emp_rec.emp_name || ', 급여: ' || emp_rec.salary);
    END LOOP;
END;
/
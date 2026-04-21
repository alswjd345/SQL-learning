PROCEDURE 프로시저명
 IS
    변수,상수 선언
    BEGIN
     실행될 내용
    END;

PROCEDURE GET_INFO
    IS
    TOTAL NUMBER := 0; -- 변수 타입 지정 및 대입 연산자(:=) 사용
        BEGIN 
    SELECT COUNT(USER_ID) INTO   TOTAL -- 조회 결과를 변수에 할당
    FROM   EMPLOYEES; 
END;   

*for loop 문을 사용해서 테이블 데이터 한행씩 출력하기
* 1. FOR M_LIST IN (SELECT 절)- SELECT 절 수행한 결과를 M_LIST 변수 담음
* 2. M_DATA := M_LIST.T_NAME || M_LIST.T_DEPT - M_DATA에 M_LIST 변수에 대입
* 3. IN(조건, 조건) - 조건을 만족하는 데이터들만 출력

IS
    M_DATA VARCHAR2(100);
    M_COUNT NUMBER(10);
    
    BEGIN    
       M_COUNT := 1; -- 초기 카운트 변수값 대입
       
       FOR M_LIST IN (
            -- M_LIST에 SELECT 쿼리를 실행한 테이블 데이터를 저장한다
            SELECT T_NAME, T_DEPT
                FROM TEST_USER
            WHERE T_DEPT IN ('백제', '후백제')    
       )
       LOOP
       
       M_DATA := M_LIST.T_NAME || M_LIST.T_DEPT; -- M_LIST 임시 테이블에 T_DEPT 컬럼 데이터를 한행씩 출력한다
       DBMS_OUTPUT.PUT_LINE('=============================');
       DBMS_OUTPUT.PUT_LINE('M_COUNT : ' || M_COUNT);
       DBMS_OUTPUT.PUT_LINE('M_DATA : ' || M_DATA);       
       DBMS_OUTPUT.PUT_LINE('============================='); 
       
       M_COUNT := (M_COUNT+1); --카운트값 증가
       END LOOP;         
    END; 

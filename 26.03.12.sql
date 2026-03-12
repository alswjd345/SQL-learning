시퀀스(Sequence)

오라클 시퀀스란 유일(UNIQUE)한 값을 생성해 주는 오라클 객체, 기본키와 같이 순차적으로 증가하는 컬럼을 자동적으로 생성할 수 있으며, 주로 PRIMARY KEY 값을 생성하기 위해 사용 시퀀스는 테이블과는 독립적으로 저장, 생성되며 메모리에 Cache 되었을 때 시퀀스 값의 액세스 효율이 증가

START WITH : 시퀀스의 시작 값을 지정합니다. n을 1로 지정하면 1부터 순차적으로 시퀀스 번호가 증가합니다.

INCREMENT BY : 시퀀스의 증가 값을 지정합니다. n을 2로 지정하면 2씩 증가합니다. 

MAXVALUE : 시퀀스 최대값

MINVALUE : 시퀀스 최소값

CYCLE | NOCYCLE : 최대값 도달시 순환 여부

CACHE | NOCACHE : 메모리에 시퀀스 값을 미리 할당할지 여부 

ORDER | NOORDER : 반드시 순차적으로 모두 채워서 시퀀스를 사용하거나 건너뛸 수 있을지 여부


CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;--->시퀀스 생성

SELECT user_seq.CURRVAL FROM dual;--->현재 값 가져오기

SELECT user_seq.NEXTVAL FROM dual;--->다음 값 가져오기
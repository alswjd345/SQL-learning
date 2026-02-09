stored procedure-일련의 쿼리를 마치 하나의 함수 처럼 실행하기 위한 쿼리의 집합이다

두정수의 곱셉 결과를 알려주는 프로시저
delimiter $$ --->구문을 만들 준비를 하겠다
CREATE PROCEDURE product(IN a int,IN b int,OUT result int)
    BEGIN
        SET result =a*b;
    END    
delimiter;

call product(5,7,@result)---> 프로시저 호출
select @result; ---->결과 35

두 정수를 맞바꾸는 프로시저
delimiter $$
CREATE PROCEDURE swap(INOUT a int,INOUT b int)
    BEGIN
        set @temp=a;
        set a=b;
        set b =@temp;
    END 
    $$   
delimiter;
set @a=5,@b=7;
call swap(@a,@b);
select @a,@b ---> a=7,b=5

stored procedure와 stored function
*stored procedure
return 키워드로 값 반환불가능 
파라미터로 값들 반환가능
값을 꼭 반환하는건 필수 아님
SQL statement 호출 불가능
트렌젝션 가능 
데이터 조작 비지니스 흐름을 구현

*stored function
return 가능
파라미터 값들 반환 일부 가능
값을 꼭 반환하는건 일부 가능
SQL statement에서 호출 가능
트렌젝션 배부분 불가능
특정 입력을 받아 결과만 꼐산하여 반환하는 용도에 적합


트리거(trigger)
데이터베이스에서 변경이 생겼을때 이것이 계기가 되어 자동으로 사용되는 프로시저

사용자의 닉네임 변경이력을 저장하는트리거를 작성해보자
    CREATE TRIGGER log__user_nick_name_trigger 
    BEFORE UPDATE --->업데이트가 발생했을때 업데이트 이전에 트리거가 액션을 취함
    ON users FOR EACH ROW--->users 테이블에 대해 업데이트가 발생하면 동작,업데이트 되는 각 로우에 실행
    BEGIN
        insert into user_log values(OLD.id,OLD.nickname,now());--->액션,OLD(update되기 전의 튜플을 가리킴))
    END

사용자가 마트에서 상품을 구매할 때마다 지금까지 누적된 구매 비용을 구하는 트리거를 작성해보자
        CREATE TRIGGER sum_buy_prices_trigger
        AFTER INSERT 
        ON buy FOR EACH ROW
        BEGIN
            DECLARE total INT;
            DECLARE user_id INT DEFAULT NEW.user_id;--->NEW(insert된 튜플을 가리킴,update이면 update된 후의 튜플을 가리킴)
            select sum(price) into total from buy where user_id=user_id;--->누적금액을 구함
            update user_buy_stats set price_sum=total where user_id=user_id;--->업데이트
        END

-트리거는 update,insert,delete등을 한번에 감지하도록 설정이 가능하다
임직원의 평균연봉을 구하자
    CREATE TRIGGER avg_empl_salary_trigger
        AFTER INSERT OR UPDATE OR DELETE
        ON employee
        FOR EACH ROW ->  FOR EACH STATEMENT로 변경(각 로우가 아니라 한번에 실행시키기 위해)
        EXECUTE FUNCTION update_avg_empl_salary();

-trigger를 발생시킬 디테일한 조건을 지정할 수 있다
    CREATE TRIGGER log__user_nick_name_trigger 
    BEFORE UPDATE 
    ON users 
    FOR EACH ROW
    WHEN (NEW.nickname IS DISTINCT FROM OLD.nickname)--->이 조건에 맞아야 이 트리거가 실행된다
    EXCUTE FUNCTION log_user_nickname();

주의사항
-소스코드로는 발견할 수 없는 로직이기 떄문에 어떤 동작이 일어나는지 파악하기 어렵고 문제가 생겼을 때 대응하기 어렵다
-과도한 트리거 사용은 디비에 부담을주고 응답을 느리게 만든다
-디버깅이 어렵다
-문서정리가 특히나 중요하다
  
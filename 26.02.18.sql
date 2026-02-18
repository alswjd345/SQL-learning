트렌잭션(transction)-단일한 논리적인 작업 단위,논리적인 이유로 여러 sql문들을 단일 작업으로 몪어서 나눠질 수 없게 만든것

트랜잭션이 안전하게 수행되기 위해서는 4가지 조건(ACID)을 만족해야 한다
Atomicity (원자성): 모두 성공하거나 실패하거나 트랜잭션 내의 작업 중 하나라도 실패하면 전체가 취소되어야 한다
Consistency (일관성): 트랜잭션 완료 후에도 데이터베이스의 제약 조건이나 규칙은 변함없이 유지되어야 한다
Isolation (격리성): 수행 중인 트랜잭션은 다른 트랜잭션의 방해를 받지 않아야 한다
Durability (지속성): 성공적으로 완료된 트랜잭션의 결과는 영구적으로 반영되어야 한다

예시)j가 h에서 20만원 계좌이체를 하려한다
    START TRANSCTION;--->트렌잭션 시작
    UPDATE account SET banlance=banlance-2000000 WHERE id='J';
    UPDATE account SET banlance=banlance+2000000 WHERE id='H';
    COMMIT;--->최종 반영

    SELECT @@ AUTOCOMMT;--->각각의 SQL문을 자동으로 트랜젝션 처리해주는 개념,실행중 문제가 있다면 알아서 롤백




관리구문 
*DML-데이터를 입력하고,입력된데이터를 수정,삭제,조회하는 명령어이다
    INSERT-테이블에 데이터 입력하는 명령어
    INSERT INTO 테이블명(컬럼1,컬럼2) VALUES(데이터1,데이터2);

    UPDATE-이미 저장된 데이터를 수정하고싶을때 쓰는 명령어,WHERE절이 없으면 테이블의 모든로우변경되니 주의
    UPDATE 테이블면 SET 컬럼명 =새로운데이터(WHERE 수정할 데이터 조건)

    DELETE-이미저장된 데이터를 삭제하고 싶을때 사용하는명령어, COMMIT전에 ROLLBACK이 가능하다
    DELETE FROM 테이블명(WHERE 조건);

    MERGE 
    테이블에 새로운데이터를 입력하거나 이미 저장되어 있는 데이터에 대한 변경작업을 한번에 할 수 있도록해주는 명령어
    MERGE INTO 타겟테이블 USING 비교 테이블 
    ON 조건 WHEN MATCHED THEN
    UPDATE SET 컬럼명=새로운데이터
    WHEN NOT MATCHED THEN INSERT[컬럼명=새로운데이터]
    INSERT(컬럼명1,컬럼명2)
    VALUES(데이터1,데이터2);

*TCL-트랜젝션(트랜젝션이란 쪼개질 수 없는 업무처리의 단위)을 제어하는 명령어
    트랜젝션의 특징
    원자성-트랜젝션으로 묶인 일련의 동작들은 모두 성공하거나 모두 실패해야한다
    일관성-트랜젝션이 완료된 후에도 데이터 베이스가 가진 데이터에 일관성이 있어야한다
    고립성-데이터를 참조하거나 변경할 수 없고 다른 트랜잭션이 끝날때까지 대기해야한다
    지속성-변경한 데이터가 영구적을 저장 ,시스템 장애가 발생하더라도 복구가 가능해야 한다는 의미이다

    COMMIT-INSERT,DELETE,UPDATE 후에 변경된 내용을 확정,반영하는 명령어이다
    ROLLBACK-INSERT,DELETE,UPDATE 후에 변경된 내용 취소하는 명령어
    SAVEPOINT-ROLLBACK을 수행할때 전체작업을 되돌리지 않고 일부만 되돌릴 수 있게하는 기능을 가진 명령어이다

*DDL-데이터를 정의하는 SQL이다 CREATE,ALTER,DROP,RENAME,TRUNCATE가 있다
    CREATE-테이블을 생성하기 위한 명령어이다
    CREATE TABLE 테이블명(컬럼명1 .... 데이터 타입...);

    ALTER-테이블 구조를 변경해야할때 쓰는 명령어이다
    ALTER TABLE 테이블명 ADD 컬럼명 데이터 유형; ->새로운컬럼추가
    ALTER TABLE 테이블명 DROP COLUMN 컬럼명; ->기존컬럼 삭제
    ALTER TABLE 테이블명 MODIFY (컬럼명1 데이터유형 ... ,컬럼명2 데이터유형);-기존 컬럼변경,제약조건변경가능(단 컬럼에 저장된 데이터가 없는경우데이터유형변경가능
    ALTER TABLE 테이블명 RENAME COLUMN 기존컬럼 TO 변경할 컬럼명;
    ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건(컬럼명)-제약조건을 추가 하고 싶을 때 쓰는 명령어

    DROP -테이블 삭제,만약 해당테이블을 참조하고 있는 다른테이블이 존재하는경우 CASCADE 옵션을 명시하지 않으면 삭제가 안된다
    DROP TABLE 테이블명;

    RENAME-테이블명을 변경할 때 쓰는 명령어
    RENAME 기존테이블명 TO 변결할 테이블;

    TRUNCATE-테이블 전체데이터를 삭제,ROLLBACK이 불가하다 DELETE 명령어와 유사하지만 저장 공간이 재사용되도록 초기화된다는차이점이 있다

*DCL-USER을 생성하고 USER에게 데이터를 컨트롤할 수 있는 권한 부여하거나 회수하는명령
    CREATE USER 사용자명 IDENRIFIFD BY 패스워드;-사용자를 생성하는 명령어
    ALTER USER 사용자명 IDENRIFIFD BY 패스워드;-사용자 변경
    DROP USER 사용자명;-사용자 삭제 
    GRANT 권한 TO 사용자명;-사용자에게 권한을 부여하는 명령어
    REVOKE 권한 FROM-사용자 권한 회수라는 명령어
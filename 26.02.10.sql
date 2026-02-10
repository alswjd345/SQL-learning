
user테이블
user_id(1,2,3),name(철수,영희,민수)

orders테이블
id(1,2) ,user_id(1,null)

NOT IN을 사용한 경우
SELECT * FROM users
WHERE id NOT IN (
  SELECT user_id
  FROM orders
);
--->결과 없음, NOT IN은 내부에 NULL이 하나라도 있으면 UNKNOWN이기 때문에 모든 조건이 false가 된다

NOT EXISTS를 사용한 경우 
SELECT * FROM users u
WHERE NOT EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.user_id = u.id
);--->2,영희 3,민수가 출력 
--->order에 매칭되는 행 존재만 출력 ,null은 비교대상이 아니라 상관없음


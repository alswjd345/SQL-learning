with절
하나의 서브쿼리 또는 하나의 테이블처럼 사용할 수 있는 기능
with절은 코드의 가독성을 높이고,sql의 성능을 개선해 준다는 장점이 있다

with {테이블 명} as ( 

		with절로 저장하고 싶은 SQL 쿼리문
    
)
 
select * from {with절로 저장한 테이블명};

예시)각 cust_id 별 총 주문 합계 구하기 
-with절을 사용하지 않은 경우
select a.cust_id, seq, price, tot_amt
 
from receipts a
	join (
		select cust_id, sum(seq*price) as tot_amt
		from receipts
		group by 1
	) b
	on a.cust_id = b.cust_id
;

-with절을 사용한 경우
with tot_amt as (
	select cust_id, sum(seq*price) as tot_amt
	from receipts
	group by 1
)
 
 select a.cust_id, seq, price, tot_amt
from receipts a
	join tot_amt b on a.cust_id = b.cust_id
;

*BETWEEN와 LIKE 스캔범위 비교
결론부터 말하면 LIKE보다 BETWEEN을 사용하는게 낫다
OR조건 활용
인덱스 선두 컬럼에 대한 옵션 조건에 OR조건을 사용해선 안된다

LIKE/BETWEEN패턴을 사용할 대는 네가지 경우에 속하는지 반드시 점검해야한다
1.인덱스 선두 컬럼
    인덱스 선두 컬럼에 대한 옵션 조건을 LIKE/BETWEEN 연산자로 처리하는건 금물이다
2.NULL 허용컬럼
    성능을 떠나 결과 집합에 오류가 생기기 떄문에 금기다
3.숫자형 컬럼
    숫자형이면서 인덱스 조건으로도 사용 가능한 컬럼에 대한 옵션 조건 처리는 LIKE방식 사용해선 안된다
4.가변 길이 컬럼
    LIKE조건에 사용할 때는 컬럼 값 길이가 고정적이어야 한다

UNION ALL 활용
예를 들어 :cust_id 변수 값을 입력했는지에 따라 위아래 SQL중 하나만 되게 실행되는 방식이다
NULL 허용 컬럼이더라도 전혀 문제가 없다 단점은 SQL코딩량이 길러진다

NVL/DECODE 함수 활용 
    SELECT *FROM 거래 WHERE 고객ID =NVL(:cust_id,고객ID) AND 거래일자 BETWEEN :dt1 AND dt2
    SELECT *FROM 거래 WHERE 고객ID =DECODE(:cust_id,NULL,고객ID,:cust_id) AND 거래일자 BETWEEN :dt1 AND dt2
    OR 쿼리변환이 일어나 UNION ALL방식으로 쿼리를 변환했다 UNION ALL 보다 단순하면서 갇은 성능을 냈다 
    단점은 NULL허용 컬럼에 사용할 수 없다는 데 있다 

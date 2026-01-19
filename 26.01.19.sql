FROM- WHERE- GROUP BY- HAVING- SELECT- ORDER BY 순서로 실행

NULL인 경우 출력대상 제외 
->컬럼 IS NOT NULL

CONCAT(컬럼1,컬럼2)-문자열을 합치기 위한 함수 
SELECT CONCAT('가나다라','아자차카') FROM DUAL;
-->가나다라아자차카
또는 || 로 사용할 수 있다 
SELECT 컬럼 || 컬럼 FROM DUAL;

SUBSTR(문자열,시작위치,길이)-문자열 자르기
뒤에서 부터 자를떄는 시작위치에 음수 값을 입력하면 된다

예제)USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서 중고 거래 게시물을 3건 이상 등록한 사용자의 사용자 ID, 닉네임, 전체주소, 전화번호를 조회하는 SQL문을 작성해주세요. 이때, 전체 주소는 시, 도로명 주소, 상세 주소가 함께 출력되도록 해주시고,
 전화번호의 경우 xxx-xxxx-xxxx 같은 형태로 하이픈 문자열(-)을 삽입하여 출력해주세요. 
결과는 회원 ID를 기준으로 내림차순 정렬해주세요.
SELECT
    u.USER_ID,
    u.NICKNAME,
    (u.CITY || ' ' || u.STREET_ADDRESS1 || ' ' || u.STREET_ADDRESS2) AS 전체주소,
    (SUBSTR(u.TLNO, 1,3) || '-' || SUBSTR(u.TLNO, 4,4) || '-' || SUBSTR(u.TLNO, 8,4)) AS 전화번호
FROM USED_GOODS_USER u
INNER JOIN (
    SELECT WRITER_ID
    FROM USED_GOODS_BOARD 
    GROUP BY WRITER_ID
    HAVING COUNT(*) >= 3
) b 
ON u.USER_ID = b.WRITER_ID
ORDER BY u.USER_ID DESC;
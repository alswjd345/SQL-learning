REGEXP_LIKE(컬럼이나 문자열, 정규표현식, 일치옵션)

* 일치 옵션(생략 가능)
i: 대소문자 구분 안 함 
c: 대소문자 구분 
n: 줄바꿈 문자를 일치시킴

* 정규표현식
^ : 문자열의 시작을 의미(예시- ^A (A로 시작하는 문자열))
$ : 문자열의 끝을 의미(예시- Z$ (Z로 끝나는 문자열))
[ ]	: 괄호 안의 문자 중 하나(예시- [0-9] (숫자), [a-z] (소문자))
{n}	: n번 반복	[0-9]{3} (숫자 3자리)
. : 임의의 한 글자	a.c (abc, a1c 등)

휴대폰 번호 형식 
SELECT * FROM contacts
WHERE REGEXP_LIKE(phone, '^010-[0-9]{4}-[0-9]{4}$');

대소문자 구분 없이 any 찾기 
SELECT * FROM employees
WHERE REGEXP_LIKE(first_name, 'any', 'i');

다중 데이터 검색하기
SELECT * FROM temp
WHERE REGEXP_LIKE(ename, 'MI|AD|JA'); --MI,AD,JA 포함된 데이터를 조회한다

SELECT * FROM temp
WHERE ename LIKE '%MI%'
   OR ename LIKE '%AD%'
   OR ename LIKE '%JA%' -- 위 결과랑 같은 데이터가 추출된다 

SELECT * FROM temp
WHERE REGEXP_LIKE(ename, '^MI|^AD|^JA') -- ^MI = MI%랑 유사하다고 보면 된다   

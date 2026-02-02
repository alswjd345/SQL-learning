ROLLUP-소그룹 간의 소계 및 총계를 계산하는 함수이다
ROLLUP(A)-A로 그룹핑,총합계
ROLLUP(A,B)-A,B로 그룹핑,A로 그룹핑,총합계
ROLLUP(A,B,C)-A,B,C로 그룹핑,A,B로 그룹핑,A로 그룹핑 총합계

CUBE-소그룹간의 소계 및 총계를 다차원적으로 계산할 수 있는 함수이다,조합할 수 있는 모든 그룹의 소계를 집계한다
CUBE(A)-A로 그룹핑,총합계
CUBE(A,B)-A,B로 그룹핑, A로 그룹핑, B로 그룹핑, 총합계
CUBE(A,B,C)A,B,C로 그룹핑, A,B로 그룹핑, A,C로 그룹핑, ...., 총합계

GROUPING SETS-특정항목에 대한 소계를 계산하는 함수,인자값으로 ROLLUP이나 CUBE를 사용할 수도 있다.
GROUPING SETS(A,B)-A로 그룹핑 ,B로 그룹핑
GROUPING SETS(A,B,())-A로 그룹핑,B로 그룹핑, 총합계
GROUPING SETS(A,ROLLUP(B,C))-A로 그룹핑,B,C로 그룹핑,B로 그룹핑,총합계

GROUPING-ROLLUP,CUBE,GROUPING SETS와 함께 쓰이며 소계는 나타내는 ROW를 구분할 수 있게 해준다

ROLLUP은 인수의 순서에 따라 결과가 달라지며 CUBE와 GROUPING SETS은 인수의 순서가 바뀌어도 같은 결과를 출력한다

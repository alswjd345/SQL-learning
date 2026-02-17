문제)문자열 my_string과 이차원 정수 배열 queries가 매개변수로 주어집니다. queries의 원소는 [s, e] 형태로, my_string의 인덱스 s부터 인덱스 e까지를 뒤집으라는 의미입니다. 
my_string에 queries의 명령을 순서대로 처리한 후의 문자열을 return 하는 solution 함수를 작성해 주세요.
    class Solution {
        public String solution(String my_string, int[][] queries) {
            char[] arr = my_string.toCharArray();
            //여러 개의 뒤집기 명령(queries)을 하나씩 꺼내서 실행
            for (int[] query : queries) {
                // 이번 명령어의 시작 인덱스(s)와 끝 인덱스(e)를 가져옴
                int s = query[0];
                int e = query[1];
                
                int left = s;
                int right = e;
                while (left < right) {
                    char temp = arr[left];
                    arr[left] = arr[right];
                    arr[right] = temp;
                    left++;
                    right--;
                }
            }

            //배열을 다시 문자열로 바꿔서 반환
            return new String(arr);
        }
    }

문제)문자열 my_string과 정수 배열 index_list가 매개변수로 주어집니다
 my_string의 index_list의 원소들에 해당하는 인덱스의 글자들을 순서대로 이어 붙인 문자열을 return 하는 solution 함수를 작성해 주세요
    import java.util.Arrays;
    class Solution {
        public String solution(String my_string, int[] index_list) {
            String answer = "";
            char[] charArr = my_string.toCharArray();
            for(int i=0;i<index_list.length;i++){
            answer+= charArr[index_list[i]];
            }
        return answer;
        }
    }
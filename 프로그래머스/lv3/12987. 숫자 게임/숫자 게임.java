import java.util.*;

class Solution {
    public int solution(int[] A, int[] B) {
        int answer = 0;
        int[] aList = A;
        int[] bList = B;
        Arrays.sort(aList);
        Arrays.sort(bList);
        
        int index = 0;
        for (int i = 0; i < bList.length; i++) {
            if (aList[index] < bList[i]) {
                answer++;
                index++;
            }
        }
        
        return answer;
    }
}
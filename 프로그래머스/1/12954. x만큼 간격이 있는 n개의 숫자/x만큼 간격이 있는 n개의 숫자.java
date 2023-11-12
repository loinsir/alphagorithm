import java.util.*;

class Solution {
    public long[] solution(int x, int n) {

        List<Long> answer = new ArrayList<>();
        long value = x;
        for(int i = x; answer.size() < n; value += x) {
            answer.add(value);
        }
        
        long[] res = new long[n];
        for (int i = 0; i < n; i++) {
            res[i] = answer.get(i);
        }
        
        return res;
    }
}
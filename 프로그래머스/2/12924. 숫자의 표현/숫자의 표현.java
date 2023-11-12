class Solution {
    public int solution(int n) {
        int answer = 0;
        
        for (int i=1; i <= n; i++) {
            int tmp = i;
            for (int j = i; tmp <= n; tmp += j) {
                if (tmp == n) {
                    answer++;
                    break;
                }
                j++;
            }
        }
        
        return answer;
    }
}
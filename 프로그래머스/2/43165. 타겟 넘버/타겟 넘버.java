import java.util.*;

class Solution {
    
    int answer = 0;
    int[] numbers;
    int target;
    
    public int solution(int[] numbers, int target) {
        this.numbers = numbers;
        this.target = target;
        dfs(0, 0);
        
        return answer;
    }
    
    void dfs(int value, int depth) {
        if (depth == numbers.length) {
            if (value == target) { 
                answer++; 
            }
            return;
        }
            
        dfs(value + numbers[depth], depth + 1);
        dfs(value - numbers[depth], depth + 1);
    }
}
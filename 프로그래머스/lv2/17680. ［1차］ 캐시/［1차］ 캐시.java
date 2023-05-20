import java.util.*;

class Solution {
    public int solution(int cacheSize, String[] cities) {
        int answer = 0;
        Map<String, Integer> dict = new HashMap<>();
        
        for (int i=0; i < cities.length; i++) {
            if (dict.containsKey(cities[i].toLowerCase()) && cacheSize > 0) { // hit
                dict.put(cities[i].toLowerCase(), i);
                answer += 1;
            } else { // miss
                if (dict.size() < cacheSize) {
                    dict.put(cities[i].toLowerCase(), i);
                } else {
                    // remove
                    int minTime = cities.length;
                    String toRemove = "";
                    for (String key : dict.keySet() ) {
                        if (dict.get(key) < minTime) {
                            minTime = dict.get(key.toLowerCase());
                            toRemove = key.toLowerCase();
                        }
                    }
                    dict.remove(toRemove.toLowerCase());
                    dict.put(cities[i].toLowerCase(), i);
                }
                answer += 5;
            }
        }
        
        return answer;
    }
}
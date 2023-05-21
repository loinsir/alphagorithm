import java.util.*;

class Solution {
    public int solution(String skill, String[] skill_trees) {
        int answer = 0;
        Map<String, Boolean> dict = new HashMap<>();
        
        for (int i = 0; i < skill_trees.length; i++) {
            String str = skill_trees[i];
            Boolean isValidSkill = true;
            for (int j = 0; j < skill.length(); j++) {
                dict.put(String.valueOf(skill.charAt(j)), false);
            }
            dict.put(String.valueOf(skill.charAt(0)), true);
            int skillIdx = 0;
            
            for (int j = 0; j < str.length(); j++) {
                if (dict.containsKey(String.valueOf(str.charAt(j)))) {
                    if (dict.get(String.valueOf(str.charAt(j))) == true) {
                        if (skillIdx < skill.length() - 1) {
                            skillIdx += 1;
                            dict.put(String.valueOf(skill.charAt(skillIdx)), true);
                        }
                    } else {
                        isValidSkill = false;
                        break;
                    }
                }
            }
            
            if (isValidSkill) {
                answer++;
            }
        }
        return answer;
    }
}
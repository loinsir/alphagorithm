import java.util.*;

class Solution {
    
    ArrayList<Integer>[] childs;
    int[] info;
    int answer = 0;
    
    public int solution(int[] info, int[][] edges) {
        this.info = info;
        childs = new ArrayList[info.length];
        for (int[] infos: edges) {
            int parent = infos[0];
            int child = infos[1];
            if (childs[parent] == null) {
                childs[parent] = new ArrayList<>();
            }
            childs[parent].add(child);
        }
        
        List<Integer> list = new ArrayList<>();
        list.add(0);
        dfs(0, 0, 0, list);
        
        
        return answer;
    }
    
    private void dfs(int node, int sheep, int wolves, List<Integer> nextNodes) {
        if (info[node] == 0) sheep++;
        else wolves++;
        
        if (wolves >= sheep) return;
        answer = Math.max(sheep, answer);
        
        List<Integer> list = new ArrayList<>();
        list.addAll(nextNodes);
        
        list.remove(Integer.valueOf(node));
        
        if (childs[node] != null) {
            for (int child: childs[node]) {
                list.add(child);
            }
        }
        
        for (int next: list) {
            dfs(next, sheep, wolves, list);
        }
    }
}
import java.util.*;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.io.*;

public class Main {
    
    static int[][] A = new int[100][100];
    static int r, c, k;
    static int maxRows = 3;
    static int maxCols = 3;
    
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        r = Integer.parseInt(st.nextToken());
        c = Integer.parseInt(st.nextToken());
        k = Integer.parseInt(st.nextToken());
        
        for (int i = 0; i < 3; i++) {
            st = new StringTokenizer(br.readLine());
            for (int j = 0; j < 3; j++) {
                A[i][j] = Integer.parseInt(st.nextToken());
            }
        }
        
        int time = -1;
        while (time <= 100) {
            time++;

            if (check()) {
                break;
            }
            
            if (maxCols >= maxRows) {
                r();
            } else {
                c();
            }
        }
        
        // 출력
        if (time > 100) {
            System.out.println(-1);
        } else {
            System.out.println(time);
        }
    }
    
    public static void r() {
        for (int i = 0; i < maxCols; i++) {
            List<Integer> row = Arrays.stream(A[i]).boxed().collect(Collectors.toList());
            ArrayList<Integer> newRow = new ArrayList<>();
            ArrayList<ArrayList<Integer>> nestedRow = new ArrayList<>();
            Map<Integer, Integer> map = new HashMap<>();
            for (int j = 0; j < maxRows; j++) {
                if (row.get(j) == 0) continue;
                
                if (map.containsKey(row.get(j))) {
                    map.put(row.get(j), map.get(row.get(j)) + 1);
                } else {
                    map.put(row.get(j), 1);
                }
            }
            
            for (Integer key: map.keySet()) {
                ArrayList<Integer> ele = new ArrayList<>();
                ele.add(key);
                ele.add(map.get(key));
                nestedRow.add(ele);
            }
            Collections.sort(nestedRow, new Comparator<ArrayList<Integer>>() {
                @Override
                public int compare(ArrayList<Integer> o1, ArrayList<Integer> o2) {
                    return o1.get(1) == o2.get(1) ? o1.get(0).compareTo(o2.get(0)) : o1.get(1).compareTo(o2.get(1));
                }
            });
            
            for (int l = 0; l < nestedRow.size(); l++) {
                newRow.add(nestedRow.get(l).get(0));
                newRow.add(nestedRow.get(l).get(1));
            }
            
            maxRows = Math.max(maxRows, newRow.size());

            for (int l = 0; l < newRow.size(); l++) {
                A[i][l] = newRow.get(l);
            }

            for (int l = newRow.size(); l < maxRows; l++) {
                A[i][l] = 0;
            }
        }
    }
    
    public static void c() {
        for (int i = 0; i < maxRows; i++) {
            List<Integer> col = new ArrayList<Integer>();
            for (int j = 0; j < A.length; j++) {
                col.add(A[j][i]);
            }
            ArrayList<ArrayList<Integer>> nestedCol = new ArrayList<ArrayList<Integer>>();
            List<Integer> newCol = new ArrayList<>();
            
            Map<Integer, Integer> map = new HashMap<>();
            for (int l = 0; l < col.size(); l++) {
                if (col.get(l) == 0) continue;

                if (map.containsKey(col.get(l))) {
                    map.put(col.get(l), map.get(col.get(l)) + 1);
                } else {
                    map.put(col.get(l), 1);
                }
            }
            
            for (Integer key: map.keySet()) {
                ArrayList<Integer> ele = new ArrayList<>();
                ele.add(key);
                ele.add(map.get(key));
                nestedCol.add(ele);
            }
            Collections.sort(nestedCol, new Comparator<ArrayList<Integer>>() {
                @Override
                public int compare(ArrayList<Integer> o1, ArrayList<Integer> o2) {
                    return o1.get(1) == o2.get(1) ? o1.get(0).compareTo(o2.get(0)) : o1.get(1).compareTo(o2.get(1));
                }
            });
            
            for (int l = 0; l < nestedCol.size(); l++) {
                newCol.add(nestedCol.get(l).get(0));
                newCol.add(nestedCol.get(l).get(1));
            }
            
            maxCols = Math.max(maxCols, newCol.size());
            for (int l = 0; l < newCol.size(); l++) {
                A[l][i] = newCol.get(l);
            }

            for (int l = newCol.size(); l < maxCols; l++) {
                A[l][i] = 0;
            }
        }
    }
    
    public static boolean check() {
        return A[r-1][c-1] == k;
    }
}
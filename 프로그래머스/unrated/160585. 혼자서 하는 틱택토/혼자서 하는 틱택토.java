import java.util.*;

class Solution {
    private final int[] dx = {-1, 1, 0, 0, -1, 1, 1, -1};
    private final int[] dy = {0, 0, -1, 1, -1, 1, -1, 1};

    private int n;

    public int solution(String[] board) {
        int answer = 0;

        n = board.length;

        int o = 0;
        int x = 0;
        for(int i=0; i<n; i++){
            for(int j=0; j<n; j++){
                if(board[i].charAt(j) == 'O'){
                    o++;
                }else if (board[i].charAt(j) == 'X'){
                    x++;
                }
            }
        }

        // 'O'와 'X'의 말판 개수 차이는 무조건 1이내
        if((o-x) <= 1 && (o-x)>=0){
            // 길이가 3인 직선이 만들어질 수 없음
            if(o < 3 && x < 3){
                answer = 1;
            } else {
                boolean[][] visited = new boolean[n][n];
                boolean oLine = false;
                boolean xLine = false;

                // bfs를 통해 직선 확인
                for(int i=0; i<n; i++){
                    for(int j=0; j<n; j++){
                        if(!visited[i][j]){
                            if(board[i].charAt(j) == 'O'){
                                if(!oLine) oLine = isLine(board, visited, 'O', i, j);
                            } else if(board[i].charAt(j) == 'X'){
                                if(!xLine) xLine = isLine(board, visited, 'X', i, j);
                            }
                        }
                    }
                }

                if(oLine && xLine){ // 1. 하나의 직선이 만들어지면 게임이 종료되기 때문에 불가능하다.
                    answer = 0;
                }else if(oLine){ // 2. 'O'의 직선만 만들어질 때
                    // 선공이 'O'이기 때문에, X와 개수가 같아질 수 없다.
                    if(o == x){
                        answer = 0;
                    }else{
                        answer = 1;
                    }
                }else if(xLine){ // 3. 'X'의 직선만 만들어질 때
                    // 'X'는 후공이기 때문에, O의 개수와 같아야 한다.
                    if(o > x){
                        answer = 0;
                    }else{
                        answer = 1;
                    }
                } else { // 4. 직선이 만들어지지 않을 때
                    answer = 1;
                }
            }
        } else {
            answer = 0;
        }

        return answer;
    }

    private boolean isLine(String[] board, boolean[][] visited, char c, int x, int y){
        Queue<Node> qu = new LinkedList<>();
        qu.add(new Node(x, y, -1, 1));

        while(!qu.isEmpty()){
            Node cn = qu.poll();

            // 길이가 3인 직선이 만들어질 때
            if(cn.len == 3){
                return true;
            }

            for(int i=0; i<8; i++){
                int nx = cn.x + dx[i];
                int ny = cn.y + dy[i];

                if(!inRange(nx, ny) || board[nx].charAt(ny) != c || visited[nx][ny]){
                    continue;
                }

                // 직선이 되기 위해서는 같은 방향이여야 함
                if(cn.d == -1 || cn.d == i){
                    qu.add(new Node(nx, ny, i, cn.len+1));
                }
            }

        }
        return false;
    }

    private boolean inRange(int x, int y){
        return (x>=0 && y>=0 && x<n && y<n);
    }

    private class Node{
        int x, y, d, len;

        Node(int x, int y, int d, int len){
            this.x = x;
            this.y = y;
            this.d = d; // 방향
            this.len = len; // 길이
        }
    }
}
import java.util.*;
import java.io.*;

/**
 * Main
 */
public class Main {

    static int r, c;
    static char[][] map;
    static boolean[][] visited;

    static int[] dy = { -1, 0, 1 };
    static int[] dx = { 1, 1, 1 };

    static int answer = 0;

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        r = Integer.parseInt(st.nextToken());
        c = Integer.parseInt(st.nextToken());
        map = new char[r][c];
        visited = new boolean[r][c];
        for (int i = 0; i < r; i++) {
            map[i] = br.readLine().toCharArray();
        }

        for (int y = 0; y < r; y++) {
            dfs1(y, 0);
            visited[y][0] = true;
        }

        System.out.println(answer);
    }

    public static boolean dfs1(int y, int x) {
        if (x == c-1) {
            answer++;
            return true;
        }

        for (int i = 0; i < 3; i++) {
            if (isAvail(y+dy[i], x+dx[i]) && !visited[y+dy[i]][x+dx[i]] && map[y+dy[i]][x+dx[i]] != 'x') {
                visited[y+dy[i]][x+dx[i]] = true;
                if (dfs1(y+dy[i], x+dx[i])) {
                    return true;
                }
            }
        }

        return false;
    }

    public static boolean isAvail(int y, int x) {
        return y >= 0 && y < r && x >= 0 && x < c;
    }
}
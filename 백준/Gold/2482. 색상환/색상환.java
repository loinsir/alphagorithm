import java.util.*;
import java.io.*;

public class Main {

    static int n;
    static int k;
    static int[][] dp;

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        n = Integer.parseInt(st.nextToken());
        st = new StringTokenizer(br.readLine());
        k = Integer.parseInt(st.nextToken());

        if (k > n / 2) {
            System.out.println(0);
            return;
        }

        dp = new int[n+1][k+1];

        for (int i = 1; i <= n; i++) {
            dp[i][1] = i;
        }

        for (int i = 4; i <= n; i++) {
            for (int j = 2; j <= k; j++) {
                dp[i][j] = (dp[i-1][j] + dp[i-2][j-1]) % 1_000_000_003;
            }
        }

        System.out.println(dp[n][k]);
    }
}
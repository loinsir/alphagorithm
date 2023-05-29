import java.util.*;
import java.io.*;

public class Main {

    static String s;
    static String p;

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        s = br.readLine();
        p = br.readLine();

        int pPoint = 0;
        int answer = 0;

        while (pPoint < p.length()) {
            int copyLength = 0;

            for (int i = 0; i < s.length(); i++) {
                int tmpCopyLength = 1;
                String tmp = s.substring(i, i + tmpCopyLength);
                while (tmp.equals(p.substring(pPoint, pPoint + tmpCopyLength))) {
                    tmpCopyLength++;
                    if (tmpCopyLength + pPoint > p.length() || i + tmpCopyLength > s.length()) {
                        break;
                    }
                    tmp = s.substring(i, i + tmpCopyLength);
                }
                copyLength = Math.max(copyLength, tmpCopyLength);
            }
            pPoint += copyLength-1;
            answer++;
        }

        System.out.println(answer);
    }
}
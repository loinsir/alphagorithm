import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {

	public static char[][] up;
	public static char[][] down;
	public static char[][] front;
	public static char[][] back;
	public static char[][] left;
	public static char[][] right;
	
	
	public static void main(String[] args) throws IOException{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringBuilder sb = new StringBuilder();
		int TC = Integer.parseInt(br.readLine());
		for(int test_case=1;test_case<=TC;test_case++) {
			int n = Integer.parseInt(br.readLine());
			String[] data = br.readLine().split(" ");
			up = new char[][]{{'w', 'w', 'w'}, {'w', 'w', 'w'}, {'w', 'w', 'w'}};
			down = new char[][]{{'y', 'y', 'y'}, {'y', 'y', 'y'}, {'y', 'y', 'y'}};
			front = new char[][]{{'r', 'r', 'r'}, {'r', 'r', 'r'}, {'r', 'r', 'r'}};
			back = new char[][]{{'o', 'o', 'o'}, {'o', 'o', 'o'}, {'o', 'o', 'o'}};
			left = new char[][]{{'g', 'g', 'g'}, {'g', 'g', 'g'}, {'g', 'g', 'g'}};
			right = new char[][]{{'b', 'b', 'b'}, {'b', 'b', 'b'}, {'b', 'b', 'b'}};
			
			for(int i=0;i<n;i++) {
				String str = data[i];
				char move = str.charAt(0);
				char dir = str.charAt(1);
				if(move == 'U') {
					rotate_U(dir);
				} else if(move == 'D') {
					rotate_D(dir);
				} else if(move == 'F') {
					rotate_F(dir);
				} else if(move == 'B') {
					rotate_B(dir);
				} else if(move == 'L') {
					rotate_L(dir);
				} else if(move == 'R') {
					rotate_R(dir);
				}
				
				
			}
					
			for(int i=0;i<3;i++) {
				for(int j=0;j<3;j++) {
					sb.append(up[i][j]);
				}
				sb.append("\n");
			}
		}
		System.out.println(sb.toString());
	}
	
	public static void rotate_U(char dir) {
		
		if(dir == '+') {
			up = rotate1(up);
			char[] temp = back[0];
			back[0] = left[0];
			left[0] = front[0];
			front[0] = right[0];
			right[0] = temp;

			// 뒷 - 오 - 앞 - 왼 - 뒷
			
		} else {

			up = rotate2(up);
			// 뒷 - 왼 - 앞 - 오 - 뒷 
			char[] temp = back[0].clone();
			back[0] = right[0].clone();
			right[0] = front[0].clone();
			front[0] = left[0].clone();
			left[0] = temp;
		}
	}
	
	public static void rotate_D(char dir) {
		if(dir == '+') {
			down = rotate1(down);
			// 뒷 - 왼 - 앞 - 오 - 뒷 
			char[] temp = back[2].clone();
			back[2] = right[2].clone();
			right[2] = front[2].clone();
			front[2] = left[2].clone();
			left[2] = temp;
		} else {
			down = rotate2(down);
			// 뒷 - 오 - 앞 - 왼 - 뒷
			char[] temp = back[2].clone();
			back[2] = left[2].clone();
			left[2] = front[2].clone();
			front[2] = right[2].clone();
			right[2] = temp;
		}
	}
	
	public static void rotate_F(char dir) {
		if(dir == '+') {
			front = rotate1(front);
			// 윗 - 오 - 바 - 왼 - 윗
			char[] temp = new char[3];
			for(int i=0;i<3;i++) {
				temp[i] = up[2][i];
			}
			
			for(int i=0;i<3;i++) {
				up[2][i] = left[2-i][2];
			}

			for(int i=0;i<3;i++) {
				left[i][2] = down[2][2-i];
			}
			
			for(int i=0;i<3;i++) {
				down[2][i] = right[i][0];
			}
			
			for(int i=0;i<3;i++) {
				right[i][0] = temp[i];
			}
			
			
			
		} else {
			front = rotate2(front);
			// 윗 - 왼 - 바 - 오 - 윗
			char[] temp = new char[3];
			for(int i=0;i<3;i++) {
				temp[i] = up[2][2-i];
			}
	
			for(int i=0;i<3;i++) {
				up[2][i] = right[i][0];
			}

			for(int i=0;i<3;i++) {
				right[i][0] = down[2][i];
			}
			

			for(int i=0;i<3;i++) {
				down[2][i] = left[2-i][2];
			}

			for(int i=0;i<3;i++) {
				left[i][2] = temp[i];
			}
			
		}
	}
	
	public static void rotate_B(char dir) {
		if(dir == '+') {
			back = rotate1(back);
			// 윗 - 왼 - 바 - 오 - 윗
			char[] temp = new char[3];
			for(int i=0;i<3;i++) {
				temp[i] = up[0][2-i];
			}
			for(int i=0;i<3;i++) {
				up[0][i] = right[i][2];
			}
			for(int i=0;i<3;i++) {
				right[i][2] = down[0][i];
			}
			for(int i=0;i<3;i++) {
				down[0][i] = left[2-i][0];
			}
			for(int i=0;i<3;i++) {
				left[i][0] = temp[i];
			}
			
		} else {
			back = rotate2(back);
			// 윗 - 오 - 바 - 왼 - 윗
			char[] temp = new char[3];
			for(int i=0;i<3;i++) {
				temp[i] = up[0][i];
			}

			for(int i=0;i<3;i++) {
				up[0][i] = left[2-i][0];
			}
			for(int i=0;i<3;i++) {
				left[i][0] = down[0][2-i];
			}
			for(int i=0;i<3;i++) {
				down[0][i] = right[i][2];
			}
			for(int i=0;i<3;i++) {
				right[i][2] = temp[i];
			}
		}
	}
	
	public static void rotate_L(char dir) {
		if(dir == '+') {
			left = rotate1(left);
			// 윗 - 앞 - 바 - 뒷 - 윗
			char[] temp = new char[3];
			for(int i=0;i<3;i++) {
				temp[i] = up[i][0];
			}
			for(int i=0;i<3;i++) {
				up[i][0] = back[2-i][2];
			}
			for(int i=0;i<3;i++) {
				back[i][2] = down[i][2];
			}
			for(int i=0;i<3;i++) {
				down[i][2] = front[2-i][0];
			}
			for(int i=0;i<3;i++) {
				front[i][0] = temp[i];
			}
		} else {
			left = rotate2(left);
			// 윗 - 뒷 - 바 - 앞  - 윗
			char[] temp = new char[3];
			for(int i=0;i<3;i++) {
				temp[i] = up[2-i][0];
			}
			for(int i=0;i<3;i++) {
				up[i][0] = front[i][0];
			}
			for(int i=0;i<3;i++) {
				front[i][0] = down[2-i][2];
			}
			for(int i=0;i<3;i++) {
				down[i][2] = back[i][2];
			}
			for(int i=0;i<3;i++) {
				back[i][2] = temp[i];
			}
		}
	}
	
	public static void rotate_R(char dir) {
		if(dir == '+') {
			right = rotate1(right);
			// 윗 - 뒷 - 바 - 앞  - 윗
			char[] temp = new char[3];
			for(int i=0;i<3;i++) {
				temp[i] = up[2-i][2];
			}
			for(int i=0;i<3;i++) {
				up[i][2] = front[i][2];
			}
			for(int i=0;i<3;i++) {
				front[i][2] = down[2-i][0];
			}
			for(int i=0;i<3;i++) {
				down[i][0] = back[i][0];
			}
			for(int i=0;i<3;i++) {
				back[i][0] = temp[i];
			}
		} else {
			right = rotate2(right);
			// 윗 - 앞 - 바 - 뒷 - 윗
			char[] temp = new char[3];
			for(int i=0;i<3;i++) {
				temp[i] = up[i][2];
			}
			for(int i=0;i<3;i++) {
				up[i][2] = back[2-i][0];
			}
			for(int i=0;i<3;i++) {
				back[i][0] = down[i][0];
			}
			for(int i=0;i<3;i++) {
				down[i][0] = front[2-i][2];
			}
			for(int i=0;i<3;i++) {
				front[i][2] = temp[i];
			}
		}
	}
	
	// 시계방향으로 90도 회전
	public static char[][] rotate1(char[][] arr) {
		char[][] rotate = new char[3][3];
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				rotate[i][j] = arr[3-1-j][i];
			}
		}
		
		return rotate;
	}
	
	// 반시계 방향으로 90도 회전
	public static char[][] rotate2(char[][] arr) {
		char[][] rotate = new char[3][3];
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				rotate[i][j] = arr[j][3-1-i];
			}
		}
		
		return rotate;
	}
	



}
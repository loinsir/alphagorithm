# [Gold II] 2048 (Easy) - 12100 

[문제 링크](https://www.acmicpc.net/problem/12100) 

### 성능 요약

메모리: 79516 KB, 시간: 208 ms

### 분류

백트래킹, 브루트포스 알고리즘, 구현, 시뮬레이션

### 문제 설명

<p>2048 게임은 4×4 크기의 보드에서 혼자 즐기는 재미있는 게임이다. 이 <a href="https://gabrielecirulli.github.io/2048/">링크</a>를 누르면 게임을 해볼 수 있다.</p>

<p>이 게임에서 한 번의 이동은 보드 위에 있는 전체 블록을 상하좌우 네 방향 중 하나로 이동시키는 것이다. 이때, 같은 값을 갖는 두 블록이 충돌하면 두 블록은 하나로 합쳐지게 된다. 한 번의 이동에서 이미 합쳐진 블록은 또 다른 블록과 다시 합쳐질 수 없다. (실제 게임에서는 이동을 한 번 할 때마다 블록이 추가되지만, 이 문제에서 블록이 추가되는 경우는 없다)</p>

<table class="table">
	<tbody>
		<tr>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/1.png" style="height:250px; width:251px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/2.png" style="height:250px; width:246px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/3.png" style="height:250px; width:250px"></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td style="text-align:center"><그림 1></td>
			<td style="text-align:center"><그림 2></td>
			<td style="text-align:center"><그림 3></td>
		</tr>
	</tfoot>
</table>

<p><그림 1>의 경우에서 위로 블록을 이동시키면 <그림 2>의 상태가 된다. 여기서, 왼쪽으로 블록을 이동시키면 <그림 3>의 상태가 된다.</p>

<table class="table">
	<tbody>
		<tr>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/4.png" style="height:250px; width:247px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/5.png" style="height:250px; width:246px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/6.png" style="height:250px; width:247px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/7.png" style="height:250px; width:250px"></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td style="text-align:center"><그림 4></td>
			<td style="text-align:center"><그림 5></td>
			<td style="text-align:center"><그림 6></td>
			<td style="text-align:center"><그림 7></td>
		</tr>
	</tfoot>
</table>

<p><그림 4>의 상태에서 블록을 오른쪽으로 이동시키면 <그림 5>가 되고, 여기서 다시 위로 블록을 이동시키면 <그림 6>이 된다. 여기서 오른쪽으로 블록을 이동시켜 <그림 7>을 만들 수 있다.</p>

<table class="table">
	<tbody>
		<tr>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/8.png" style="height:250px; width:247px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/10.png" style="height:250px; width:249px"></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td style="text-align:center"><그림 8></td>
			<td style="text-align:center"><그림 9></td>
		</tr>
	</tfoot>
</table>

<p><그림 8>의 상태에서 왼쪽으로 블록을 옮기면 어떻게 될까? 2가 충돌하기 때문에, 4로 합쳐지게 되고 <그림 9>의 상태가 된다.</p>

<table class="table">
	<tbody>
		<tr>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/17.png" style="height:250px; width:248px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/18.png" style="height:250px; width:252px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/19.png" style="height:250px; width:250px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/20.png" style="height:250px; width:250px"></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td style="text-align:center"><그림 10></td>
			<td style="text-align:center"><그림 11></td>
			<td style="text-align:center"><그림 12></td>
			<td style="text-align:center"><그림 13></td>
		</tr>
	</tfoot>
</table>

<p><그림 10>에서 위로 블록을 이동시키면 <그림 11>의 상태가 된다. </p>

<p><그림 12>의 경우에 위로 블록을 이동시키면 <그림 13>의 상태가 되는데, 그 이유는 한 번의 이동에서 이미 합쳐진 블록은 또 합쳐질 수 없기 때문이다.</p>

<table class="table">
	<tbody>
		<tr>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/21.png" style="height:250px; width:249px"></td>
			<td style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/12094/22.png" style="height:250px; width:249px"></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td style="text-align:center"><그림 14></td>
			<td style="text-align:center"><그림 15></td>
		</tr>
	</tfoot>
</table>

<p>마지막으로, 똑같은 수가 세 개가 있는 경우에는 이동하려고 하는 쪽의 칸이 먼저 합쳐진다. 예를 들어, 위로 이동시키는 경우에는 위쪽에 있는 블록이 먼저 합쳐지게 된다. <그림 14>의 경우에 위로 이동하면 <그림 15>를 만든다.</p>

<p>이 문제에서 다루는 2048 게임은 보드의 크기가 N×N 이다. 보드의 크기와 보드판의 블록 상태가 주어졌을 때, 최대 5번 이동해서 만들 수 있는 가장 큰 블록의 값을 구하는 프로그램을 작성하시오.</p>

### 입력 

 <p>첫째 줄에 보드의 크기 N (1 ≤ N ≤ 20)이 주어진다. 둘째 줄부터 N개의 줄에는 게임판의 초기 상태가 주어진다. 0은 빈 칸을 나타내며, 이외의 값은 모두 블록을 나타낸다. 블록에 쓰여 있는 수는 2보다 크거나 같고, 1024보다 작거나 같은 2의 제곱꼴이다. 블록은 적어도 하나 주어진다.</p>

### 출력 

 <p>최대 5번 이동시켜서 얻을 수 있는 가장 큰 블록을 출력한다.</p>


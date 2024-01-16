# [Gold II] 퍼즐 - 1525 

[문제 링크](https://www.acmicpc.net/problem/1525) 

### 성능 요약

메모리: 99800 KB, 시간: 368 ms

### 분류

너비 우선 탐색, 자료 구조, 그래프 이론, 그래프 탐색, 해시를 사용한 집합과 맵

### 제출 일자

2024년 1월 16일 13:35:02

### 문제 설명

<p>3×3 표에 다음과 같이 수가 채워져 있다. 오른쪽 아래 가장 끝 칸은 비어 있는 칸이다.</p>

<table class="table table-bordered" style="width:15%">
	<tbody>
		<tr>
			<td style="text-align: center;">1</td>
			<td style="text-align: center;">2</td>
			<td style="text-align: center;">3</td>
		</tr>
		<tr>
			<td style="text-align: center;">4</td>
			<td style="text-align: center;">5</td>
			<td style="text-align: center;">6</td>
		</tr>
		<tr>
			<td style="text-align: center;">7</td>
			<td style="text-align: center;">8</td>
			<td style="text-align: center;"> </td>
		</tr>
	</tbody>
</table>

<p>어떤 수와 인접해 있는 네 개의 칸 중에 하나가 비어 있으면, 수를 그 칸으로 이동시킬 수가 있다. 물론 표 바깥으로 나가는 경우는 불가능하다. 우리의 목표는 초기 상태가 주어졌을 때, 최소의 이동으로 위와 같은 정리된 상태를 만드는 것이다. 다음의 예를 보자.</p>

<table class="table table-bordered" style="width:15%">
	<tbody>
		<tr>
			<td style="text-align: center;">1</td>
			<td style="text-align: center;"> </td>
			<td style="text-align: center;">3</td>
		</tr>
		<tr>
			<td style="text-align: center;">4</td>
			<td style="text-align: center;">2</td>
			<td style="text-align: center;">5</td>
		</tr>
		<tr>
			<td style="text-align: center;">7</td>
			<td style="text-align: center;">8</td>
			<td style="text-align: center;">6</td>
		</tr>
	</tbody>
</table>

<table class="table table-bordered" style="width:15%">
	<tbody>
		<tr>
			<td style="text-align: center;">1</td>
			<td style="text-align: center;">2</td>
			<td style="text-align: center;">3</td>
		</tr>
		<tr>
			<td style="text-align: center;">4</td>
			<td style="text-align: center;"> </td>
			<td style="text-align: center;">5</td>
		</tr>
		<tr>
			<td style="text-align: center;">7</td>
			<td style="text-align: center;">8</td>
			<td style="text-align: center;">6</td>
		</tr>
	</tbody>
</table>

<table class="table table-bordered" style="width:15%">
	<tbody>
		<tr>
			<td style="text-align: center;">1</td>
			<td style="text-align: center;">2</td>
			<td style="text-align: center;">3</td>
		</tr>
		<tr>
			<td style="text-align: center;">4</td>
			<td style="text-align: center;">5</td>
			<td style="text-align: center;"> </td>
		</tr>
		<tr>
			<td style="text-align: center;">7</td>
			<td style="text-align: center;">8</td>
			<td style="text-align: center;">6</td>
		</tr>
	</tbody>
</table>

<table class="table table-bordered" style="width:15%">
	<tbody>
		<tr>
			<td style="text-align: center;">1</td>
			<td style="text-align: center;">2</td>
			<td style="text-align: center;">3</td>
		</tr>
		<tr>
			<td style="text-align: center;">4</td>
			<td style="text-align: center;">5</td>
			<td style="text-align: center;">6</td>
		</tr>
		<tr>
			<td style="text-align: center;">7</td>
			<td style="text-align: center;">8</td>
			<td> </td>
		</tr>
	</tbody>
</table>

<p>가장 윗 상태에서 세 번의 이동을 통해 정리된 상태를 만들 수 있다. 이와 같이 최소 이동 횟수를 구하는 프로그램을 작성하시오.</p>

### 입력 

 <p>세 줄에 걸쳐서 표에 채워져 있는 아홉 개의 수가 주어진다. 한 줄에 세 개의 수가 주어지며, 빈 칸은 0으로 나타낸다.</p>

### 출력 

 <p>첫째 줄에 최소의 이동 횟수를 출력한다. 이동이 불가능한 경우 -1을 출력한다.</p>


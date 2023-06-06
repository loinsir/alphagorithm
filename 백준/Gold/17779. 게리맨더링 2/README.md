# [Gold III] 게리맨더링 2 - 17779 

[문제 링크](https://www.acmicpc.net/problem/17779) 

### 성능 요약

메모리: 69108 KB, 시간: 108 ms

### 분류

브루트포스 알고리즘, 구현, 시뮬레이션

### 문제 설명

<p>재현시의 시장 구재현은 지난 몇 년간 게리맨더링을 통해서 자신의 당에게 유리하게 선거구를 획정했다. 견제할 권력이 없어진 구재현은 권력을 매우 부당하게 행사했고, 심지어는 시의 이름도 재현시로 변경했다. 이번 선거에서는 최대한 공평하게 선거구를 획정하려고 한다.</p>

<p>재현시는 크기가 N×N인 격자로 나타낼 수 있다. 격자의 각 칸은 구역을 의미하고, r행 c열에 있는 구역은 (r, c)로 나타낼 수 있다. 구역을 다섯 개의 선거구로 나눠야 하고, 각 구역은 다섯 선거구 중 하나에 포함되어야 한다. 선거구는 구역을 적어도 하나 포함해야 하고, 한 선거구에 포함되어 있는 구역은 모두 연결되어 있어야 한다. 구역 A에서 인접한 구역을 통해서 구역 B로 갈 수 있을 때, 두 구역은 연결되어 있다고 한다. 중간에 통하는 인접한 구역은 0개 이상이어야 하고, 모두 같은 선거구에 포함된 구역이어야 한다.</p>

<p>선거구를 나누는 방법은 다음과 같다.</p>

<ol>
	<li>기준점 (x, y)와 경계의 길이 d<sub>1</sub>, d<sub>2</sub>를 정한다. (d<sub>1</sub>, d<sub>2</sub> ≥ 1, 1 ≤ x < x+d<sub>1</sub>+d<sub>2</sub> ≤ N, 1 ≤ y-d<sub>1</sub> < y < y+d<sub>2</sub> ≤ N)</li>
	<li>다음 칸은 경계선이다.
	<ol>
		<li>(x, y), (x+1, y-1), ..., (x+d<sub>1</sub>, y-d<sub>1</sub>)</li>
		<li>(x, y), (x+1, y+1), ..., (x+d<sub>2</sub>, y+d<sub>2</sub>)</li>
		<li>(x+d<sub>1</sub>, y-d<sub>1</sub>), (x+d<sub>1</sub>+1, y-d<sub>1</sub>+1), ... (x+d<sub>1</sub>+d<sub>2</sub>, y-d<sub>1</sub>+d<sub>2</sub>)</li>
		<li>(x+d<sub>2</sub>, y+d<sub>2</sub>), (x+d<sub>2</sub>+1, y+d<sub>2</sub>-1), ..., (x+d<sub>2</sub>+d<sub>1</sub>, y+d<sub>2</sub>-d<sub>1</sub>)</li>
	</ol>
	</li>
	<li>경계선과 경계선의 안에 포함되어있는 곳은 5번 선거구이다.</li>
	<li>5번 선거구에 포함되지 않은 구역 (r, c)의 선거구 번호는 다음 기준을 따른다.
	<ul>
		<li>1번 선거구: 1 ≤ r < x+d<sub>1</sub>, 1 ≤ c ≤ y</li>
		<li>2번 선거구: 1 ≤ r ≤ x+d<sub>2</sub>, y < c ≤ N</li>
		<li>3번 선거구: x+d<sub>1</sub> ≤ r ≤ N, 1 ≤ c < y-d<sub>1</sub>+d<sub>2</sub></li>
		<li>4번 선거구: x+d<sub>2</sub> < r ≤ N, y-d<sub>1</sub>+d<sub>2</sub> ≤ c ≤ N</li>
	</ul>
	</li>
</ol>

<p>아래는 크기가 7×7인 재현시를 다섯 개의 선거구로 나눈 방법의 예시이다.</p>

<table class="table table-bordered" style="width: 100%;">
	<tbody>
		<tr>
			<td style="width: 33%; text-align: center;"><img alt="" src="https://upload.acmicpc.net/c144c31e-db45-4094-9c1d-0656a690aef0/-/preview/" style="width: 300px; height: 303px;"></td>
			<td style="width: 33%; text-align: center;"><img alt="" src="https://upload.acmicpc.net/813c38e0-3197-4589-bc96-17d96eb9ed14/-/preview/" style="width: 300px; height: 305px;"></td>
			<td style="width: 34%; text-align: center;"><img alt="" src="https://upload.acmicpc.net/892417dd-b824-4d4e-8bce-2faf341a9f66/-/preview/" style="width: 300px; height: 302px;"></td>
		</tr>
		<tr>
			<td style="width: 33%; text-align: center;">x = 2, y = 4, d<sub>1</sub> = 2, d<sub>2</sub> = 2</td>
			<td style="width: 33%; text-align: center;">x = 2, y = 5, d<sub>1</sub> = 3, d<sub>2</sub> = 2</td>
			<td style="width: 34%; text-align: center;">x = 4, y = 3, d<sub>1</sub> = 1, d<sub>2</sub> = 1</td>
		</tr>
	</tbody>
</table>

<p>구역 (r, c)의 인구는 A[r][c]이고, 선거구의 인구는 선거구에 포함된 구역의 인구를 모두 합한 값이다. 선거구를 나누는 방법 중에서, 인구가 가장 많은 선거구와 가장 적은 선거구의 인구 차이의 최솟값을 구해보자.</p>

### 입력 

 <p>첫째 줄에 재현시의 크기 N이 주어진다.</p>

<p>둘째 줄부터 N개의 줄에 N개의 정수가 주어진다. r행 c열의 정수는 A[r][c]를 의미한다.</p>

### 출력 

 <p>첫째 줄에 인구가 가장 많은 선거구와 가장 적은 선거구의 인구 차이의 최솟값을 출력한다.</p>


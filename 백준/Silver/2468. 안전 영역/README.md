# [Silver I] 안전 영역 - 2468 

[문제 링크](https://www.acmicpc.net/problem/2468) 

### 성능 요약

메모리: 80932 KB, 시간: 68 ms

### 분류

그래프 이론, 브루트포스 알고리즘, 그래프 탐색, 너비 우선 탐색, 깊이 우선 탐색

### 문제 설명

<p>재난방재청에서는 많은 비가 내리는 장마철에 대비해서 다음과 같은 일을 계획하고 있다. 먼저 어떤 지역의 높이 정보를 파악한다. 그 다음에 그 지역에 많은 비가 내렸을 때 물에 잠기지 않는 안전한 영역이 최대로 몇 개가 만들어 지는 지를 조사하려고 한다. 이때, 문제를 간단하게 하기 위하여, 장마철에 내리는 비의 양에 따라 일정한 높이 이하의 모든 지점은 물에 잠긴다고 가정한다.</p>

<p>어떤 지역의 높이 정보는 행과 열의 크기가 각각 N인 2차원 배열 형태로 주어지며 배열의 각 원소는 해당 지점의 높이를 표시하는 자연수이다. 예를 들어, 다음은 N=5인 지역의 높이 정보이다.</p>

<table class="table table-bordered table-center-20 td-center">
	<tbody>
		<tr>
			<td>6</td>
			<td>8</td>
			<td>2</td>
			<td>6</td>
			<td>2</td>
		</tr>
		<tr>
			<td>3</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>6</td>
		</tr>
		<tr>
			<td>6</td>
			<td>7</td>
			<td>3</td>
			<td>3</td>
			<td>2</td>
		</tr>
		<tr>
			<td>7</td>
			<td>2</td>
			<td>5</td>
			<td>3</td>
			<td>6</td>
		</tr>
		<tr>
			<td>8</td>
			<td>9</td>
			<td>5</td>
			<td>2</td>
			<td>7</td>
		</tr>
	</tbody>
</table>

<p>이제 위와 같은 지역에 많은 비가 내려서 높이가 4 이하인 모든 지점이 물에 잠겼다고 하자. 이 경우에 물에 잠기는 지점을 회색으로 표시하면 다음과 같다. </p>

<table class="table table-bordered table-center-20 td-center">
	<tbody>
		<tr>
			<td>6</td>
			<td>8</td>
			<td class="bg-2468">2</td>
			<td>6</td>
			<td class="bg-2468">2</td>
		</tr>
		<tr>
			<td class="bg-2468">3</td>
			<td class="bg-2468">2</td>
			<td class="bg-2468">3</td>
			<td class="bg-2468">4</td>
			<td>6</td>
		</tr>
		<tr>
			<td>6</td>
			<td>7</td>
			<td class="bg-2468">3</td>
			<td class="bg-2468">3</td>
			<td class="bg-2468">2</td>
		</tr>
		<tr>
			<td>7</td>
			<td class="bg-2468">2</td>
			<td>5</td>
			<td class="bg-2468">3</td>
			<td>6</td>
		</tr>
		<tr>
			<td>8</td>
			<td>9</td>
			<td>5</td>
			<td class="bg-2468">2</td>
			<td>7</td>
		</tr>
	</tbody>
</table>

<p>물에 잠기지 않는 안전한 영역이라 함은 물에 잠기지 않는 지점들이 위, 아래, 오른쪽 혹은 왼쪽으로 인접해 있으며 그 크기가 최대인 영역을 말한다. 위의 경우에서 물에 잠기지 않는 안전한 영역은 5개가 된다(꼭짓점으로만 붙어 있는 두 지점은 인접하지 않는다고 취급한다). </p>

<p>또한 위와 같은 지역에서 높이가 6이하인 지점을 모두 잠기게 만드는 많은 비가 내리면 물에 잠기지 않는 안전한 영역은 아래 그림에서와 같이 네 개가 됨을 확인할 수 있다. </p>

<table class="table table-bordered table-center-20 td-center">
	<tbody>
		<tr>
			<td class="bg-2468">6</td>
			<td>8</td>
			<td class="bg-2468">2</td>
			<td class="bg-2468">6</td>
			<td class="bg-2468">2</td>
		</tr>
		<tr>
			<td class="bg-2468">3</td>
			<td class="bg-2468">2</td>
			<td class="bg-2468">3</td>
			<td class="bg-2468">4</td>
			<td class="bg-2468">6</td>
		</tr>
		<tr>
			<td class="bg-2468">6</td>
			<td>7</td>
			<td class="bg-2468">3</td>
			<td class="bg-2468">3</td>
			<td class="bg-2468">2</td>
		</tr>
		<tr>
			<td>7</td>
			<td class="bg-2468">2</td>
			<td class="bg-2468">5</td>
			<td class="bg-2468">3</td>
			<td class="bg-2468">6</td>
		</tr>
		<tr>
			<td>8</td>
			<td>9</td>
			<td class="bg-2468">5</td>
			<td class="bg-2468">2</td>
			<td>7</td>
		</tr>
	</tbody>
</table>

<p>이와 같이 장마철에 내리는 비의 양에 따라서 물에 잠기지 않는 안전한 영역의 개수는 다르게 된다. 위의 예와 같은 지역에서 내리는 비의 양에 따른 모든 경우를 다 조사해 보면 물에 잠기지 않는 안전한 영역의 개수 중에서 최대인 경우는 5임을 알 수 있다. </p>

<p>어떤 지역의 높이 정보가 주어졌을 때, 장마철에 물에 잠기지 않는 안전한 영역의 최대 개수를 계산하는 프로그램을 작성하시오. </p>

### 입력 

 <p>첫째 줄에는 어떤 지역을 나타내는 2차원 배열의 행과 열의 개수를 나타내는 수 N이 입력된다. N은 2 이상 100 이하의 정수이다. 둘째 줄부터 N개의 각 줄에는 2차원 배열의 첫 번째 행부터 N번째 행까지 순서대로 한 행씩 높이 정보가 입력된다. 각 줄에는 각 행의 첫 번째 열부터 N번째 열까지 N개의 높이 정보를 나타내는 자연수가 빈 칸을 사이에 두고 입력된다. 높이는 1이상 100 이하의 정수이다.</p>

### 출력 

 <p>첫째 줄에 장마철에 물에 잠기지 않는 안전한 영역의 최대 개수를 출력한다.</p>


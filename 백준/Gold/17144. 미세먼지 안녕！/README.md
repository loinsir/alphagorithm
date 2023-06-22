# [Gold IV] 미세먼지 안녕! - 17144 

[문제 링크](https://www.acmicpc.net/problem/17144) 

### 성능 요약

메모리: 79520 KB, 시간: 220 ms

### 분류

구현, 시뮬레이션

### 문제 설명

<p>미세먼지를 제거하기 위해 구사과는 공기청정기를 설치하려고 한다. 공기청정기의 성능을 테스트하기 위해 구사과는 집을 크기가 R×C인 격자판으로 나타냈고, 1×1 크기의 칸으로 나눴다. 구사과는 뛰어난 코딩 실력을 이용해 각 칸 (r, c)에 있는 미세먼지의 양을 실시간으로 모니터링하는 시스템을 개발했다. (r, c)는 r행 c열을 의미한다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/75d322ad-5a89-4301-b3a7-403fce0ff966/-/preview/" style="width: 335px; height: 300px;"></p>

<p>공기청정기는 항상 1번 열에 설치되어 있고, 크기는 두 행을 차지한다. 공기청정기가 설치되어 있지 않은 칸에는 미세먼지가 있고, (r, c)에 있는 미세먼지의 양은 A<sub>r,c</sub>이다.</p>

<p>1초 동안 아래 적힌 일이 순서대로 일어난다.</p>

<ol>
	<li>미세먼지가 확산된다. 확산은 미세먼지가 있는 모든 칸에서 동시에 일어난다.
	<ul>
		<li>(r, c)에 있는 미세먼지는 인접한 네 방향으로 확산된다.</li>
		<li>인접한 방향에 공기청정기가 있거나, 칸이 없으면 그 방향으로는 확산이 일어나지 않는다.</li>
		<li>확산되는 양은 A<sub>r,c</sub>/5이고 소수점은 버린다.</li>
		<li>(r, c)에 남은 미세먼지의 양은 A<sub>r,c</sub> - (A<sub>r,c</sub>/5)×(확산된 방향의 개수) 이다.</li>
	</ul>
	</li>
	<li>공기청정기가 작동한다.
	<ul>
		<li>공기청정기에서는 바람이 나온다.</li>
		<li>위쪽 공기청정기의 바람은 반시계방향으로 순환하고, 아래쪽 공기청정기의 바람은 시계방향으로 순환한다.</li>
		<li>바람이 불면 미세먼지가 바람의 방향대로 모두 한 칸씩 이동한다.</li>
		<li>공기청정기에서 부는 바람은 미세먼지가 없는 바람이고, 공기청정기로 들어간 미세먼지는 모두 정화된다.</li>
	</ul>
	</li>
</ol>

<p>다음은 확산의 예시이다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/7b0d9d57-1296-44cd-8951-4135d27f9446/-/preview/" style="width: 268px; height: 100px;"></p>

<p style="text-align: center;">왼쪽과 위쪽에 칸이 없기 때문에, 두 방향으로만 확산이 일어났다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/cebebfa9-0056-45f1-b705-75b035888085/-/preview/" style="width: 268px; height: 100px;"></p>

<p style="text-align: center;">인접한 네 방향으로 모두 확산이 일어난다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/1ed0d2e9-9767-4b94-bbde-0e1d6a2d52ff/-/preview/" style="width: 268px; height: 100px;"></p>

<p style="text-align: center;">공기청정기가 있는 칸으로는 확산이 일어나지 않는다.</p>

<p>공기청정기의 바람은 다음과 같은 방향으로 순환한다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/94466937-96c7-4f25-9804-530ebd554a59/-/preview/" style="width: 332px; height: 300px;"></p>

<p>방의 정보가 주어졌을 때, T초가 지난 후 구사과의 방에 남아있는 미세먼지의 양을 구해보자.</p>

### 입력 

 <p>첫째 줄에 R, C, T (6 ≤ R, C ≤ 50, 1 ≤ T ≤ 1,000) 가 주어진다.</p>

<p>둘째 줄부터 R개의 줄에 A<sub>r,c</sub> (-1 ≤ A<sub>r,c</sub> ≤ 1,000)가 주어진다. 공기청정기가 설치된 곳은 A<sub>r,c</sub>가 -1이고, 나머지 값은 미세먼지의 양이다. -1은 2번 위아래로 붙어져 있고, 가장 윗 행, 아랫 행과 두 칸이상 떨어져 있다.</p>

### 출력 

 <p>첫째 줄에 T초가 지난 후 구사과 방에 남아있는 미세먼지의 양을 출력한다.</p>


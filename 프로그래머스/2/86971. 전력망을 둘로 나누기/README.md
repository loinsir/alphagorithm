# [level 2] 전력망을 둘로 나누기 - 86971 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/86971) 

### 성능 요약

메모리: 16.6 MB, 시간: 14.11 ms

### 구분

코딩테스트 연습 > 완전탐색

### 채점결과

정확성: 100.0<br/>합계: 100.0 / 100.0

### 제출 일자

2023년 11월 2일 2:35:56

### 문제 설명

<p>n개의 송전탑이 전선을 통해 하나의 <a href="https://en.wikipedia.org/wiki/Tree_(data_structure)" target="_blank" rel="noopener">트리</a> 형태로 연결되어 있습니다. 당신은 이 전선들 중 하나를 끊어서 현재의 전력망 네트워크를 2개로 분할하려고 합니다. 이때, 두 전력망이 갖게 되는 송전탑의 개수를 최대한 비슷하게 맞추고자 합니다.</p>

<p>송전탑의 개수 n, 그리고 전선 정보 wires가 매개변수로 주어집니다. 전선들 중 하나를 끊어서 송전탑 개수가 가능한 비슷하도록 두 전력망으로 나누었을 때, 두 전력망이 가지고 있는 송전탑 개수의 차이(절대값)를 return 하도록 solution 함수를 완성해주세요.</p>

<hr>

<h5>제한사항</h5>

<ul>
<li>n은 2 이상 100 이하인 자연수입니다.</li>
<li>wires는 길이가 <code>n-1</code>인 정수형 2차원 배열입니다.

<ul>
<li>wires의 각 원소는 [v1, v2] 2개의 자연수로 이루어져 있으며, 이는 전력망의 v1번 송전탑과 v2번 송전탑이 전선으로 연결되어 있다는 것을 의미합니다.</li>
<li>1 ≤ v1 &lt; v2 ≤ n 입니다.</li>
<li>전력망 네트워크가 하나의 트리 형태가 아닌 경우는 입력으로 주어지지 않습니다.</li>
</ul></li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>n</th>
<th>wires</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>9</td>
<td><code>[[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]</code></td>
<td>3</td>
</tr>
<tr>
<td>4</td>
<td><code>[[1,2],[2,3],[3,4]]</code></td>
<td>0</td>
</tr>
<tr>
<td>7</td>
<td><code>[[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]]</code></td>
<td>1</td>
</tr>
</tbody>
      </table>
<hr>

<h5>입출력 예 설명</h5>

<p>입출력 예 #1</p>

<ul>
<li>다음 그림은 주어진 입력을 해결하는 방법 중 하나를 나타낸 것입니다.</li>
<li><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/5b8a0dcd-cba0-47ca-b5e3-d3bafc81f9d6/ex1.png" title="" alt="ex1.png"></li>
<li>4번과 7번을 연결하는 전선을 끊으면 두 전력망은 각 6개와 3개의 송전탑을 가지며, 이보다 더 비슷한 개수로 전력망을 나눌 수 없습니다.</li>
<li>또 다른 방법으로는 3번과 4번을 연결하는 전선을 끊어도 최선의 정답을 도출할 수 있습니다.</li>
</ul>

<p>입출력 예 #2</p>

<ul>
<li>다음 그림은 주어진 입력을 해결하는 방법을 나타낸 것입니다.</li>
<li><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/b28865e1-a18e-429d-ae7a-14e77e801539/ex2.png" title="" alt="ex2.png"></li>
<li>2번과 3번을 연결하는 전선을 끊으면 두 전력망이 모두 2개의 송전탑을 가지게 되며, 이 방법이 최선입니다.</li>
</ul>

<p>입출력 예 #3</p>

<ul>
<li>다음 그림은 주어진 입력을 해결하는 방법을 나타낸 것입니다.</li>
<li><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/0a7f21af-1e07-4015-8ad3-c06155c613b3/ex3.png" title="" alt="ex3.png"></li>
<li>3번과 7번을 연결하는 전선을 끊으면 두 전력망이 각각 4개와 3개의 송전탑을 가지게 되며, 이 방법이 최선입니다.</li>
</ul>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges
# [level 3] 순위 - 49191 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/49191) 

### 성능 요약

메모리: 17.5 MB, 시간: 17.90 ms

### 구분

코딩테스트 연습 > 그래프

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<p>n명의 권투선수가 권투 대회에 참여했고 각각 1번부터 n번까지 번호를 받았습니다. 권투 경기는 1대1 방식으로 진행이 되고, 만약 A 선수가 B 선수보다 실력이 좋다면 A 선수는 B 선수를 항상 이깁니다. 심판은 주어진 경기 결과를 가지고 선수들의 순위를 매기려 합니다. 하지만 몇몇 경기 결과를 분실하여 정확하게 순위를 매길 수 없습니다.</p>

<p>선수의 수 n, 경기 결과를 담은 2차원 배열 results가 매개변수로 주어질 때 정확하게 순위를 매길 수 있는 선수의 수를 return 하도록 solution 함수를 작성해주세요.</p>

<h5>제한사항</h5>

<ul>
<li>선수의 수는 1명 이상 100명 이하입니다.</li>
<li>경기 결과는 1개 이상 4,500개 이하입니다.</li>
<li>results 배열 각 행 [A, B]는 A 선수가 B 선수를 이겼다는 의미입니다.</li>
<li>모든 경기 결과에는 모순이 없습니다.</li>
</ul>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>n</th>
<th>results</th>
<th>return</th>
</tr>
</thead>
        <tbody><tr>
<td>5</td>
<td>[[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]</td>
<td>2</td>
</tr>
</tbody>
      </table>
<h5>입출력 예 설명</h5>

<p>2번 선수는 [1, 3, 4] 선수에게 패배했고 5번 선수에게 승리했기 때문에 4위입니다.<br>
5번 선수는 4위인 2번 선수에게 패배했기 때문에 5위입니다.</p>

<p><a href="http://contest.usaco.org/JAN08.htm" target="_blank" rel="noopener">출처</a></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
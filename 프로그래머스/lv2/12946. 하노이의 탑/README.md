# [level 2] 하노이의 탑 - 12946 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/12946) 

### 성능 요약

메모리: 32.3 MB, 시간: 4.51 ms

### 구분

코딩테스트 연습 > 연습문제

### 채점결과

Empty

### 문제 설명

<p>하노이 탑(Tower of Hanoi)은 퍼즐의 일종입니다. 세 개의 기둥과 이 기동에 꽂을 수 있는 크기가 다양한 원판들이 있고, 퍼즐을 시작하기 전에는 한 기둥에 원판들이 작은 것이 위에 있도록 순서대로 쌓여 있습니다. 게임의 목적은 다음 두 가지 조건을 만족시키면서, 한 기둥에 꽂힌 원판들을 그 순서 그대로 다른 기둥으로 옮겨서 다시 쌓는 것입니다.</p>

<ol>
<li>한 번에 하나의 원판만 옮길 수 있습니다.</li>
<li>큰 원판이 작은 원판 위에 있어서는 안됩니다.</li>
</ol>

<p>하노이 탑의 세 개의 기둥을 왼쪽 부터 1번, 2번, 3번이라고 하겠습니다. 1번에는 n개의 원판이 있고 이 n개의 원판을 3번 원판으로 최소 횟수로 옮기려고 합니다.</p>

<p>1번 기둥에 있는 원판의 개수 n이 매개변수로 주어질 때, n개의 원판을 3번 원판으로 최소로 옮기는 방법을 return하는 solution를 완성해주세요.</p>

<h5>제한사항</h5>

<ul>
<li>n은 15이하의 자연수 입니다.</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>n</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>2</td>
<td>[ [1,2], [1,3], [2,3] ]</td>
</tr>
</tbody>
      </table>
<h5>입출력 예 설명</h5>

<p>입출력 예 #1<br>
다음과 같이 옮길 수 있습니다.</p>

<p><img src="https://i.imgur.com/SWEqD08.png" title="" alt="Imgur"><br>
<img src="https://i.imgur.com/mrmOzV2.png" title="" alt="Imgur"><br>
<img src="https://i.imgur.com/Ent83gA.png" title="" alt="Imgur"><br>
<img src="https://i.imgur.com/osJFfhF.png" title="" alt="Imgur"></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
# [level 3] 숫자 게임 - 12987 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/12987) 

### 성능 요약

메모리: 64.5 MB, 시간: 61.55 ms

### 구분

코딩테스트 연습 > Summer／Winter Coding（～2018）

### 채점결과

Empty

### 문제 설명

<p>xx 회사의 2xN명의 사원들은 N명씩 두 팀으로 나눠 숫자 게임을 하려고 합니다. 두 개의 팀을 각각 A팀과 B팀이라고 하겠습니다. 숫자 게임의 규칙은 다음과 같습니다.</p>

<ul>
<li>먼저 모든 사원이 무작위로 자연수를 하나씩 부여받습니다.</li>
<li>각 사원은 딱 한 번씩 경기를 합니다.</li>
<li>각 경기당 A팀에서 한 사원이, B팀에서 한 사원이 나와 서로의 수를 공개합니다. 그때 숫자가 큰 쪽이 승리하게 되고, 승리한 사원이 속한 팀은 승점을 1점 얻게 됩니다.</li>
<li>만약 숫자가 같다면 누구도 승점을 얻지 않습니다.</li>
</ul>

<p>전체 사원들은 우선 무작위로 자연수를 하나씩 부여받았습니다. 그다음 A팀은 빠르게 출전순서를 정했고 자신들의 출전 순서를 B팀에게 공개해버렸습니다. B팀은 그것을 보고 자신들의 최종 승점을 가장 높이는 방법으로 팀원들의 출전 순서를 정했습니다. 이때의 B팀이 얻는 승점을 구해주세요.<br>
A 팀원들이 부여받은 수가 출전 순서대로 나열되어있는 배열 <code>A</code>와 i번째 원소가 B팀의 i번 팀원이 부여받은 수를 의미하는 배열 <code>B</code>가 주어질 때, B 팀원들이 얻을 수 있는 최대 승점을 return 하도록 solution 함수를 완성해주세요.</p>

<h5>제한사항</h5>

<ul>
<li><code>A</code>와 <code>B</code>의 길이는 같습니다.</li>
<li><code>A</code>와 <code>B</code>의 길이는 <code>1</code> 이상 <code>100,000</code> 이하입니다.</li>
<li><code>A</code>와 <code>B</code>의 각 원소는 <code>1</code> 이상 <code>1,000,000,000</code> 이하의 자연수입니다.</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>A</th>
<th>B</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>[5,1,3,7]</td>
<td>[2,2,6,8]</td>
<td>3</td>
</tr>
<tr>
<td>[2,2,2,2]</td>
<td>[1,1,1,1]</td>
<td>0</td>
</tr>
</tbody>
      </table>
<h5>입출력 예 설명</h5>

<p>입출력 예 #1<br>
<img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/0de59edf-76e1-4313-984a-4b2bd40911fb/number_game2_yt913p.png" title="" alt="number_game2_yt913p.png"><br>
A 팀은 숫자 5를 부여받은 팀원이 첫번째로 출전하고, 이어서 1,3,7을 부여받은 팀원들이 차례대로 출전합니다.<br>
B 팀원들을 4번, 2번, 3번, 1번의 순서대로 출전시킬 경우 팀원들이 부여받은 숫자들은 차례대로 8,2,6,2가 됩니다. 그러면, 첫 번째, 두 번째, 세 번째 경기에서 승리하여 3점을 얻게 되고, 이때가 최대의 승점입니다.</p>

<p>입출력 예 #2<br>
B 팀원들을 어떤 순서로 출전시켜도 B팀의 승점은 0점입니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
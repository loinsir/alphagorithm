# [level 3] N으로 표현 - 42895 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/42895) 

### 성능 요약

메모리: 16.1 MB, 시간: 0.08 ms

### 구분

코딩테스트 연습 > 동적계획법（Dynamic Programming）

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<p>아래와 같이 5와 사칙연산만으로 12를 표현할 수 있습니다.</p>

<p>12 = 5 + 5 + (5 / 5) + (5 / 5)<br>
12 = 55 / 5 + 5 / 5<br>
12 = (55 + 5) / 5</p>

<p>5를 사용한 횟수는 각각 6,5,4 입니다. 그리고 이중 가장 작은 경우는 4입니다.<br>
이처럼 숫자 N과 number가 주어질 때, N과 사칙연산만 사용해서 표현 할 수 있는 방법 중 N 사용횟수의 최솟값을 return 하도록 solution 함수를 작성하세요.</p>

<h5>제한사항</h5>

<ul>
<li>N은 1 이상 9 이하입니다.</li>
<li>number는 1 이상 32,000 이하입니다.</li>
<li>수식에는 괄호와 사칙연산만 가능하며 나누기 연산에서 나머지는 무시합니다.</li>
<li>최솟값이 8보다 크면 -1을 return 합니다.</li>
</ul>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>N</th>
<th>number</th>
<th>return</th>
</tr>
</thead>
        <tbody><tr>
<td>5</td>
<td>12</td>
<td>4</td>
</tr>
<tr>
<td>2</td>
<td>11</td>
<td>3</td>
</tr>
</tbody>
      </table>
<h5>입출력 예 설명</h5>

<p>예제 #1<br>
문제에 나온 예와 같습니다.</p>

<p>예제 #2<br>
<code>11 = 22 / 2</code>와 같이 2를 3번만 사용하여 표현할 수 있습니다.</p>

<p><a href="https://www.oi.edu.pl/old/php/show.php?ac=e181413&amp;module=show&amp;file=zadania/oi6/monocyfr" target="_blank" rel="noopener">출처</a></p>

<p>※ 공지 - 2020년 9월 3일 테스트케이스가 추가되었습니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
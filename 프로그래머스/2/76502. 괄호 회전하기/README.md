# [level 2] 괄호 회전하기 - 76502 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/76502) 

### 성능 요약

메모리: 16.5 MB, 시간: 0.06 ms

### 구분

코딩테스트 연습 > 월간 코드 챌린지 시즌2

### 채점결과

정확성: 100.0<br/>합계: 100.0 / 100.0

### 제출 일자

2023년 12월 0일 1:16:46

### 문제 설명

<p>다음 규칙을 지키는 문자열을 올바른 괄호 문자열이라고 정의합니다.</p>

<ul>
<li><code>()</code>, <code>[]</code>, <code>{}</code> 는 모두 올바른 괄호 문자열입니다.</li>
<li>만약 <code>A</code>가 올바른 괄호 문자열이라면, <code>(A)</code>, <code>[A]</code>, <code>{A}</code> 도 올바른 괄호 문자열입니다. 예를 들어, <code>[]</code> 가 올바른 괄호 문자열이므로, <code>([])</code> 도 올바른 괄호 문자열입니다.</li>
<li>만약 <code>A</code>, <code>B</code>가 올바른 괄호 문자열이라면, <code>AB</code> 도 올바른 괄호 문자열입니다. 예를 들어, <code>{}</code> 와 <code>([])</code> 가 올바른 괄호 문자열이므로, <code>{}([])</code> 도 올바른 괄호 문자열입니다.</li>
</ul>

<p>대괄호, 중괄호, 그리고 소괄호로 이루어진 문자열 <code>s</code>가 매개변수로 주어집니다. 이 <code>s</code>를 왼쪽으로 x (<em>0 ≤ x &lt; (<code>s</code>의 길이)</em>) 칸만큼 회전시켰을 때 <code>s</code>가 올바른 괄호 문자열이 되게 하는 x의 개수를 return 하도록 solution 함수를 완성해주세요.</p>

<hr>

<h5>제한사항</h5>

<ul>
<li>s의 길이는 1 이상 1,000 이하입니다.</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>s</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td><code>"[](){}"</code></td>
<td>3</td>
</tr>
<tr>
<td><code>"}]()[{"</code></td>
<td>2</td>
</tr>
<tr>
<td><code>"[)(]"</code></td>
<td>0</td>
</tr>
<tr>
<td><code>"}}}"</code></td>
<td>0</td>
</tr>
</tbody>
      </table>
<hr>

<h5>입출력 예 설명</h5>

<p><strong>입출력 예 #1</strong></p>

<ul>
<li>다음 표는 <code>"[](){}"</code> 를 회전시킨 모습을 나타낸 것입니다.</li>
</ul>
<table class="table">
        <thead><tr>
<th>x</th>
<th>s를 왼쪽으로 x칸만큼 회전</th>
<th>올바른 괄호 문자열?</th>
</tr>
</thead>
        <tbody><tr>
<td>0</td>
<td><code>"[](){}"</code></td>
<td>O</td>
</tr>
<tr>
<td>1</td>
<td><code>"](){}["</code></td>
<td>X</td>
</tr>
<tr>
<td>2</td>
<td><code>"(){}[]"</code></td>
<td>O</td>
</tr>
<tr>
<td>3</td>
<td><code>"){}[]("</code></td>
<td>X</td>
</tr>
<tr>
<td>4</td>
<td><code>"{}[]()"</code></td>
<td>O</td>
</tr>
<tr>
<td>5</td>
<td><code>"}[](){"</code></td>
<td>X</td>
</tr>
</tbody>
      </table>
<ul>
<li>올바른 괄호 문자열이 되는 x가 3개이므로, 3을 return 해야 합니다.</li>
</ul>

<p><strong>입출력 예 #2</strong></p>

<ul>
<li>다음 표는 <code>"}]()[{"</code> 를 회전시킨 모습을 나타낸 것입니다.</li>
</ul>
<table class="table">
        <thead><tr>
<th>x</th>
<th>s를 왼쪽으로 x칸만큼 회전</th>
<th>올바른 괄호 문자열?</th>
</tr>
</thead>
        <tbody><tr>
<td>0</td>
<td><code>"}]()[{"</code></td>
<td>X</td>
</tr>
<tr>
<td>1</td>
<td><code>"]()[{}"</code></td>
<td>X</td>
</tr>
<tr>
<td>2</td>
<td><code>"()[{}]"</code></td>
<td>O</td>
</tr>
<tr>
<td>3</td>
<td><code>")[{}]("</code></td>
<td>X</td>
</tr>
<tr>
<td>4</td>
<td><code>"[{}]()"</code></td>
<td>O</td>
</tr>
<tr>
<td>5</td>
<td><code>"{}]()["</code></td>
<td>X</td>
</tr>
</tbody>
      </table>
<ul>
<li>올바른 괄호 문자열이 되는 x가 2개이므로, 2를 return 해야 합니다.</li>
</ul>

<p><strong>입출력 예 #3</strong></p>

<ul>
<li>s를 어떻게 회전하더라도 올바른 괄호 문자열을 만들 수 없으므로, 0을 return 해야 합니다.</li>
</ul>

<p><strong>입출력 예 #4</strong></p>

<ul>
<li>s를 어떻게 회전하더라도 올바른 괄호 문자열을 만들 수 없으므로, 0을 return 해야 합니다.</li>
</ul>

<hr>

<p>※ 공지 - 2021년 4월 16일 테스트케이스가 추가되었습니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges
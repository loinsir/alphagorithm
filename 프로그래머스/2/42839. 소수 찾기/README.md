# [level 2] 소수 찾기 - 42839 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/42839) 

### 성능 요약

메모리: 16.3 MB, 시간: 0.51 ms

### 구분

코딩테스트 연습 > 완전탐색

### 채점결과

정확성: 100.0<br/>합계: 100.0 / 100.0

### 제출 일자

2023년 11월 5일 0:16:36

### 문제 설명

<p>한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.</p>

<p>각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.</p>

<h5>제한사항</h5>

<ul>
<li>numbers는 길이 1 이상 7 이하인 문자열입니다.</li>
<li>numbers는 0~9까지 숫자만으로 이루어져 있습니다.</li>
<li>"013"은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.</li>
</ul>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>numbers</th>
<th>return</th>
</tr>
</thead>
        <tbody><tr>
<td>"17"</td>
<td>3</td>
</tr>
<tr>
<td>"011"</td>
<td>2</td>
</tr>
</tbody>
      </table>
<h5>입출력 예 설명</h5>

<p>예제 #1<br>
[1, 7]으로는 소수 [7, 17, 71]를 만들 수 있습니다.</p>

<p>예제 #2<br>
[0, 1, 1]으로는 소수 [11, 101]를 만들 수 있습니다.</p>

<ul>
<li>11과 011은 같은 숫자로 취급합니다.</li>
</ul>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges
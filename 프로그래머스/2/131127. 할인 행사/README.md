# [level 2] 할인 행사 - 131127 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/131127) 

### 성능 요약

메모리: 16.4 MB, 시간: 0.13 ms

### 구분

코딩테스트 연습 > 연습문제

### 채점결과

정확성: 100.0<br/>합계: 100.0 / 100.0

### 제출 일자

2023년 11월 3일 23:51:27

### 문제 설명

<p>XYZ 마트는 일정한 금액을 지불하면 10일 동안 회원 자격을 부여합니다. XYZ 마트에서는 회원을 대상으로 매일 한 가지 제품을 할인하는 행사를 합니다. 할인하는 제품은 하루에 하나씩만 구매할 수 있습니다. 알뜰한 정현이는 자신이 원하는 제품과 수량이 할인하는 날짜와 10일 연속으로 일치할 경우에 맞춰서 회원가입을 하려 합니다.</p>

<p>예를 들어, 정현이가 원하는 제품이 바나나 3개, 사과 2개, 쌀 2개, 돼지고기 2개, 냄비 1개이며, XYZ 마트에서 15일간 회원을 대상으로 할인하는 제품이 날짜 순서대로 치킨, 사과, 사과, 바나나, 쌀, 사과, 돼지고기, 바나나, 돼지고기, 쌀, 냄비, 바나나, 사과, 바나나인 경우에 대해 알아봅시다. 첫째 날부터 열흘 간에는 냄비가 할인하지 않기 때문에 첫째 날에는 회원가입을 하지 않습니다. 둘째 날부터 열흘 간에는 바나나를 원하는 만큼 할인구매할 수 없기 때문에 둘째 날에도 회원가입을 하지 않습니다. 셋째 날, 넷째 날, 다섯째 날부터 각각 열흘은 원하는 제품과 수량이 일치하기 때문에 셋 중 하루에 회원가입을 하려 합니다.</p>

<p>정현이가 원하는 제품을 나타내는 문자열 배열 <code>want</code>와 정현이가 원하는 제품의 수량을 나타내는 정수 배열 <code>number</code>, XYZ 마트에서 할인하는 제품을 나타내는 문자열 배열 <code>discount</code>가 주어졌을 때, 회원등록시 정현이가 원하는 제품을 모두 할인 받을 수 있는 회원등록 날짜의 총 일수를 return 하는 solution 함수를 완성하시오. 가능한 날이 없으면 0을 return 합니다.</p>

<hr>

<h5>제한사항</h5>

<ul>
<li>1 ≤ <code>want</code>의 길이 = <code>number</code>의 길이 ≤ 10

<ul>
<li>1 ≤ <code>number</code>의 원소 ≤ 10</li>
<li><code>number[i]</code>는 <code>want[i]</code>의 수량을 의미하며, <code>number</code>의 원소의 합은 10입니다.</li>
</ul></li>
<li>10 ≤ <code>discount</code>의 길이 ≤ 100,000</li>
<li><code>want</code>와 <code>discount</code>의 원소들은 알파벳 소문자로 이루어진 문자열입니다.

<ul>
<li>1 ≤ <code>want</code>의 원소의 길이, <code>discount</code>의 원소의 길이 ≤ 12</li>
</ul></li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>want</th>
<th>number</th>
<th>discount</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>["banana", "apple", "rice", "pork", "pot"]</td>
<td>[3, 2, 2, 2, 1]</td>
<td>["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]</td>
<td>3</td>
</tr>
<tr>
<td>["apple"]</td>
<td>[10]</td>
<td>["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]</td>
<td>0</td>
</tr>
</tbody>
      </table>
<hr>

<h5>입출력 예 설명</h5>

<p><strong>입출력 예 #1</strong></p>

<ul>
<li>문제 예시와 같습니다.</li>
</ul>

<p><strong>입출력 예 #2</strong></p>

<ul>
<li>사과가 할인하는 날이 없으므로 0을 return 합니다.</li>
</ul>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges
# [level 2] 큰 수 만들기 - 42883 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/42883) 

### 성능 요약

메모리: 16.2 MB, 시간: 0.08 ms

### 구분

코딩테스트 연습 > 탐욕법（Greedy）

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<p>어떤 숫자에서 k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자를 구하려 합니다.</p>

<p>예를 들어, 숫자 1924에서 수 두 개를 제거하면 [19, 12, 14, 92, 94, 24] 를 만들 수 있습니다. 이 중 가장 큰 숫자는 94 입니다.</p>

<p>문자열 형식으로 숫자 number와 제거할 수의 개수 k가 solution 함수의 매개변수로 주어집니다. number에서 k 개의 수를 제거했을 때 만들 수 있는 수 중 가장 큰 숫자를 문자열 형태로 return 하도록 solution 함수를 완성하세요.</p>

<h5>제한 조건</h5>

<ul>
<li>number는 2자리 이상, 1,000,000자리 이하인 숫자입니다.</li>
<li>k는 1 이상 <code>number의 자릿수</code> 미만인 자연수입니다.</li>
</ul>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>number</th>
<th>k</th>
<th>return</th>
</tr>
</thead>
        <tbody><tr>
<td>"1924"</td>
<td>2</td>
<td>"94"</td>
</tr>
<tr>
<td>"1231234"</td>
<td>3</td>
<td>"3234"</td>
</tr>
<tr>
<td>"4177252841"</td>
<td>4</td>
<td>"775841"</td>
</tr>
</tbody>
      </table>
<p><a href="http://hsin.hr/coci/archive/2011_2012/contest4_tasks.pdf" target="_blank" rel="noopener">출처</a></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
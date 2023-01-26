# [level 1] [1차] 비밀지도 - 17681 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/17681) 

### 성능 요약

메모리: 16.5 MB, 시간: 0.08 ms

### 구분

코딩테스트 연습 > 2018 KAKAO BLIND RECRUITMENT

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<h2>비밀지도</h2>

<p>네오는 평소 프로도가 비상금을 숨겨놓는 장소를 알려줄 비밀지도를 손에 넣었다. 그런데 이 비밀지도는 숫자로 암호화되어 있어 위치를 확인하기 위해서는 암호를 해독해야 한다. 다행히 지도 암호를 해독할 방법을 적어놓은 메모도 함께 발견했다.</p>

<ol>
<li>지도는 한 변의 길이가 <code>n</code>인 정사각형 배열 형태로, 각 칸은 "공백"(" ") 또는 "벽"("#") 두 종류로 이루어져 있다.</li>
<li>전체 지도는 두 장의 지도를 겹쳐서 얻을 수 있다. 각각 "지도 1"과 "지도 2"라고 하자. 지도 1 또는 지도 2 중 어느 하나라도 벽인 부분은 전체 지도에서도 벽이다. 지도 1과 지도 2에서 모두 공백인 부분은 전체 지도에서도 공백이다.</li>
<li>"지도 1"과 "지도 2"는 각각 정수 배열로 암호화되어 있다.</li>
<li>암호화된 배열은 지도의 각 가로줄에서 벽 부분을 <code>1</code>, 공백 부분을 <code>0</code>으로 부호화했을 때 얻어지는 이진수에 해당하는 값의 배열이다.</li>
</ol>

<p><img src="http://t1.kakaocdn.net/welcome2018/secret8.png" title="Secret Map" alt="secret map"></p>

<p>네오가 프로도의 비상금을 손에 넣을 수 있도록, 비밀지도의 암호를 해독하는 작업을 도와줄 프로그램을 작성하라.</p>

<h3>입력 형식</h3>

<p>입력으로 지도의 한 변 크기 <code>n</code> 과 2개의 정수 배열 <code>arr1</code>, <code>arr2</code>가 들어온다.</p>

<ul>
<li>1 ≦ <code>n</code> ≦ 16</li>
<li><code>arr1</code>, <code>arr2</code>는 길이 <code>n</code>인 정수 배열로 주어진다.</li>
<li>정수 배열의 각 원소 <code>x</code>를 이진수로 변환했을 때의 길이는 <code>n</code> 이하이다. 즉, 0 ≦ <code>x</code> ≦ 2<sup>n</sup> - 1을 만족한다.</li>
</ul>

<h3>출력 형식</h3>

<p>원래의 비밀지도를 해독하여 <code>'#'</code>, <code>공백</code>으로 구성된 문자열 배열로 출력하라.</p>

<h3>입출력 예제</h3>
<table class="table">
        <thead><tr>
<th>매개변수</th>
<th>값</th>
</tr>
</thead>
        <tbody><tr>
<td>n</td>
<td>5</td>
</tr>
<tr>
<td>arr1</td>
<td>[9, 20, 28, 18, 11]</td>
</tr>
<tr>
<td>arr2</td>
<td>[30, 1, 21, 17, 28]</td>
</tr>
<tr>
<td>출력</td>
<td><code>["#####","# # #", "### #", "#  ##", "#####"]</code></td>
</tr>
</tbody>
      </table><table class="table">
        <thead><tr>
<th>매개변수</th>
<th>값</th>
</tr>
</thead>
        <tbody><tr>
<td>n</td>
<td>6</td>
</tr>
<tr>
<td>arr1</td>
<td>[46, 33, 33 ,22, 31, 50]</td>
</tr>
<tr>
<td>arr2</td>
<td>[27 ,56, 19, 14, 14, 10]</td>
</tr>
<tr>
<td>출력</td>
<td><code>["######", "###  #", "##  ##", " #### ", " #####", "### # "]</code></td>
</tr>
</tbody>
      </table>
<p><a href="http://tech.kakao.com/2017/09/27/kakao-blind-recruitment-round-1/" target="_blank" rel="noopener">해설 보러가기</a></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
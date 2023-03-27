# [level 2] [3차] n진수 게임 - 17687 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/17687) 

### 성능 요약

메모리: 16.3 MB, 시간: 5.84 ms

### 구분

코딩테스트 연습 > 2018 KAKAO BLIND RECRUITMENT

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<h2>N진수 게임</h2>

<p>튜브가 활동하는 코딩 동아리에서는 전통적으로 해오는 게임이 있다. 이 게임은 여러 사람이 둥글게 앉아서 숫자를 하나씩 차례대로 말하는 게임인데, 규칙은 다음과 같다.</p>

<ol>
<li>숫자를 0부터 시작해서 차례대로 말한다. 첫 번째 사람은 0, 두 번째 사람은 1, … 열 번째 사람은 9를 말한다.</li>
<li>10 이상의 숫자부터는 한 자리씩 끊어서 말한다. 즉 열한 번째 사람은 10의 첫 자리인 1, 열두 번째 사람은 둘째 자리인 0을 말한다.</li>
</ol>

<p>이렇게 게임을 진행할 경우,<br>
<code>0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, …</code><br>
순으로 숫자를 말하면 된다.</p>

<p>한편 코딩 동아리 일원들은 컴퓨터를 다루는 사람답게 이진수로 이 게임을 진행하기도 하는데, 이 경우에는<br>
<code>0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, …</code><br>
순으로 숫자를 말하면 된다.</p>

<p>이진수로 진행하는 게임에 익숙해져 질려가던 사람들은 좀 더 난이도를 높이기 위해 이진법에서 십육진법까지 모든 진법으로 게임을 진행해보기로 했다. 숫자 게임이 익숙하지 않은 튜브는 게임에 져서 벌칙을 받는 굴욕을 피하기 위해, 자신이 말해야 하는 숫자를 스마트폰에 미리 출력해주는 프로그램을 만들려고 한다. 튜브의 프로그램을 구현하라.</p>

<h3>입력 형식</h3>

<p>진법 <code>n</code>,  미리 구할 숫자의 갯수 <code>t</code>, 게임에 참가하는 인원 <code>m</code>, 튜브의 순서 <code>p</code> 가 주어진다.</p>

<ul>
<li>2 ≦ <code>n</code> ≦ 16</li>
<li>0 ＜ <code>t</code> ≦ 1000</li>
<li>2 ≦ <code>m</code> ≦ 100</li>
<li>1 ≦ <code>p</code> ≦ <code>m</code></li>
</ul>

<h3>출력 형식</h3>

<p>튜브가 말해야 하는 숫자 <code>t</code>개를 공백 없이 차례대로 나타낸 문자열. 단, <code>10</code>~<code>15</code>는 각각 대문자 <code>A</code>~<code>F</code>로 출력한다.</p>

<h3>입출력 예제</h3>
<table class="table">
        <thead><tr>
<th>n</th>
<th>t</th>
<th>m</th>
<th>p</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>2</td>
<td>4</td>
<td>2</td>
<td>1</td>
<td>"0111"</td>
</tr>
<tr>
<td>16</td>
<td>16</td>
<td>2</td>
<td>1</td>
<td>"02468ACE11111111"</td>
</tr>
<tr>
<td>16</td>
<td>16</td>
<td>2</td>
<td>2</td>
<td>"13579BDF01234567"</td>
</tr>
</tbody>
      </table>
<p><a href="http://tech.kakao.com/2017/11/14/kakao-blind-recruitment-round-3/" target="_blank" rel="noopener">해설 보러가기</a></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
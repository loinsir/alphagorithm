# [level 1] 신규 아이디 추천 - 72410 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/72410) 

### 성능 요약

메모리: 16.5 MB, 시간: 3.30 ms

### 구분

코딩테스트 연습 > 2021 KAKAO BLIND RECRUITMENT

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<p>카카오에 입사한 신입 개발자 <code>네오</code>는 "카카오계정개발팀"에 배치되어, 카카오 서비스에 가입하는 유저들의 아이디를 생성하는 업무를 담당하게 되었습니다. "네오"에게 주어진 첫 업무는 새로 가입하는 유저들이 카카오 아이디 규칙에 맞지 않는 아이디를 입력했을 때, 입력된 아이디와 유사하면서 규칙에 맞는 아이디를 추천해주는 프로그램을 개발하는 것입니다.<br>
다음은 카카오 아이디의 규칙입니다.</p>

<ul>
<li>아이디의 길이는 3자 이상 15자 이하여야 합니다.</li>
<li>아이디는 알파벳 소문자, 숫자, 빼기(<code>-</code>), 밑줄(<code>_</code>), 마침표(<code>.</code>) 문자만 사용할 수 있습니다.</li>
<li>단, 마침표(<code>.</code>)는 처음과 끝에 사용할 수 없으며 또한 연속으로 사용할 수 없습니다.</li>
</ul>

<p>"네오"는 다음과 같이 7단계의 순차적인 처리 과정을 통해 신규 유저가 입력한 아이디가 카카오 아이디 규칙에 맞는 지 검사하고 규칙에 맞지 않은 경우 규칙에 맞는 새로운 아이디를 추천해 주려고 합니다.<br>
신규 유저가 입력한 아이디가 <code>new_id</code> 라고 한다면,</p>
<div class="highlight"><pre class="codehilite"><code>1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
     만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
</code></pre></div>
<hr>

<p>예를 들어, new_id 값이 "...!@BaT#*..y.abcdefghijklm" 라면, 위 7단계를 거치고 나면 new_id는 아래와 같이 변경됩니다.</p>

<p>1단계 대문자 'B'와 'T'가 소문자 'b'와 't'로 바뀌었습니다.<br>
<code>"...!@BaT#*..y.abcdefghijklm"</code> → <code>"...!@bat#*..y.abcdefghijklm"</code></p>

<p>2단계 '!', '@', '#', '*' 문자가 제거되었습니다.<br>
<code>"...!@bat#*..y.abcdefghijklm"</code> → <code>"...bat..y.abcdefghijklm"</code></p>

<p>3단계 '...'와 '..' 가 '.'로 바뀌었습니다.<br>
<code>"...bat..y.abcdefghijklm"</code> → <code>".bat.y.abcdefghijklm"</code></p>

<p>4단계 아이디의 처음에 위치한 '.'가 제거되었습니다.<br>
<code>".bat.y.abcdefghijklm"</code> → <code>"bat.y.abcdefghijklm"</code></p>

<p>5단계 아이디가 빈 문자열이 아니므로 변화가 없습니다.<br>
<code>"bat.y.abcdefghijklm"</code> → <code>"bat.y.abcdefghijklm"</code></p>

<p>6단계 아이디의 길이가 16자 이상이므로, 처음 15자를 제외한 나머지 문자들이 제거되었습니다.<br>
<code>"bat.y.abcdefghijklm"</code> → <code>"bat.y.abcdefghi"</code></p>

<p>7단계 아이디의 길이가 2자 이하가 아니므로 변화가 없습니다.<br>
<code>"bat.y.abcdefghi"</code> → <code>"bat.y.abcdefghi"</code></p>

<p>따라서 신규 유저가 입력한 new_id가 "...!@BaT#*..y.abcdefghijklm"일 때, 네오의 프로그램이 추천하는 새로운 아이디는 "bat.y.abcdefghi" 입니다.</p>

<hr>

<h4><strong>[문제]</strong></h4>

<p>신규 유저가 입력한 아이디를 나타내는 new_id가 매개변수로 주어질 때, "네오"가 설계한 7단계의 처리 과정을 거친 후의 추천 아이디를 return 하도록 solution 함수를 완성해 주세요.</p>

<h4><strong>[제한사항]</strong></h4>

<p>new_id는 길이 1 이상 1,000 이하인 문자열입니다.<br>
new_id는 알파벳 대문자, 알파벳 소문자, 숫자, 특수문자로 구성되어 있습니다.<br>
new_id에 나타날 수 있는 특수문자는 <code>-_.~!@#$%^&amp;*()=+[{]}:?,&lt;&gt;/</code> 로 한정됩니다.</p>

<hr>

<h5><strong>[입출력 예]</strong></h5>
<table class="table">
        <thead><tr>
<th>no</th>
<th>new_id</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>예1</td>
<td><code>"...!@BaT#*..y.abcdefghijklm"</code></td>
<td><code>"bat.y.abcdefghi"</code></td>
</tr>
<tr>
<td>예2</td>
<td><code>"z-+.^."</code></td>
<td><code>"z--"</code></td>
</tr>
<tr>
<td>예3</td>
<td><code>"=.="</code></td>
<td><code>"aaa"</code></td>
</tr>
<tr>
<td>예4</td>
<td><code>"123_.def"</code></td>
<td><code>"123_.def"</code></td>
</tr>
<tr>
<td>예5</td>
<td><code>"abcdefghijklmn.p"</code></td>
<td><code>"abcdefghijklmn"</code></td>
</tr>
</tbody>
      </table>
<h5><strong>입출력 예에 대한 설명</strong></h5>

<hr>

<p><strong>입출력 예 #1</strong><br>
문제의 예시와 같습니다.</p>

<p><strong>입출력 예 #2</strong><br>
7단계를 거치는 동안 new_id가 변화하는 과정은 아래와 같습니다.</p>

<p>1단계 변화 없습니다.<br>
2단계 <code>"z-+.^."</code> → <code>"z-.."</code><br>
3단계 <code>"z-.."</code> → <code>"z-."</code><br>
4단계 <code>"z-."</code> → <code>"z-"</code><br>
5단계 변화 없습니다.<br>
6단계 변화 없습니다.<br>
7단계 <code>"z-"</code> → <code>"z--"</code></p>

<p><strong>입출력 예 #3</strong><br>
7단계를 거치는 동안 new_id가 변화하는 과정은 아래와 같습니다.</p>

<p>1단계 변화 없습니다.<br>
2단계 <code>"=.="</code> → <code>"."</code><br>
3단계 변화 없습니다.<br>
4단계 <code>"."</code> → <code>""</code> (new_id가 빈 문자열이 되었습니다.)<br>
5단계 <code>""</code> → <code>"a"</code><br>
6단계 변화 없습니다.<br>
7단계 <code>"a"</code> → <code>"aaa"</code></p>

<p><strong>입출력 예 #4</strong><br>
1단계에서 7단계까지 거치는 동안 new_id("123_.def")는 변하지 않습니다. 즉, new_id가 처음부터 카카오의 아이디 규칙에 맞습니다.</p>

<p><strong>입출력 예 #5</strong><br>
1단계 변화 없습니다.<br>
2단계 변화 없습니다.<br>
3단계 변화 없습니다.<br>
4단계 변화 없습니다.<br>
5단계 변화 없습니다.<br>
6단계 <code>"abcdefghijklmn.p"</code> → <code>"abcdefghijklmn."</code> → <code>"abcdefghijklmn"</code><br>
7단계 변화 없습니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
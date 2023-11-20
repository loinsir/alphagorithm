# [level 2] [3차] 파일명 정렬 - 17686 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/17686) 

### 성능 요약

메모리: 16.8 MB, 시간: 101.56 ms

### 구분

코딩테스트 연습 > 2018 KAKAO BLIND RECRUITMENT

### 채점결과

정확성: 100.0<br/>합계: 100.0 / 100.0

### 제출 일자

2023년 11월 1일 23:46:30

### 문제 설명

<h2>파일명 정렬</h2>

<p>세 차례의 코딩 테스트와 두 차례의 면접이라는 기나긴 블라인드 공채를 무사히 통과해 카카오에 입사한 무지는 파일 저장소 서버 관리를 맡게 되었다.</p>

<p>저장소 서버에는 프로그램의 과거 버전을 모두 담고 있어, 이름 순으로 정렬된 파일 목록은 보기가 불편했다. 파일을 이름 순으로 정렬하면 나중에 만들어진 ver-10.zip이 ver-9.zip보다 먼저 표시되기 때문이다.</p>

<p>버전 번호 외에도 숫자가 포함된 파일 목록은 여러 면에서 관리하기 불편했다. 예컨대 파일 목록이 ["img12.png", "img10.png", "img2.png", "img1.png"]일 경우, 일반적인 정렬은 ["img1.png", "img10.png", "img12.png", "img2.png"] 순이 되지만, 숫자 순으로 정렬된 ["img1.png", "img2.png", "img10.png", img12.png"] 순이 훨씬 자연스럽다.</p>

<p>무지는 단순한 문자 코드 순이 아닌, 파일명에 포함된 숫자를 반영한 정렬 기능을 저장소 관리 프로그램에 구현하기로 했다.</p>

<p>소스 파일 저장소에 저장된 파일명은 100 글자 이내로, 영문 대소문자, 숫자, 공백(" "), 마침표("."), 빼기 부호("-")만으로 이루어져 있다. 파일명은 영문자로 시작하며, 숫자를 하나 이상 포함하고 있다.</p>

<p>파일명은 크게 HEAD, NUMBER, TAIL의 세 부분으로 구성된다.</p>

<ul>
<li>HEAD는 숫자가 아닌 문자로 이루어져 있으며, 최소한 한 글자 이상이다. </li>
<li>NUMBER는 한 글자에서 최대 다섯 글자 사이의 연속된 숫자로 이루어져 있으며, 앞쪽에 0이 올 수 있다. <code>0</code>부터 <code>99999</code> 사이의 숫자로, <code>00000</code>이나 <code>0101</code> 등도 가능하다.</li>
<li>TAIL은 그 나머지 부분으로, 여기에는 숫자가 다시 나타날 수도 있으며, 아무 글자도 없을 수 있다.</li>
</ul>
<table class="table">
        <thead><tr>
<th>파일명</th>
<th>HEAD</th>
<th>NUMBER</th>
<th>TAIL</th>
</tr>
</thead>
        <tbody><tr>
<td><code>foo9.txt</code></td>
<td><code>foo</code></td>
<td><code>9</code></td>
<td><code>.txt</code></td>
</tr>
<tr>
<td><code>foo010bar020.zip</code></td>
<td><code>foo</code></td>
<td><code>010</code></td>
<td><code>bar020.zip</code></td>
</tr>
<tr>
<td><code>F-15</code></td>
<td><code>F-</code></td>
<td><code>15</code></td>
<td>(빈 문자열)</td>
</tr>
</tbody>
      </table>
<p>파일명을 세 부분으로 나눈 후, 다음 기준에 따라 파일명을 정렬한다.</p>

<ul>
<li>파일명은 우선 HEAD 부분을 기준으로 사전 순으로 정렬한다. 이때, 문자열 비교 시 대소문자 구분을 하지 않는다. <code>MUZI</code>와 <code>muzi</code>, <code>MuZi</code>는 정렬 시에 같은 순서로 취급된다.</li>
<li>파일명의 HEAD 부분이 대소문자 차이 외에는 같을 경우, NUMBER의 숫자 순으로 정렬한다. 9 &lt; 10 &lt; 0011 &lt; 012 &lt; 13 &lt; 014 순으로 정렬된다. 숫자 앞의 0은 무시되며, 012와 12는 정렬 시에 같은 같은 값으로 처리된다.</li>
<li>두 파일의 HEAD 부분과, NUMBER의 숫자도 같을 경우, 원래 입력에 주어진 순서를 유지한다. <code>MUZI01.zip</code>과 <code>muzi1.png</code>가 입력으로 들어오면, 정렬 후에도 입력 시 주어진 두 파일의 순서가 바뀌어서는 안 된다.</li>
</ul>

<p>무지를 도와 파일명 정렬 프로그램을 구현하라.</p>

<h3>입력 형식</h3>

<p>입력으로 배열 <code>files</code>가 주어진다.</p>

<ul>
<li><code>files</code>는 1000 개 이하의 파일명을 포함하는 문자열 배열이다.</li>
<li>각 파일명은 100 글자 이하 길이로, 영문 대소문자, 숫자, 공백(" "), 마침표("."), 빼기 부호("-")만으로 이루어져 있다. 파일명은 영문자로 시작하며, 숫자를 하나 이상 포함하고 있다.</li>
<li>중복된 파일명은 없으나, 대소문자나 숫자 앞부분의 0 차이가 있는 경우는 함께 주어질 수 있다. (<code>muzi1.txt</code>, <code>MUZI1.txt</code>, <code>muzi001.txt</code>, <code>muzi1.TXT</code>는 함께 입력으로 주어질 수 있다.)</li>
</ul>

<h3>출력 형식</h3>

<p>위 기준에 따라 정렬된 배열을 출력한다.</p>

<h3>입출력 예제</h3>

<p>입력: ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]<br>
출력: ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]</p>

<p>입력: ["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]<br>
출력: ["A-10 Thunderbolt II", "B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"]</p>

<p><a href="http://tech.kakao.com/2017/11/14/kakao-blind-recruitment-round-3/" target="_blank" rel="noopener">해설 보러가기</a></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges
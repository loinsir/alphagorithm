# [level 2] [1차] 캐시 - 17680 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/17680) 

### 성능 요약

메모리: 80.1 MB, 시간: 5.24 ms

### 구분

코딩테스트 연습 > 2018 KAKAO BLIND RECRUITMENT

### 채점결과

Empty

### 문제 설명

<h2>캐시</h2>

<p>지도개발팀에서 근무하는 제이지는 지도에서 도시 이름을 검색하면 해당 도시와 관련된 맛집 게시물들을 데이터베이스에서 읽어 보여주는 서비스를 개발하고 있다.<br>
이 프로그램의 테스팅 업무를 담당하고 있는 어피치는 서비스를 오픈하기 전 각 로직에 대한 성능 측정을 수행하였는데, 제이지가 작성한 부분 중 데이터베이스에서 게시물을 가져오는 부분의 실행시간이 너무 오래 걸린다는 것을 알게 되었다.<br>
어피치는 제이지에게 해당 로직을 개선하라고 닦달하기 시작하였고, 제이지는 DB 캐시를 적용하여 성능 개선을 시도하고 있지만 캐시 크기를 얼마로 해야 효율적인지 몰라 난감한 상황이다.</p>

<p>어피치에게 시달리는 제이지를 도와, DB 캐시를 적용할 때 캐시 크기에 따른 실행시간 측정 프로그램을 작성하시오.</p>

<h3>입력 형식</h3>

<ul>
<li>캐시 크기(<code>cacheSize</code>)와 도시이름 배열(<code>cities</code>)을 입력받는다.</li>
<li><code>cacheSize</code>는 정수이며, 범위는 0 ≦ <code>cacheSize</code> ≦ 30 이다.</li>
<li><code>cities</code>는 도시 이름으로 이뤄진 문자열 배열로, 최대 도시 수는 100,000개이다.</li>
<li>각 도시 이름은 공백, 숫자, 특수문자 등이 없는 영문자로 구성되며, 대소문자 구분을 하지 않는다. 도시 이름은 최대 20자로 이루어져 있다.</li>
</ul>

<h3>출력 형식</h3>

<ul>
<li>입력된 도시이름 배열을 순서대로 처리할 때, "총 실행시간"을 출력한다.</li>
</ul>

<h3>조건</h3>

<ul>
<li>캐시 교체 알고리즘은 <code>LRU</code>(Least Recently Used)를 사용한다.</li>
<li><code>cache hit</code>일 경우 실행시간은 <code>1</code>이다.</li>
<li><code>cache miss</code>일 경우 실행시간은 <code>5</code>이다.</li>
</ul>

<h3>입출력 예제</h3>
<table class="table">
        <thead><tr>
<th>캐시크기(cacheSize)</th>
<th>도시이름(cities)</th>
<th>실행시간</th>
</tr>
</thead>
        <tbody><tr>
<td>3</td>
<td>["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]</td>
<td>50</td>
</tr>
<tr>
<td>3</td>
<td>["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]</td>
<td>21</td>
</tr>
<tr>
<td>2</td>
<td>["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]</td>
<td>60</td>
</tr>
<tr>
<td>5</td>
<td>["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]</td>
<td>52</td>
</tr>
<tr>
<td>2</td>
<td>["Jeju", "Pangyo", "NewYork", "newyork"]</td>
<td>16</td>
</tr>
<tr>
<td>0</td>
<td>["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]</td>
<td>25</td>
</tr>
</tbody>
      </table>
<p><a href="http://tech.kakao.com/2017/09/27/kakao-blind-recruitment-round-1/" target="_blank" rel="noopener">해설 보러가기</a></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
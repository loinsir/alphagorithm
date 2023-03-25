# [level 2] [3차] 압축 - 17684 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/17684) 

### 성능 요약

메모리: 16.4 MB, 시간: 0.44 ms

### 구분

코딩테스트 연습 > 2018 KAKAO BLIND RECRUITMENT

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<h2>압축</h2>

<p>신입사원 어피치는 카카오톡으로 전송되는 메시지를 압축하여 전송 효율을 높이는 업무를 맡게 되었다. 메시지를 압축하더라도 전달되는 정보가 바뀌어서는 안 되므로, 압축 전의 정보를 완벽하게 복원 가능한 무손실 압축 알고리즘을 구현하기로 했다.</p>

<p>어피치는 여러 압축 알고리즘 중에서 성능이 좋고 구현이 간단한 <strong>LZW</strong>(Lempel–Ziv–Welch) 압축을 구현하기로 했다. LZW 압축은 1983년 발표된 알고리즘으로, 이미지 파일 포맷인 GIF 등 다양한 응용에서 사용되었다.</p>

<p>LZW&nbsp;압축은 다음 과정을 거친다.</p>

<ol>
<li>길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.</li>
<li>사전에서 현재 입력과 일치하는 가장 긴 문자열 <code>w</code>를 찾는다.</li>
<li><code>w</code>에 해당하는 사전의 색인 번호를 출력하고, 입력에서 <code>w</code>를 제거한다.</li>
<li>입력에서 처리되지 않은 다음 글자가 남아있다면(<code>c</code>), <code>w+c</code>에 해당하는 단어를 사전에 등록한다.</li>
<li>단계 2로 돌아간다.</li>
</ol>

<p>압축 알고리즘이 영문 대문자만 처리한다고 할 때, 사전은 다음과 같이 초기화된다. 사전의 색인 번호는 정수값으로 주어지며, 1부터 시작한다고 하자.</p>
<table class="table">
        <thead><tr>
<th>색인 번호</th>
<th>1</th>
<th>2</th>
<th>3</th>
<th>...</th>
<th>24</th>
<th>25</th>
<th>26</th>
</tr>
</thead>
        <tbody><tr>
<td>단어</td>
<td>A</td>
<td>B</td>
<td>C</td>
<td>...</td>
<td>X</td>
<td>Y</td>
<td>Z</td>
</tr>
</tbody>
      </table>
<p>예를 들어 입력으로 <code>KAKAO</code>가 들어온다고 하자.</p>

<ol>
<li>현재 사전에는 <code>KAKAO</code>의 첫 글자 <code>K</code>는 등록되어 있으나, 두 번째 글자까지인 <code>KA</code>는 없으므로, 첫 글자 <code>K</code>에 해당하는 색인 번호 11을 출력하고, 다음 글자인 <code>A</code>를 포함한 <code>KA</code>를 사전에 27 번째로 등록한다.</li>
<li>두 번째 글자 <code>A</code>는 사전에 있으나, 세 번째 글자까지인 <code>AK</code>는 사전에 없으므로, <code>A</code>의  색인 번호 1을 출력하고, <code>AK</code>를 사전에 28 번째로 등록한다.</li>
<li>세 번째 글자에서 시작하는 <code>KA</code>가 사전에 있으므로, <code>KA</code>에 해당하는 색인 번호 27을 출력하고, 다음 글자 <code>O</code>를 포함한 <code>KAO</code>를 29 번째로 등록한다.</li>
<li>마지막으로 처리되지 않은 글자 <code>O</code>에 해당하는 색인 번호 15를 출력한다.</li>
</ol>
<table class="table">
        <thead><tr>
<th>현재 입력(w)</th>
<th>다음 글자(c)</th>
<th>출력</th>
<th>사전 추가(w+c)</th>
</tr>
</thead>
        <tbody><tr>
<td>K</td>
<td>A</td>
<td>11</td>
<td>27: KA</td>
</tr>
<tr>
<td>A</td>
<td>K</td>
<td>1</td>
<td>28: AK</td>
</tr>
<tr>
<td>KA</td>
<td>O</td>
<td>27</td>
<td>29: KAO</td>
</tr>
<tr>
<td>O</td>
<td></td>
<td>15</td>
<td></td>
</tr>
</tbody>
      </table>
<p>이 과정을 거쳐 다섯 글자의 문장 <code>KAKAO</code>가 4개의 색인 번호 [11, 1, 27, 15]로 압축된다.</p>

<p>입력으로 <code>TOBEORNOTTOBEORTOBEORNOT</code>가 들어오면 다음과 같이 압축이 진행된다.</p>
<table class="table">
        <thead><tr>
<th>현재 입력(w)</th>
<th>다음 글자(c)</th>
<th>출력</th>
<th>사전 추가(w+c)</th>
</tr>
</thead>
        <tbody><tr>
<td>T</td>
<td>O</td>
<td>20</td>
<td>27: TO</td>
</tr>
<tr>
<td>O</td>
<td>B</td>
<td>15</td>
<td>28: OB</td>
</tr>
<tr>
<td>B</td>
<td>E</td>
<td>2</td>
<td>29: BE</td>
</tr>
<tr>
<td>E</td>
<td>O</td>
<td>5</td>
<td>30: EO</td>
</tr>
<tr>
<td>O</td>
<td>R</td>
<td>15</td>
<td>31: OR</td>
</tr>
<tr>
<td>R</td>
<td>N</td>
<td>18</td>
<td>32: RN</td>
</tr>
<tr>
<td>N</td>
<td>O</td>
<td>14</td>
<td>33: NO</td>
</tr>
<tr>
<td>O</td>
<td>T</td>
<td>15</td>
<td>34: OT</td>
</tr>
<tr>
<td>T</td>
<td>T</td>
<td>20</td>
<td>35: TT</td>
</tr>
<tr>
<td>TO</td>
<td>B</td>
<td>27</td>
<td>36: TOB</td>
</tr>
<tr>
<td>BE</td>
<td>O</td>
<td>29</td>
<td>37: BEO</td>
</tr>
<tr>
<td>OR</td>
<td>T</td>
<td>31</td>
<td>38: ORT</td>
</tr>
<tr>
<td>TOB</td>
<td>E</td>
<td>36</td>
<td>39: TOBE</td>
</tr>
<tr>
<td>EO</td>
<td>R</td>
<td>30</td>
<td>40: EOR</td>
</tr>
<tr>
<td>RN</td>
<td>O</td>
<td>32</td>
<td>41: RNO</td>
</tr>
<tr>
<td>OT</td>
<td></td>
<td>34</td>
<td></td>
</tr>
</tbody>
      </table>
<h3>입력 형식</h3>

<p>입력으로 영문 대문자로만 이뤄진 문자열 <code>msg</code>가 주어진다. <code>msg</code>의 길이는 1 글자 이상, 1000 글자 이하이다.</p>

<h3>출력 형식</h3>

<p>주어진 문자열을 압축한 후의 사전 색인 번호를 배열로 출력하라.</p>

<h3>입출력 예제</h3>
<table class="table">
        <thead><tr>
<th>msg</th>
<th>answer</th>
</tr>
</thead>
        <tbody><tr>
<td><code>KAKAO</code></td>
<td>[11, 1, 27, 15]</td>
</tr>
<tr>
<td><code>TOBEORNOTTOBEORTOBEORNOT</code></td>
<td>[20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]</td>
</tr>
<tr>
<td><code>ABABABABABABABAB</code></td>
<td>[1, 2, 27, 29, 28, 31, 30]</td>
</tr>
</tbody>
      </table>
<p><a href="http://tech.kakao.com/2017/11/14/kakao-blind-recruitment-round-3/" target="_blank" rel="noopener">해설 보러가기</a></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
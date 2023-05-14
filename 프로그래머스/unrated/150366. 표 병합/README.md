# [unrated] 표 병합 - 150366 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/150366) 

### 성능 요약

메모리: 16.8 MB, 시간: 103.05 ms

### 구분

코딩테스트 연습 > 2023 KAKAO BLIND RECRUITMENT

### 채점결과

Empty

### 문제 설명

<p>당신은 표 편집 프로그램을 작성하고 있습니다. <br>
표의 크기는 50 × 50으로 고정되어있고 초기에 모든 셀은 비어 있습니다. <br>
각 셀은 문자열 값을 가질 수 있고, 다른 셀과 병합될 수 있습니다.<br><br>
위에서 <code>r</code>번째, 왼쪽에서 <code>c</code>번째 위치를 (<code>r</code>, <code>c</code>)라고 표현할 때, 당신은 다음 명령어들에 대한 기능을 구현하려고 합니다.  </p>

<ol>
<li> <code>"UPDATE r c value"</code>

<ul>
<li>(<code>r</code>, <code>c</code>) 위치의 셀을 선택합니다.</li>
<li>선택한 셀의 값을 <code>value</code>로 바꿉니다.</li>
</ul></li>
<li> <code>"UPDATE value1 value2"</code>

<ul>
<li><code>value1</code>을 값으로 가지고 있는 모든 셀을 선택합니다.</li>
<li>선택한 셀의 값을 <code>value2</code>로 바꿉니다.</li>
</ul></li>
<li> <code>"MERGE r1 c1 r2 c2"</code><br>

<ul>
<li>(<code>r1</code>, <code>c1</code>) 위치의 셀과 (<code>r2</code>, <code>c2</code>) 위치의 셀을 선택하여 병합합니다.</li>
<li>선택한 두 위치의 셀이 같은 셀일 경우 무시합니다.</li>
<li>선택한 두 셀은 서로 인접하지 않을 수도 있습니다. 이 경우 (<code>r1</code>, <code>c1</code>) 위치의 셀과 (<code>r2</code>, <code>c2</code>) 위치의 셀만 영향을 받으며, 그 사이에 위치한 셀들은 영향을 받지 않습니다.</li>
<li>두 셀 중 한 셀이 값을 가지고 있을 경우 병합된 셀은 그 값을 가지게 됩니다.</li>
<li>두 셀 모두 값을 가지고 있을 경우 병합된 셀은 (<code>r1</code>, <code>c1</code>) 위치의 셀 값을 가지게 됩니다.</li>
<li>이후 (<code>r1</code>, <code>c1</code>) 와 (<code>r2</code>, <code>c2</code>) 중 어느 위치를 선택하여도 병합된 셀로 접근합니다.</li>
</ul></li>
<li> <code>"UNMERGE r c"</code>

<ul>
<li>(<code>r</code>, <code>c</code>) 위치의 셀을 선택하여 해당 셀의 모든 병합을 해제합니다.</li>
<li>선택한 셀이 포함하고 있던 모든 셀은 프로그램 실행 초기의 상태로 돌아갑니다.</li>
<li>병합을 해제하기 전 셀이 값을 가지고 있었을 경우 (<code>r</code>, <code>c</code>) 위치의 셀이 그 값을 가지게 됩니다.</li>
</ul></li>
<li> <code>"PRINT r c"</code>

<ul>
<li>(<code>r</code>, <code>c</code>) 위치의 셀을 선택하여 셀의 값을 출력합니다.</li>
<li>선택한 셀이 비어있을 경우 <code>"EMPTY"</code>를 출력합니다.</li>
</ul></li>
</ol>

<p>아래는 <code>UPDATE</code> 명령어를 실행하여 빈 셀에 값을 입력하는 예시입니다. </p>
<table class="table">
        <thead><tr>
<th>commands</th>
<th>효과</th>
</tr>
</thead>
        <tbody><tr>
<td>UPDATE 1 1 menu</td>
<td>(1,1)에 <code>"menu"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 1 2 category</td>
<td>(1,2)에 <code>"category"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 2 1 bibimbap</td>
<td>(2,1)에 <code>"bibimbap"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 2 2 korean</td>
<td>(2,2)에 <code>"korean"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 2 3 rice</td>
<td>(2,3)에 <code>"rice"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 3 1 ramyeon</td>
<td>(3,1)에 <code>"ramyeon"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 3 2 korean</td>
<td>(3,2)에 <code>"korean"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 3 3 noodle</td>
<td>(3,3)에 <code>"noodle"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 3 4 instant</td>
<td>(3,4)에 <code>"instant"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 4 1 pasta</td>
<td>(4,1)에 <code>"pasta"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 4 2 italian</td>
<td>(4,2)에 <code>"italian"</code> 입력</td>
</tr>
<tr>
<td>UPDATE 4 3 noodle</td>
<td>(4,3)에 <code>"noodle"</code> 입력</td>
</tr>
</tbody>
      </table>
<p>위 명령어를 실행하면 아래 그림과 같은 상태가 됩니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/d05f1a33-d67a-401a-a8f2-cc73e80a7f26/1-1.png" title="" alt="1-1.png"></p>

<p>아래는 <code>MERGE</code> 명령어를 실행하여 셀을 병합하는 예시입니다. </p>
<table class="table">
        <thead><tr>
<th>commands</th>
<th>효과</th>
</tr>
</thead>
        <tbody><tr>
<td>MERGE 1 2 1 3</td>
<td>(1,2)와 (1,3) 병합</td>
</tr>
<tr>
<td>MERGE 1 3 1 4</td>
<td>(1,3)과 (1,4) 병합</td>
</tr>
</tbody>
      </table>
<p>위 명령어를 실행하면 아래와 같은 상태가 됩니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/4a7cab89-0512-40b2-bf95-9bcfeff99830/1-2.png" title="" alt="1-2.png"></p>

<p>병합한 셀은 <code>"category"</code> 값을 가지게 되며 (1,2), (1,3), (1,4) 중 어느 위치를 선택하더라도 접근할 수 있습니다.  </p>

<p>아래는 <code>UPDATE</code> 명령어를 실행하여 셀의 값을 변경하는 예시입니다. </p>
<table class="table">
        <thead><tr>
<th>commands</th>
<th>효과</th>
</tr>
</thead>
        <tbody><tr>
<td>UPDATE korean hansik</td>
<td><code>"korean"</code>을 <code>"hansik"</code>으로 변경</td>
</tr>
<tr>
<td>UPDATE 1 3 group</td>
<td>(1,3) 위치의 셀 값을 <code>"group"</code>으로 변경</td>
</tr>
</tbody>
      </table>
<p>위 명령어를 실행하면 아래와 같은 상태가 됩니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/211b0331-1768-41a3-87d6-6d56356c5b7e/1-3.png" title="" alt="1-3.png"></p>

<p>아래는 <code>UNMERGE</code> 명령어를 실행하여 셀의 병합을 해제하는 예시입니다.</p>
<table class="table">
        <thead><tr>
<th>commands</th>
<th>효과</th>
</tr>
</thead>
        <tbody><tr>
<td>UNMERGE 1 4</td>
<td>셀 병합 해제 후 원래 값은 (1,4)가 가짐</td>
</tr>
</tbody>
      </table>
<p>위 명령어를 실행하면 아래와 같은 상태가 됩니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/2e9b0ad6-0c8c-45f6-8a8a-8a8a3d5625c3/1-4.png" title="" alt="1-4.png"></p>

<p>실행할 명령어들이 담긴 1차원 문자열 배열 <code>commands</code>가 매개변수로 주어집니다. <code>commands</code>의 명령어들을 순서대로 실행하였을 때, <code>"PRINT r c"</code> 명령어에 대한 실행결과를 순서대로 1차원 문자열 배열에 담아 return 하도록 solution 함수를 완성해주세요.</p>

<hr>

<h5>제한사항</h5>

<ul>
<li>1 ≤ <code>commands</code>의 길이 ≤ 1,000</li>
<li><code>commands</code>의 각 원소는 아래 5가지 형태 중 하나입니다.

<ol>
<li><code>"UPDATE r c value"</code>

<ul>
<li><code>r</code>, <code>c</code>는 선택할 셀의 위치를 나타내며, 1~50 사이의 정수입니다.</li>
<li><code>value</code>는 셀에 입력할 내용을 나타내며, 알파벳 소문자와 숫자로 구성된 길이 1~10 사이인 문자열입니다.</li>
</ul></li>
<li><code>"UPDATE value1 value2"</code>

<ul>
<li><code>value1</code>은 선택할 셀의 값, <code>value2</code>는 셀에 입력할 내용을 나타내며, 알파벳 소문자와 숫자로 구성된 길이 1~10 사이인 문자열입니다.</li>
</ul></li>
<li><code>"MERGE r1 c1 r2 c2"</code><br>

<ul>
<li><code>r1</code>, <code>c1</code>, <code>r2</code>, <code>c2</code>는 선택할 셀의 위치를 나타내며, 1~50 사이의 정수입니다.</li>
</ul></li>
<li><code>"UNMERGE r c"</code>

<ul>
<li><code>r</code>, <code>c</code>는 선택할 셀의 위치를 나타내며, 1~50 사이의 정수입니다.</li>
</ul></li>
<li><code>"PRINT r c"</code><br>

<ul>
<li><code>r</code>, <code>c</code>는 선택할 셀의 위치를 나타내며, 1~50 사이의 정수입니다.</li>
</ul></li>
</ol></li>
<li><code>commands</code>는 1개 이상의 <code>"PRINT r c"</code> 명령어를 포함하고 있습니다.</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>commands</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td><code>["UPDATE 1 1 menu", "UPDATE 1 2 category", "UPDATE 2 1 bibimbap", "UPDATE 2 2 korean", "UPDATE 2 3 rice", "UPDATE 3 1 ramyeon", "UPDATE 3 2 korean", "UPDATE 3 3 noodle", "UPDATE 3 4 instant", "UPDATE 4 1 pasta", "UPDATE 4 2 italian", "UPDATE 4 3 noodle", "MERGE 1 2 1 3", "MERGE 1 3 1 4", "UPDATE korean hansik", "UPDATE 1 3 group", "UNMERGE 1 4", "PRINT 1 3", "PRINT 1 4"]</code></td>
<td><code>["EMPTY", "group"]</code></td>
</tr>
<tr>
<td><code>["UPDATE 1 1 a", "UPDATE 1 2 b", "UPDATE 2 1 c", "UPDATE 2 2 d", "MERGE 1 1 1 2", "MERGE 2 2 2 1", "MERGE 2 1 1 1", "PRINT 1 1", "UNMERGE 2 2", "PRINT 1 1"]</code></td>
<td><code>["d", "EMPTY"]</code></td>
</tr>
</tbody>
      </table>
<hr>

<h5>입출력 예 설명</h5>

<p><strong>입출력 예 #1</strong></p>

<ul>
<li>문제 예시와 같습니다. (1,3) 위치의 셀은 비어있고 (1,4) 위치의 셀 값은 <code>"group"</code>입니다. 따라서 <code>["EMPTY", "group"]</code>을 return 해야 합니다.</li>
</ul>

<p><strong>입출력 예 #2</strong></p>

<ul>
<li>모든 <code>UPDATE</code> 명령어를 실행하면 아래와 같은 상태가 됩니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/8225f0c5-3d16-4b18-9b7e-412069c95c87/2-1.png" title="" alt="2-1.png"></p>

<ul>
<li><code>"MERGE 1 1 1 2"</code> 명령어를 실행하면 아래와 같은 상태가 됩니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/553d60bd-2f3d-4c51-8da6-d97534275ed8/2-2.png" title="" alt="2-2.png"></p>

<ul>
<li><code>"MERGE 2 2 2 1"</code> 명령어를 실행하면 아래와 같은 상태가 됩니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/b52ef688-b183-4e3f-9024-62fc3c1ee6fd/2-3.png" title="" alt="2-3.png"></p>

<ul>
<li><code>"MERGE 2 1 1 1"</code> 명령어를 실행하면 아래와 같은 상태가 됩니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/2ae0c82d-d090-4183-a8dc-8357fe520bf7/2-4.png" title="" alt="2-4.png"></p>

<ul>
<li><code>"UNMERGE 2 2"</code> 명령어를 실행하면 아래와 같은 상태가 됩니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/bb1128a2-38fd-4e27-b675-27838d0186da/2-5.png" title="" alt="2-5.png"></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
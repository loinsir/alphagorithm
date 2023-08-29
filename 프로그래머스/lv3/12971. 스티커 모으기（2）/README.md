# [level 3] 스티커 모으기(2) - 12971 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/12971) 

### 성능 요약

메모리: 21.6 MB, 시간: 22.89 ms

### 구분

코딩테스트 연습 > Summer／Winter Coding（～2018）

### 채점결과

Empty

### 문제 설명

<p>N개의 스티커가 원형으로 연결되어 있습니다. 다음 그림은 N = 8인 경우의 예시입니다.<br>
<img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/d8d3a8b3-606c-4fb6-baf2-3a96cb53d70c/%E1%84%89%E1%85%B3%E1%84%90%E1%85%B5%E1%84%8F%E1%85%A5_hb1jty.jpg" title="" alt="스티커_hb1jty.jpg"><br>
원형으로 연결된 스티커에서 몇 장의 스티커를 뜯어내어 뜯어낸 스티커에 적힌 숫자의 합이 최대가 되도록 하고 싶습니다. 단 스티커 한 장을 뜯어내면 양쪽으로 인접해있는 스티커는 찢어져서 사용할 수 없게 됩니다. </p>

<p>예를 들어 위 그림에서 14가 적힌 스티커를 뜯으면 인접해있는 10, 6이 적힌 스티커는 사용할 수 없습니다. 스티커에 적힌 숫자가 배열 형태로 주어질 때, 스티커를 뜯어내어 얻을 수 있는 숫자의 합의 최댓값을 return 하는 solution 함수를 완성해 주세요. 원형의 스티커 모양을 위해 배열의 첫 번째 원소와 마지막 원소가 서로 연결되어 있다고 간주합니다.</p>

<h5>제한 사항</h5>

<ul>
<li>sticker는 원형으로 연결된 스티커의 각 칸에 적힌 숫자가 순서대로 들어있는 배열로, 길이(N)는 1 이상 100,000 이하입니다.</li>
<li>sticker의 각 원소는 스티커의 각 칸에 적힌 숫자이며, 각 칸에 적힌 숫자는 1 이상 100 이하의 자연수입니다.</li>
<li>원형의 스티커 모양을 위해 sticker 배열의 첫 번째 원소와 마지막 원소가 서로 연결되어있다고 간주합니다.</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>sticker</th>
<th>answer</th>
</tr>
</thead>
        <tbody><tr>
<td>[14, 6, 5, 11, 3, 9, 2, 10]</td>
<td>36</td>
</tr>
<tr>
<td>[1, 3, 2, 5, 4]</td>
<td>8</td>
</tr>
</tbody>
      </table>
<h5>입출력 예 설명</h5>

<p>입출력 예 #1<br>
6, 11, 9, 10이 적힌 스티커를 떼어 냈을 때 36으로 최대가 됩니다.</p>

<p>입출력 예 #2<br>
3, 5가 적힌 스티커를 떼어 냈을 때 8로 최대가 됩니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
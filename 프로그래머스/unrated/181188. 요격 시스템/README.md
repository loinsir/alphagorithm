# [unrated] 요격 시스템 - 181188 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/181188) 

### 성능 요약

메모리: 16.5 MB, 시간: 0.10 ms

### 구분

코딩테스트 연습 > 연습문제

### 채점결과

Empty

### 문제 설명

<p>A 나라가 B 나라를 침공하였습니다. B 나라의 대부분의 전략 자원은 아이기스 군사 기지에 집중되어 있기 때문에 A 나라는 B 나라의 아이기스 군사 기지에 융단폭격을 가했습니다.<br>
A 나라의 공격에 대항하여 아이기스 군사 기지에서는 무수히 쏟아지는 폭격 미사일들을 요격하려고 합니다. 이곳에는 백발백중을 자랑하는 요격 시스템이 있지만 운용 비용이 상당하기 때문에 미사일을 최소로 사용해서 모든 폭격 미사일을 요격하려 합니다.<br>
A 나라와 B 나라가 싸우고 있는 이 세계는 2 차원 공간으로 이루어져 있습니다. A 나라가 발사한 폭격 미사일은 x 축에 평행한 직선 형태의 모양이며 개구간을 나타내는 정수 쌍 (s, e) 형태로 표현됩니다. B 나라는 특정 x 좌표에서 y 축에 수평이 되도록 미사일을 발사하며, 발사된 미사일은 해당 x 좌표에 걸쳐있는 모든 폭격 미사일을 관통하여 한 번에 요격할 수 있습니다. 단, 개구간 (s, e)로 표현되는 폭격 미사일은 s와 e에서 발사하는 요격 미사일로는 요격할 수 없습니다. 요격 미사일은 실수인 x 좌표에서도 발사할 수 있습니다.<br>
각 폭격 미사일의 x 좌표 범위 목록 <code>targets</code>이 매개변수로 주어질 때, 모든 폭격 미사일을 요격하기 위해 필요한 요격 미사일 수의 최솟값을 return 하도록 solution 함수를 완성해 주세요.</p>

<hr>

<h5>제한 사항</h5>

<ul>
<li>1 ≤ <code>targets</code>의 길이 ≤ 500,000</li>
<li>targets의 각 행은 [s,e] 형태입니다.

<ul>
<li>이는 한 폭격 미사일의 x 좌표 범위를 나타내며, 개구간 (s, e)에서 요격해야 합니다.</li>
<li>0 ≤ s &lt; e ≤ 100,000,000</li>
</ul></li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>targets</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>[[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]]</td>
<td>3</td>
</tr>
</tbody>
      </table>
<hr>

<h5>입출력 예 설명</h5>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/9641b37b-9c9d-4eec-bd92-bec75acf2338/%EA%B7%B8%EB%A6%BC.png" title="" alt="그림.png"><br>
위 그림과 같이 최소 세 번의 요격 미사일 발사로 전부 방어할 수 있습니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
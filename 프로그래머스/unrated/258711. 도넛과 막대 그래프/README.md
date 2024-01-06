# [level unrated] 도넛과 막대 그래프 - 258711 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/258711) 

### 성능 요약

메모리: 193 MB, 시간: 1402.22 ms

### 구분

코딩테스트 연습 > 2024 KAKAO WINTER INTERNSHIP

### 채점결과

정확성: 100.0<br/>합계: 100.0 / 100.0

### 제출 일자

2024년 1월 6일 15:52:34

### 문제 설명

<p>도넛 모양 그래프, 막대 모양 그래프, 8자 모양 그래프들이 있습니다. 이 그래프들은 1개 이상의 정점과, 정점들을 연결하는 단방향 간선으로 이루어져 있습니다.</p>

<ul>
<li>크기가 <code>n</code>인 도넛 모양 그래프는 <code>n</code>개의 정점과 <code>n</code>개의 간선이 있습니다. 도넛 모양 그래프의 아무 한 정점에서 출발해 이용한 적 없는 간선을 계속 따라가면 나머지 <code>n</code>-1개의 정점들을 한 번씩 방문한 뒤 원래 출발했던 정점으로 돌아오게 됩니다. 도넛 모양 그래프의 형태는 다음과 같습니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/dbf6ff18-1f05-46c2-8b62-7c39e831d1c6/%E1%84%8C%E1%85%A6%E1%84%86%E1%85%A9%E1%86%A8%20%E1%84%8B%E1%85%A5%E1%86%B9%E1%84%82%E1%85%B3%E1%86%AB%20%E1%84%83%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%A5%E1%84%80%E1%85%B3%E1%84%85%E1%85%A2%E1%86%B7.drawio.png" title="" alt="제목 없는 다이어그램.drawio.png"></p>

<ul>
<li>크기가 <code>n</code>인 막대 모양 그래프는 <code>n</code>개의 정점과 <code>n</code>-1개의 간선이 있습니다. 막대 모양 그래프는 임의의 한 정점에서 출발해 간선을 계속 따라가면 나머지 <code>n</code>-1개의 정점을 한 번씩 방문하게 되는 정점이 단 하나 존재합니다. 막대 모양 그래프의 형태는 다음과 같습니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/85e3e66c-bba0-4da3-9552-c467dfe5baf4/%E1%84%83%E1%85%A9%E1%84%82%E1%85%A5%E1%86%BA%E1%84%80%E1%85%AA%E1%84%86%E1%85%A1%E1%86%A8%E1%84%83%E1%85%A22.png" title="" alt="도넛과막대2.png"></p>

<ul>
<li>크기가 <code>n</code>인 8자 모양 그래프는 <code>2n</code>+1개의 정점과 <code>2n</code>+2개의 간선이 있습니다. 8자 모양 그래프는 크기가 동일한 2개의 도넛 모양 그래프에서 정점을 하나씩 골라 결합시킨 형태의 그래프입니다. 8자 모양 그래프의 형태는 다음과 같습니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/868f2c14-8521-4c94-a2f0-1e11708aa76a/8%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B3%E1%84%85%E1%85%A2%E1%84%91%E1%85%B3.drawio.png" title="" alt="8자그래프.drawio.png"></p>

<p>도넛 모양 그래프, 막대 모양 그래프, 8자 모양 그래프가 여러 개 있습니다. 이 그래프들과 무관한 정점을 하나 생성한 뒤, 각 도넛 모양 그래프, 막대 모양 그래프, 8자 모양 그래프의 임의의 정점 하나로 향하는 간선들을 연결했습니다.<br>
그 후 각 정점에 서로 다른 번호를 매겼습니다.<br>
이때 당신은 그래프의 간선 정보가 주어지면 생성한 정점의 번호와 정점을 생성하기 전 도넛 모양 그래프의 수, 막대 모양 그래프의 수, 8자 모양 그래프의 수를 구해야 합니다.</p>

<p>그래프의 간선 정보를 담은 2차원 정수 배열 <code>edges</code>가 매개변수로 주어집니다. 이때, 생성한 정점의 번호, 도넛 모양 그래프의 수, 막대 모양 그래프의 수, 8자 모양 그래프의 수를 순서대로 1차원 정수 배열에 담아 return 하도록 solution 함수를 완성해 주세요.</p>

<hr>

<h5>제한사항</h5>

<ul>
<li>1 ≤ <code>edges</code>의 길이 ≤ 1,000,000

<ul>
<li><code>edges</code>의 원소는 [<code>a</code>,<code>b</code>] 형태이며, <code>a</code>번 정점에서 <code>b</code>번 정점으로 향하는 간선이 있다는 것을 나타냅니다.</li>
<li>1 ≤ <code>a</code>, <code>b</code> ≤ 1,000,000</li>
</ul></li>
<li>문제의 조건에 맞는 그래프가 주어집니다. </li>
<li>도넛 모양 그래프, 막대 모양 그래프, 8자 모양 그래프의 수의 합은 2이상입니다.</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>edges</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>[[2, 3], [4, 3], [1, 1], [2, 1]]</td>
<td>[2, 1, 1, 0]</td>
</tr>
<tr>
<td>[[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]</td>
<td>[4, 0, 1, 2]</td>
</tr>
</tbody>
      </table>
<hr>

<h5>입출력 예 설명</h5>

<p><strong>입출력 예 #1</strong></p>

<p>주어진 그래프를 그림으로 나타내면 다음과 같습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/1511016b-7d9b-427d-a57f-653a9abcd7fe/%E1%84%83%E1%85%A9%E1%84%82%E1%85%A5%E1%86%BA%E1%84%80%E1%85%AA%E1%84%86%E1%85%A1%E1%86%A8%E1%84%83%E1%85%A23.png" title="" alt="도넛과막대3.png"></p>

<p>2번 정점이 생성한 정점이고 도넛 모양 그래프 1개, 막대 모양 그래프 1개가 존재합니다. 따라서 [2, 1, 1, 0]을 return 해야 합니다.</p>

<p><strong>입출력 예 #2</strong></p>

<p>주어진 그래프를 그림으로 나타내면 다음과 같습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/0c6a6010-3bfe-4578-b3f3-1c75381673b9/%E1%84%83%E1%85%A9%E1%84%82%E1%85%A5%E1%86%BA%E1%84%80%E1%85%AA%E1%84%86%E1%85%A1%E1%86%A8%E1%84%83%E1%85%A24.drawio.png" title="" alt="도넛과막대4.drawio.png"></p>

<p>4번 정점이 생성한 정점이고 막대 모양 그래프 1개, 8자 모양 그래프 2개가 존재합니다. 따라서 [4, 0, 1, 2]를 return 해야 합니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges
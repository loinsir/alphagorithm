# [level unrated] 산 모양 타일링 - 258705 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/258705) 

### 성능 요약

메모리: 19.1 MB, 시간: 3.10 ms

### 구분

코딩테스트 연습 > 2024 KAKAO WINTER INTERNSHIP

### 채점결과

정확성: 100.0<br/>합계: 100.0 / 100.0

### 제출 일자

2024년 1월 1일 14:58:7

### 문제 설명

<p>한 변의 길이가 1인 정삼각형 <code>2n+1</code>개를 이어붙여 윗변의 길이가 <code>n</code>, 아랫변의 길이가 <code>n+1</code>인 사다리꼴을 만들 수 있습니다. 이때 사다리꼴의 윗변과 변을 공유하는 <code>n</code>개의 정삼각형 중 일부의 위쪽에 같은 크기의 정삼각형을 붙여 새로운 모양을 만들었습니다. 예를 들어 <code>n</code>이 4이고, 1번째, 2번째, 4번째 정삼각형 위에 정삼각형을 붙인 모양은 다음과 같습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/b1eb2bdf-c4a8-4750-8a0d-1fe1a304ccaf/pic1.png" title="" alt="pic1.png"></p>

<p>이렇게 만든 모양을 <strong>정삼각형 타일</strong> 또는 정삼각형 2개를 이어 붙인 <strong>마름모 타일</strong>로 빈 곳이 없도록 채우려고 합니다. 정삼각형 타일과 마름모 타일은 돌려서 사용할 수 있습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/f145dc29-ce8b-4077-ad71-9442b1c4434f/pic2.png" title="" alt="pic2.png"></p>

<p>타일을 놓을 때 다른 타일과 겹치거나 모양을 벗어나게 놓을 수는 없습니다. 위의 예시 모양을 채우는 방법 중 일부는 다음과 같습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/89dbb27a-f939-4b71-abd9-3de304f67c4e/pic3.png" title="" alt="pic3.png"></p>

<p>사다리꼴의 윗변의 길이를 나타내는 정수 <code>n</code>과 사다리꼴 윗변에 붙인 정삼각형을 나타내는 1차원 정수 배열 <code>tops</code>가 매개변수로 주어집니다. 이때 문제 설명에 따라 만든 모양을 정삼각형 또는 마름모 타일로 빈 곳이 없도록 채우는 경우의 수를 <code>10007</code>로 나눈 나머지를 return 하도록 solution 함수를 완성해 주세요.</p>

<hr>

<h5>제한사항</h5>

<ul>
<li>1 ≤ <code>n</code> ≤ 100,000</li>
<li><code>tops</code>의 길이 = <code>n</code>

<ul>
<li><code>tops[i]</code>는 사다리꼴의 윗변과 변을 공유하는 <code>i+1</code>번째 정삼각형의 위쪽에 정삼각형을 붙이는 경우 1, 붙이지 않는 경우 0입니다.</li>
</ul></li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>n</th>
<th>tops</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>4</td>
<td>[1, 1, 0, 1]</td>
<td>149</td>
</tr>
<tr>
<td>2</td>
<td>[0, 1]</td>
<td>11</td>
</tr>
<tr>
<td>10</td>
<td>[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]</td>
<td>7704</td>
</tr>
</tbody>
      </table>
<hr>

<h5>입출력 예 설명</h5>

<p><strong>입출력 예 #1</strong></p>

<p>문제의 예시와 같습니다. 문제에서 설명한 방법을 포함해 총 149가지 방법이 존재합니다.</p>

<p>따라서 149를 return 해야 합니다.</p>

<p><strong>입출력 예 #2</strong></p>

<p>문제 설명에 따라 만든 모양은 다음과 같습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/d887399e-2335-4a99-8c3b-af0d71e595bd/pic4.png" title="" alt="pic4.png"></p>

<p>이 모양을 타일로 채우는 방법은 다음과 같이 총 11가지입니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/aad9c7de-087c-4a6c-9b02-8c6712a42f69/pic5.png" title="" alt="pic5.png"></p>

<p>따라서 11을 return 해야 합니다.</p>

<p><strong>입출력 예 #3</strong></p>

<p>경우의 수는 총 17,711가지입니다. 따라서 17711을 10007로 나눈 나머지인 7704를 return 해야 합니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges
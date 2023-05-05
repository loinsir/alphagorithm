# [level 3] 기지국 설치 - 12979 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/12979) 

### 성능 요약

메모리: 16.7 MB, 시간: 1.46 ms

### 구분

코딩테스트 연습 > Summer／Winter Coding（～2018）

### 채점결과

Empty

### 문제 설명

<p>N개의 아파트가 일렬로 쭉 늘어서 있습니다. 이 중에서 일부 아파트 옥상에는 4g 기지국이 설치되어 있습니다. 기술이 발전해 5g 수요가 높아져 4g 기지국을 5g 기지국으로 바꾸려 합니다. 그런데 5g 기지국은 4g 기지국보다 전달 범위가 좁아, 4g 기지국을 5g 기지국으로 바꾸면 어떤 아파트에는 전파가 도달하지 않습니다.</p>

<p>예를 들어 11개의 아파트가 쭉 늘어서 있고, [4, 11] 번째 아파트 옥상에는 4g 기지국이 설치되어 있습니다. 만약 이 4g 기지국이 전파 도달 거리가 1인 5g 기지국으로 바뀔 경우 모든 아파트에 전파를 전달할 수 없습니다. (전파의 도달 거리가 W일 땐, 기지국이 설치된 아파트를 기준으로 전파를 양쪽으로 W만큼 전달할 수 있습니다.)</p>

<ul>
<li>초기에, 1, 2, 6, 7, 8, 9번째 아파트에는 전파가 전달되지 않습니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/fcb45e06-ebb2-4d93-98cc-b6203185e933/%E1%84%80%E1%85%B5%E1%84%8C%E1%85%B5%E1%84%80%E1%85%AE%E1%86%A8%E1%84%89%E1%85%A5%E1%86%AF%E1%84%8E%E1%85%B51_pvskxt.png" title="" alt="기지국설치1_pvskxt.png"></p>

<ul>
<li>1, 7, 9번째 아파트 옥상에 기지국을 설치할 경우, 모든 아파트에 전파를 전달할 수 있습니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/dd31ddb8-f50d-404c-a6f5-8d6a1d88f620/%E1%84%80%E1%85%B5%E1%84%8C%E1%85%B5%E1%84%80%E1%85%AE%E1%86%A8%E1%84%89%E1%85%A5%E1%86%AF%E1%84%8E%E1%85%B52_kml0pb.png" title="" alt="기지국설치2_kml0pb.png"></p>

<ul>
<li>더 많은 아파트 옥상에 기지국을 설치하면 모든 아파트에 전파를 전달할 수 있습니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/f5801b12-f683-422d-b26f-5e23e72915dc/%E1%84%80%E1%85%B5%E1%84%8C%E1%85%B5%E1%84%80%E1%85%AE%E1%86%A8%E1%84%89%E1%85%A5%E1%86%AF%E1%84%8E%E1%85%B53_xhv7r3.png" title="" alt="기지국설치3_xhv7r3.png"></p>

<p>이때, 우리는 5g 기지국을 <strong>최소로 설치</strong>하면서 모든 아파트에 전파를 전달하려고 합니다. 위의 예시에선 최소 3개의 아파트 옥상에 기지국을 설치해야 모든 아파트에 전파를 전달할 수 있습니다.</p>

<p>아파트의 개수 N, 현재 기지국이 설치된 아파트의 번호가 담긴 1차원 배열 stations, 전파의 도달 거리 W가 매개변수로 주어질 때, 모든 아파트에 전파를 전달하기 위해 증설해야 할 기지국 개수의 최솟값을 리턴하는 solution 함수를 완성해주세요</p>

<h5>제한사항</h5>

<ul>
<li>N: 200,000,000 이하의 자연수</li>
<li>stations의 크기: 10,000 이하의 자연수</li>
<li>stations는 오름차순으로 정렬되어 있고, 배열에 담긴 수는 N보다 같거나 작은 자연수입니다.</li>
<li>W: 10,000 이하의 자연수</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>N</th>
<th>stations</th>
<th>W</th>
<th>answer</th>
</tr>
</thead>
        <tbody><tr>
<td>11</td>
<td>[4, 11]</td>
<td>1</td>
<td>3</td>
</tr>
<tr>
<td>16</td>
<td>[9]</td>
<td>2</td>
<td>3</td>
</tr>
</tbody>
      </table>
<h5>입출력 예 설명</h5>

<p>입출력 예 #1<br>
문제의 예시와 같습니다</p>

<p>입출력 예 #2</p>

<ul>
<li>초기에, 1~6, 12~16번째 아파트에는 전파가 전달되지 않습니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/1d766102-f684-4643-bea2-02daea82e710/%E1%84%80%E1%85%B5%E1%84%8C%E1%85%B5%E1%84%80%E1%85%AE%E1%86%A8%E1%84%89%E1%85%A5%E1%86%AF%E1%84%8E%E1%85%B54_nqfrmm.png" title="" alt="기지국설치4_nqfrmm.png"></p>

<ul>
<li>3, 6, 14번째 아파트 옥상에 기지국을 설치할 경우 모든 아파트에 전파를 전달할 수 있습니다.</li>
</ul>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/bc7d4fdb-cb48-4f45-b2eb-977cfb2c54dd/%E1%84%80%E1%85%B5%E1%84%8C%E1%85%B5%E1%84%80%E1%85%AE%E1%86%A8%E1%84%89%E1%85%A5%E1%86%AF%E1%84%8E%E1%85%B55_zh4ebk.png" title="" alt="기지국설치5_zh4ebk.png"></p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
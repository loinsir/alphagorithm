# [level 3] 표 편집 - 81303 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/81303) 

### 성능 요약

메모리: 85.5 MB, 시간: 557.73 ms

### 구분

코딩테스트 연습 > 2021 카카오 채용연계형 인턴십

### 채점결과

Empty

### 문제 설명

<p><strong>[본 문제는 정확성과 효율성 테스트 각각 점수가 있는 문제입니다.]</strong></p>

<p>업무용 소프트웨어를 개발하는 니니즈웍스의 인턴인 앙몬드는 명령어 기반으로 표의 행을 선택, 삭제, 복구하는 프로그램을 작성하는 과제를 맡았습니다. 세부 요구 사항은 다음과 같습니다</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/d8e89054-53ba-4222-a485-dc56893f45e4/table_1.png" title="" alt="table_1.png"></p>

<p>위 그림에서 파란색으로 칠해진 칸은 현재 <strong>선택된 행</strong>을 나타냅니다. 단, 한 번에 한 행만 선택할 수 있으며, 표의 범위(0행 ~ 마지막 행)를 벗어날 수 없습니다. 이때, 다음과 같은 명령어를 이용하여 표를 편집합니다.</p>

<ul>
<li><code>"U X"</code>: 현재 선택된 행에서 X칸 위에 있는 행을 선택합니다. </li>
<li><code>"D X"</code>: 현재 선택된 행에서 X칸 아래에 있는 행을 선택합니다. </li>
<li><code>"C"</code> : 현재 선택된 행을 삭제한 후, 바로 아래 행을 선택합니다. 단, 삭제된 행이 가장 마지막 행인 경우 바로 윗 행을 선택합니다.</li>
<li><code>"Z"</code> : 가장 최근에 삭제된 행을 원래대로 복구합니다. <u><strong>단, 현재 선택된 행은 바뀌지 않습니다.</strong></u></li>
</ul>

<p>예를 들어 위 표에서 <code>"D 2"</code>를 수행할 경우 아래 그림의 왼쪽처럼 4행이 선택되며, <code>"C"</code>를 수행하면 선택된 행을 삭제하고, 바로 아래 행이었던 "네오"가 적힌 행을 선택합니다(4행이 삭제되면서 아래 있던 행들이 하나씩 밀려 올라오고, 수정된 표에서 다시 4행을 선택하는 것과 동일합니다).</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/453bbb71-df69-4be2-a223-67361878202c/table_2.png" title="" alt="table_2.png"></p>

<p>다음으로 <code>"U 3"</code>을 수행한 다음 <code>"C"</code>를 수행한 후의 표 상태는 아래 그림과 같습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/61261fa2-701d-4db5-9aa2-a56dd85a3dbf/table_3.png" title="" alt="table_3.png"></p>

<p>다음으로 <code>"D 4"</code>를 수행한 다음 <code>"C"</code>를 수행한 후의 표 상태는 아래 그림과 같습니다. 5행이 표의 마지막 행 이므로, 이 경우 바로 윗 행을 선택하는 점에 주의합니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/b1a63278-be97-4e3a-a653-5a6aa0f477ba/table_4.png" title="" alt="table_4.png"></p>

<p>다음으로 <code>"U 2"</code>를 수행하면 현재 선택된 행은 2행이 됩니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/b1189eff-e4ee-4119-bb55-a1f06e388c29/table_5.png" title="" alt="table_5.png"></p>

<p>위 상태에서 <code>"Z"</code>를 수행할 경우 가장 최근에 제거된 <code>"라이언"</code>이 적힌 행이 원래대로 복구됩니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/0a386d19-0391-46a7-8086-9f36db31940d/table_6.png" title="" alt="table_6.png"></p>

<p>다시한번 <code>"Z"</code>를 수행하면 그 다음으로 최근에 제거된 <code>"콘"</code>이 적힌 행이 원래대로 복구됩니다. 이때, 현재 선택된 행은 바뀌지 않는 점에 주의하세요.<br>
<img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/8900360f-bf0b-449b-a508-98918a14ef1d/table_7.png" title="" alt="table_7.png"></p>

<p>이때, 최종 표의 상태와 처음 주어진 표의 상태를 비교하여 삭제되지 않은 행은 <code>"O"</code>, 삭제된 행은 <code>"X"</code>로 표시하면 다음과 같습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/87a31aeb-50fb-4c0d-9f6b-8427632b582e/table_8.png" title="" alt="table_8.png"></p>

<p>처음 표의 행 개수를 나타내는 정수 n, 처음에 선택된 행의 위치를 나타내는 정수 k, 수행한 명령어들이 담긴 문자열 배열 cmd가 매개변수로 주어질 때, 모든 명령어를 수행한 후 표의 상태와 처음 주어진 표의 상태를 비교하여 삭제되지 않은 행은 O, 삭제된 행은 X로 표시하여 문자열 형태로 return 하도록 solution 함수를 완성해주세요.</p>

<hr>

<h5>제한사항</h5>

<ul>
<li>5 ≤ <code>n</code> ≤ 1,000,000</li>
<li>0 ≤ <code>k</code> &lt; <code>n</code></li>
<li>1 ≤ <code>cmd</code>의 원소 개수 ≤ 200,000

<ul>
<li><code>cmd</code>의 각 원소는 <code>"U X"</code>, <code>"D X"</code>, <code>"C"</code>, <code>"Z"</code> 중 하나입니다.</li>
<li>X는 1 이상 300,000 이하인 자연수이며 0으로 시작하지 않습니다.</li>
<li>X가 나타내는 자연수에 ',' 는 주어지지 않습니다. 예를 들어 123,456의 경우 123456으로 주어집니다.</li>
<li><code>cmd</code>에 등장하는 모든 X들의 값을 합친 결과가 1,000,000 이하인 경우만 입력으로 주어집니다.</li>
<li>표의 모든 행을 제거하여, 행이 하나도 남지 않는 경우는 입력으로 주어지지 않습니다.</li>
<li>본문에서 각 행이 제거되고 복구되는 과정을 보다 자연스럽게 보이기 위해 <code>"이름"</code> 열을 사용하였으나, <code>"이름"</code>열의 내용이 실제 문제를 푸는 과정에 필요하지는 않습니다. <code>"이름"</code>열에는 서로 다른 이름들이 중복없이 채워져 있다고 가정하고 문제를 해결해 주세요.</li>
</ul></li>
<li>표의 범위를 벗어나는 이동은 입력으로 주어지지 않습니다.</li>
<li>원래대로 복구할 행이 없을 때(즉, 삭제된 행이 없을 때) "Z"가 명령어로 주어지는 경우는 없습니다.</li>
<li>정답은 표의 0행부터 n - 1행까지에 해당되는 O, X를 순서대로 이어붙인 문자열 형태로 return 해주세요.</li>
</ul>

<h5>정확성 테스트 케이스 제한 사항</h5>

<ul>
<li>5 ≤ <code>n</code> ≤ 1,000</li>
<li>1 ≤ <code>cmd</code>의 원소 개수 ≤ 1,000</li>
</ul>

<h5>효율성 테스트 케이스 제한 사항</h5>

<ul>
<li>주어진 조건 외 추가 제한사항 없습니다.</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>n</th>
<th>k</th>
<th>cmd</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>8</td>
<td>2</td>
<td><code>["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]</code></td>
<td><code>"OOOOXOOO"</code></td>
</tr>
<tr>
<td>8</td>
<td>2</td>
<td><code>["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]</code></td>
<td><code>"OOXOXOOO"</code></td>
</tr>
</tbody>
      </table>
<hr>

<h5>입출력 예 설명</h5>

<p><strong>입출력 예 #1</strong></p>

<p>문제의 예시와 같습니다.</p>

<p><strong>입출력 예 #2</strong></p>

<p>다음은 9번째 명령어까지 수행한 후의 표 상태이며, 이는 입출력 예 #1과 같습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/8900360f-bf0b-449b-a508-98918a14ef1d/table_7.png" title="" alt="table_7.png"></p>

<p>10번째 명령어 <code>"U 1"</code>을 수행하면 <code>"어피치"</code>가 적힌 2행이 선택되며, 마지막 명령어 <code>"C"</code>를 수행하면 선택된 행을 삭제하고, 바로 아래 행이었던 <code>"제이지"</code>가 적힌 행을 선택합니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/c9798574-4aa9-4029-901f-21f83fe43164/table_9.png" title="" alt="table_9.png"></p>

<p>따라서 처음 주어진 표의 상태와 최종 표의 상태를 비교하면 다음과 같습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/e7ba17b2-9461-4e92-8356-81cc90adb2ec/table_10.png" title="" alt="table_10.png"></p>

<hr>

<h5>제한시간 안내</h5>

<ul>
<li>정확성 테스트 : 10초</li>
<li>효율성 테스트 : 언어별로 작성된 정답 코드의 실행 시간의 적정 배수</li>
</ul>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
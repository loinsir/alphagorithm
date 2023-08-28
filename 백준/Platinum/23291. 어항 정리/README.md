# [Platinum V] 어항 정리 - 23291 

[문제 링크](https://www.acmicpc.net/problem/23291) 

### 성능 요약

메모리: 79520 KB, 시간: 24 ms

### 분류

구현, 시뮬레이션

### 문제 설명

<p>마법사 상어는 그동안 배운 마법을 이용해 어항을 정리하려고 한다. 어항은 정육면체 모양이고, 한 변의 길이는 모두 1이다. 상어가 가지고 있는 어항은 N개이고, 가장 처음에 어항은 일렬로 바닥 위에 놓여져 있다. 어항에는 물고기가 한 마리 이상 들어있다. <그림 1>은 어항 8개가 바닥 위에 놓여있는 상태이며, 칸에 적힌 값은 그 어항에 들어있는 물고기의 수이다. 편의상 어항은 정사각형으로 표현했다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/d4a3451b-498a-4242-ad64-20695601733b/-/preview/" style="width: 364px; height: 50px;"></p>

<p style="text-align: center;"><그림 1></p>

<p>어항을 한 번 정리하는 과정은 다음과 같이 이루어져 있다.</p>

<p>먼저, 물고기의 수가 가장 적은 어항에 물고기를 한 마리 넣는다. 만약, 그러한 어항이 여러개라면 물고기의 수가 최소인 어항 모두에 한 마리씩 넣는다. 위의 예시의 경우 물고기의 수가 가장 적은 어항에는 물고기가 2마리 있고, 그러한 어항은 2개가 있다. 따라서, 2개의 어항에 물고기를 한 마리씩 넣어 <그림 2>와 같아진다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/604a6337-63c4-44dd-bb30-b33d87d95738/-/preview/" style="width: 364px; height: 50px;"></p>

<p style="text-align: center;"><그림 2></p>

<p>이제 어항을 쌓는다. 먼저, 가장 왼쪽에 있는 어항을 그 어항의 오른쪽에 있는 어항의 위에 올려 놓아 <그림 3>이 된다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/a66c6444-c761-4eab-a075-03f36f1d1a10/-/preview/" style="width: 339px; height: 100px;"></p>

<p style="text-align: center;"><그림 3></p>

<p>이제, 2개 이상 쌓여있는 어항을 모두 공중 부양시킨 다음, 전체를 시계방향으로 90도 회전시킨다. 이후 공중 부양시킨 어항을 바닥에 있는 어항의 위에 올려놓는다. 바닥의 가장 왼쪽에 있는 어항 위에 공중 부양시킨 어항 중 가장 왼쪽에 있는 어항이 있어야 한다. 이 작업은 공중 부양시킨 어항 중 가장 오른쪽에 있는 어항의 아래에 바닥에 있는 어항이 있을때까지 반복한다.</p>

<p>먼저, <그림 4>와 같이 어항이 놓인 상태가 변하고, 한 번 더 변해서 <그림 5>가 된다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/35deec6b-619e-4632-9734-fa776baa3dcc/-/preview/" style="width: 291px; height: 100px;"></p>

<p style="text-align: center;"><그림 4></p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/dee1836d-7228-4b84-a790-e83e680d3629/-/preview/" style="width: 197px; height: 150px;"></p>

<p style="text-align: center;"><그림 5></p>

<p><그림 5>에서 한 번 더 어항을 공중 부양시키는 것은 불가능하다. 그 이유는 <그림 6>과 같이 공중 부양시킨 어항 중 가장 오른쪽에 있는 어항의 아래에 바닥에 있는 어항이 없기 때문이다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/0313d234-d449-4bc8-b7f0-192bf644b982/-/preview/" style="width: 148px; height: 150px;"></p>

<p style="text-align: center;"><그림 6></p>

<p>공중 부양 작업이 모두 끝나면, 어항에 있는 물고기의 수를 조절한다.</p>

<p>모든 인접한 두 어항에 대해서, 물고기 수의 차이를 구한다. 이 차이를 5로 나눈 몫을 d라고 하자. d가 0보다 크면, 두 어항 중 물고기의 수가 많은 곳에 있는 물고기 d 마리를 적은 곳에 있는 곳으로 보낸다. 이 과정은 모든 인접한 칸에 대해서 동시에 발생한다. 이 과정이 완료되면 <그림 7>이 된다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/eba5a1f9-9cd7-40a3-9ac8-cd63c2017688/-/preview/" style="width: 196px; height: 150px;"></p>

<p style="text-align: center;"><그림 7></p>

<p>이제 다시 어항을 바닥에 일렬로 놓아야 한다. 가장 왼쪽에 있는 어항부터, 그리고 아래에 있는 어항부터 가장 위에 있는 어항까지 순서대로 바닥에 놓아야 한다. <그림 8>이 바닥에 다시 일렬로 놓은 상태이다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/3e2a5fb2-fc71-46a4-9e3d-29fc1085e375/-/preview/" style="width: 368px; height: 50px;"></p>

<p style="text-align: center;"><그림 8></p>

<p>다시 공중 부양 작업을 해야 한다. 이번에는 가운데를 중심으로 왼쪽 N/2개를 공중 부양시켜 전체를 시계 방향으로 180도 회전 시킨 다음, 오른쪽 N/2개의 위에 놓아야 한다. 이 작업은 두 번 반복해야한다. 두 번 반복하면 바닥에 있는 어항의 수는 N/4개가 된다. <그림 9>는 이 작업을 1번 했을 때, <그림 10>은 다시 한 번 더 했을 때이다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/9288996d-9194-48df-a410-3f633f0ba232/-/preview/" style="width: 194px; height: 100px;"></p>

<p style="text-align: center;"><그림 9></p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/a4ec5dca-a846-4dd3-91bf-960544df6fb9/-/preview/" style="width: 101px; height: 200px;"></p>

<p style="text-align: center;"><그림 10></p>

<p>여기서 다시 위에서 한 물고기 조절 작업을 수행하고, 바닥에 일렬로 놓는 작업을 수행한다. <그림 10>에서 조절 작업을 마친 결과는 <그림 11>이 되고, 여기서 다시 바닥에 일렬로 놓는 작업을 수행하면 <그림 12>가 된다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/058e0bc7-cdd4-474f-9117-bf5c388f5d04/-/preview/" style="width: 101px; height: 200px;"></p>

<p style="text-align: center;"><그림 11></p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/37be6d49-8ced-4aab-a3b7-c3a595780293/-/preview/" style="width: 367px; height: 50px;"></p>

<p style="text-align: center;"><그림 12></p>

<p>어항의 수 N, 각 어항에 들어있는 물고기의 수가 주어진다. 물고기가 가장 많이 들어있는 어항과 가장 적게 들어있는 어항의 물고기 수 차이가 K 이하가 되려면 어항을 몇 번 정리해야하는지 구해보자.</p>

### 입력 

 <p>첫째 줄에 N, K가 주어진다. 둘째에는 어항에 들어있는 물고기의 수가 가장 왼쪽에 있는 어항부터 순서대로 주어진다.</p>

### 출력 

 <p> 물고기가 가장 많이 들어있는 어항과 가장 적게 들어있는 어항의 물고기 수 차이가 K 이하가 되려면 어항을 몇 번 정리해야하는지 출력한다.</p>


# [Gold III] 내리막 길 - 1520 

[문제 링크](https://www.acmicpc.net/problem/1520) 

### 성능 요약

메모리: 83568 KB, 시간: 112 ms

### 분류

깊이 우선 탐색, 다이나믹 프로그래밍, 그래프 이론, 그래프 탐색

### 문제 설명

<p>여행을 떠난 세준이는 지도를 하나 구하였다. 이 지도는 아래 그림과 같이 직사각형 모양이며 여러 칸으로 나뉘어져 있다. 한 칸은 한 지점을 나타내는데 각 칸에는 그 지점의 높이가 쓰여 있으며, 각 지점 사이의 이동은 지도에서 상하좌우 이웃한 곳끼리만 가능하다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/0e11f3db-35d2-4b01-9aa0-9a39252f05be/-/preview/" style="width: 151px; height: 122px;"></p>

<p>현재 제일 왼쪽 위 칸이 나타내는 지점에 있는 세준이는 제일 오른쪽 아래 칸이 나타내는 지점으로 가려고 한다. 그런데 가능한 힘을 적게 들이고 싶어 항상 높이가 더 낮은 지점으로만 이동하여 목표 지점까지 가고자 한다. 위와 같은 지도에서는 다음과 같은 세 가지 경로가 가능하다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/917d0418-35db-4081-9f62-69a2cc78721e/-/preview/" style="width: 151px; height: 123px;"> <img alt="" src="https://upload.acmicpc.net/1ed5b78d-a4a1-49c0-8c23-12a12e2937e1/-/preview/" style="width: 151px; height: 121px;"> <img alt="" src="https://upload.acmicpc.net/e57e7ef0-cc56-4340-ba5f-b22af1789f63/-/preview/" style="width: 151px; height: 121px;"></p>

<p>지도가 주어질 때 이와 같이 제일 왼쪽 위 지점에서 출발하여 제일 오른쪽 아래 지점까지 항상 내리막길로만 이동하는 경로의 개수를 구하는 프로그램을 작성하시오.</p>

### 입력 

 <p>첫째 줄에는 지도의 세로의 크기 M과 가로의 크기 N이 빈칸을 사이에 두고 주어진다. 이어 다음 M개 줄에 걸쳐 한 줄에 N개씩 위에서부터 차례로 각 지점의 높이가 빈 칸을 사이에 두고 주어진다. M과 N은 각각 500이하의 자연수이고, 각 지점의 높이는 10000이하의 자연수이다.</p>

### 출력 

 <p>첫째 줄에 이동 가능한 경로의 수 H를 출력한다. 모든 입력에 대하여 H는 10억 이하의 음이 아닌 정수이다.</p>


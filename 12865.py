import sys

N, C = list(map(int, sys.stdin.readline().split()))

K = [[0 for i in range(C+1)] for j in range(N+1)]

things = []
for i in range(N):
    W, V = list(map(int, sys.stdin.readline().split()))
    things.append([W, V])

for i in range(1, N+1):
    for w in range(1, C+1):
        if things[i-1][0] > w:
            K[i][w] = K[i-1][w]
        else:
            K[i][w] = max(K[i-1][w], K[i-1][w-things[i-1][0]]+things[i-1][1])

print(K[N][C])